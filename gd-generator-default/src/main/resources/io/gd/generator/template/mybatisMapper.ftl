package ${meta.mapperPackage};


import java.util.List;
import org.apache.ibatis.annotations.Param;

import ${meta.entityName};
<#if meta.hasQueryModel>
import ${meta.queryModelName};
</#if>

<#if meta.otherImports??>
<#list meta.otherImports as otherImport>
import ${otherImport};
</#list>
</#if>

public interface ${meta.entitySimpleName}Mapper {

	int insert(${meta.entitySimpleName} ${meta.entitySimpleName?uncap_first});

	int update(${meta.entitySimpleName} ${meta.entitySimpleName?uncap_first});

	int merge(@Param("${meta.entitySimpleName?uncap_first}") ${meta.entitySimpleName} ${meta.entitySimpleName?uncap_first}, @Param("fields")String... fields);

	int delete(${meta.idType} id);

	${meta.entitySimpleName} findOne(${meta.idType} id);
	<#if !meta.hasQueryModel>

	List<${meta.entitySimpleName}> findAll();
	</#if>
	<#if meta.hasQueryModel>

	List<${meta.entitySimpleName}> findAll(${meta.queryModelSimpleName} ${meta.queryModelSimpleName?uncap_first});

	long count(${meta.queryModelSimpleName} ${meta.queryModelSimpleName?uncap_first});
	</#if>
	<#if meta.otherMethods??>
	<#list meta.otherMethods as otherMethod>

	${otherMethod};
	</#list>
	</#if>

}