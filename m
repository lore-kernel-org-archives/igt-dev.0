Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55900C54E58
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 13:59:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54A110EAC5;
	Thu, 21 Mar 2024 13:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4VRxg6Q6";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E522E10EAC5
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 13:59:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ISF5LqLQchFGnVoIsmCrrs9RKWJH5QFqY3h4dx51YRBZaZVA6HFsjYQO4QN6vGKp8l9ctMAxJv/LQQpC18ee1D4UwrHX8OXz2t27wJoazJdIOGn9OV4uGTqOMsxZYfVzrC+GjS5+/D/LPb7veNxzQIKNaocr2xciOSYRtueg1sMBzIbYW24wzceK+bOkJhCygZvfiUKKuF2PdKxitjXoQbrnmjjF+ovf1EvpClPGNXJVYX2nMdyvSvEW8M4tAMMSX4dFt+nneM6n7b+x/ixwpFSWHRfegthB1PqE1xUb9AlKk0ncHWrBRbSaIStT6hFcS/bya/z5ZDhmovzLlWhE7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pp6ILfCtyWkHsc1Lw1Ryna+4uHw3XxJvErMSbdj7KTs=;
 b=hs/EIbCmfJclEv/3sBmUrJao1ibkyXl+wM04T8TXyHb2Ush4PITbW/3fOp49OxMF4w6g6JGdr+GIaaljJgw+IPH0ObjUDU5UmpGf9kBim5P1ylLr2LRMX88xUpJ5+zS/B0VcKTfMW2HrGPmFBtTabsvBIHDNwwpLHY31Em2UXQLnx8BP26EBq648EZfWrQBWhTRAVJs+nSkOlTda+msdJiIrhNqk5QdWWcw7avPNmddjJwXFAhMc/g++rV4ju0kmqRGrk64DheJK9CGB0cR0tpz9ajVKojvJeYFt/TFAQcl+spFatyq+3EfA7776kwD/4ZqQo7ikkXkU5DKxRWWb0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pp6ILfCtyWkHsc1Lw1Ryna+4uHw3XxJvErMSbdj7KTs=;
 b=4VRxg6Q6bnP0aXX5u+bj08CCrSZKdOjD4RwD3j2vfdqCwAMXP03D17yeZIsm1sQT6Y+6qteq2M9esg1p9YEalRuf+f55KNR7kvkx9Viey1nwGBnnaeVbww5XSErpHegytns0ZPnYo9Zc65OjqGd+SHhjn+8+FxZAX+yLWqL9Oxg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM4PR12MB8474.namprd12.prod.outlook.com (2603:10b6:8:181::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Thu, 21 Mar
 2024 13:59:16 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::8d12:60ee:8dfb:daef]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::8d12:60ee:8dfb:daef%4]) with mapi id 15.20.7386.025; Thu, 21 Mar 2024
 13:59:16 +0000
Message-ID: <8ca57ac1-af31-4d8f-b6fe-f0152852057a@amd.com>
Date: Thu, 21 Mar 2024 09:59:12 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tests/amdgpu/amd_vrr_range: Skip on unsupported
 connector types
Content-Language: en-US
To: Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
Cc: rodrigo.siqueira@amd.com, hersenxs.wu@amd.com
References: <20240321020354.843729-1-alex.hung@amd.com>
 <20240321020354.843729-2-alex.hung@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20240321020354.843729-2-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBP288CA0023.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::19) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM4PR12MB8474:EE_
X-MS-Office365-Filtering-Correlation-Id: 44def9e3-644a-406a-ce5e-08dc49af18d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AJf4ZX1w2qWAOgLsm+BfEaXw20iHceB7mVr0QgrGZJOjrK/KO1Kp9W6OkAwSI4grVY5Fk/8tCztmpo56fMspCvOSBUqN6muRbTKX5LrzQYWMFqwutI3GepfIIRsMOFKt1HMqS9itG27VrxssORN8X2MoS8DBKkJlmpo1wvcBbGIHYhIVHk+3+P/5dvzxqUh9+dPxUB8JZLeRiNznpzkOquUkmUy8d5h5vCzo4681Hwj1r2kgJlaHKIAe00hzQXtev3ZPGWpS51EhYHZauiq5iLwlZbCRNzLvp5RCBnssbKIJ6OwFEU0KGjSd5VOMYRbR8tzuWiKQon6c7jOobbdRYWvzgt0ZOUhzCLmCq5YhhLJ49X6uUR8c7blcvuGvTmWLPPSBiaZc4dY10NEJRhVqxRenpdnbaMJFZ26bccZTOJRhxOFB1ZspvfsGzPcKMYx4l9GoGmbhXayPjfEdXlg6keWkglDja0fb6Gj9wbWEHRXHnKtP2eFke2Y7rpnoocDcbvG09TPGdAyquTapwX3kbfmb7qiza5dmhxhjkZbyd+sSOpPTLBmkjvbaECQgwdODB7VURteo2/TDWWJL3bWGyDPUrF7uSEi9WZgBkL6ab7U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UldDY0t0SG9CQnl4NzVoeEZGeEFzbVhrZEpSc3QvSElzQlJtVFE3U3AvTkRa?=
 =?utf-8?B?OVRxczlJZXRkRmdoT2NxR3lxZzJkWEtyalppZllOeENTcWVRVmRReGhYRERS?=
 =?utf-8?B?NVhIOEdBaVN4eDdPdmVFN2Nvb0hDd0tSYXZUWXZkbG9jN1VLMVFyQzZ3V1c1?=
 =?utf-8?B?dmtUeC9POTlNZHhaalVGTFZ1Wm1zSkdEWVFqUGhlOStocktpRjJFM3JDQ1kr?=
 =?utf-8?B?YWxvT0JMU1pZSkVRdVVsc3diakxKV215VGtmNHdUTURHYVNERFlaL0ZjVUdV?=
 =?utf-8?B?TlVZTTI1V3V6RGYxMzFqQWtKTUowWUh6MXQvRWdCNEVJd29BVm0xNUVudkZZ?=
 =?utf-8?B?UGtjSEpEM3grbHdESHdXdVpkT0k5MnRDWFppNkJka2hvTDFXUEVCZTVKczJS?=
 =?utf-8?B?VFh2Z1JCR1R2NWE2UWUxa3hscWtiay9ON2pTR2FoVlBLcVIxRWJDeWlQTFhI?=
 =?utf-8?B?WDZ6SVgvbzBYL1p0QmVvbzI5UDU0azljWWNwbWx0b1BzK1dJTjRlOVRoZG5i?=
 =?utf-8?B?KzdKSDV2a0NDd29aSDlFSHlNVVNMUit6VHhKYmNnWlZwUE10dFdhQ3NBNGJn?=
 =?utf-8?B?Ky9qRXBYK3ZES1BDUEw4b3cyUWtab2lEQ1RQcWltUXhUTEVUQ3RUL3VPNHZE?=
 =?utf-8?B?a1BXTVdwd0Zvc2dyUEpEK1krck02L2dvME9TZUNRQ3hzbENlMUsyK3pGVnp5?=
 =?utf-8?B?cWJxeVh1RVo1WDZCNlNlVXNoUkw3VjBodXE1Rld2SkVraEx1WFQvRC9NV1pK?=
 =?utf-8?B?S0VWTkJ0ZE5Ga0tGNFVPVlR6MDEraW1CdzRzcmtNV0krWTNwUG1FbW5VWXNy?=
 =?utf-8?B?NmV4R2ZQeUZ2eUdLa29GbytIQUhLelNTSGoxY1F3d0FzQkIvcU1UaXRPWTRV?=
 =?utf-8?B?MklsVDV1aUhmVzc1OEFlWVFZUCtlcllJcmZ1MzNucld2b0FVTnBtdVdQa1Aw?=
 =?utf-8?B?c1RoNTlNa2IwNUxmaWZZZ3p1YmdjbVVReDVMUW83MjRWYkRHUC81Z3ZncVRa?=
 =?utf-8?B?Q3FYZ0VRVHpYS2dRYlJCVXVvRjFZS2xqNUs3WFBRWU5HekRKZDg1dzhFbkVX?=
 =?utf-8?B?YVVJM25wWWpIUXpHNHF3NG1lZWduSFo0Y1NvMVFPK0dYTWNON2tPN2dNZ3Vi?=
 =?utf-8?B?bFZRLzVtcTJhZWR5OVdNbUpzOFRzNnF1VXZ5a2FMMFNBNGR3ZmtIRXFTMnZE?=
 =?utf-8?B?d2xna0tEOSs0NUpEaFV1eFY1Mk5zQWRlZWhYeVJMamxYb0FHdExHa0poL2pZ?=
 =?utf-8?B?QUZ5TXZnR2JzWFdubmZ2SWg0UTRoS2JBRnVUVS9MeHNqQk5jQkUzbmpkbVNm?=
 =?utf-8?B?bmlNMUVRcjRPbU1GdXk2Y1VDOXZKYXFkRU1WdEhLVXdTelM5Qzg2VzlUV245?=
 =?utf-8?B?cjRGOURxWjNtNmNzcy9XN2JkdTlwUzNXS2tKQVpHbHgwZHMvTU9pUm1sZzZ0?=
 =?utf-8?B?Nnd0SXZPMnlnRllwQU9IUXlXK3QrVzRxaVd2RjF6dFZ3Q0psSTAycXI0cUNF?=
 =?utf-8?B?M0hrVU9uOTA3ZSs2L3dxalFnUXQ1MmtsWVczbEk5RUQ4WGRkdTRSbXdqdC9l?=
 =?utf-8?B?UzI1TW1mYW9nZmhmS2RKNGFVb1ozbnNvZExnb1hUeXZ0aVhLZTk3SkVXZXEw?=
 =?utf-8?B?VDJtNmVWRnFISFhsM0RKdkZFMTBKVDdhNjFDYVd5WlRxenc4RndxaWExY1U3?=
 =?utf-8?B?OWlBZDE1OU10UmpQVXdQeXFDNGI4K1FKS3RUc0kvcFlWOTBYNGg0cHlNbG04?=
 =?utf-8?B?SzR2QkZEZVhtdUNvcXR5SGt4K1IrTGhBam5PQ0Z3RFFMajQ0VWNZWG1hcVFq?=
 =?utf-8?B?TnJUcFlxb2M5VllPTU0yOWlYSXcxdzJMWjlWWFZSUTlPOTdlWEhoMFIxdFkr?=
 =?utf-8?B?VzRiRjdqZGpQZ2luSE1YVEprYml5R3lvZ3BtUG9rM3U4dFhnOFNSMTV1T2Zs?=
 =?utf-8?B?d3YvaUxyMTZaanlmejBuOUNCS0xHRU9JVG5TS1g0dVVwY08xVEJjb1NZWWky?=
 =?utf-8?B?dVFLVkhkcWI0Z1VsY3Fja09YL0JpV3lMWXVLV2dFdEFEdVlKbmdQT3dmSWZS?=
 =?utf-8?B?THlEbXhFZFBhQk9MZkgyL0lIYWdTLy9kbXJPRUdQeWlZZ2k5U2VjOWRqTEFl?=
 =?utf-8?Q?ol5DAtZ+4OpVZ35iL9wUr2Dti?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44def9e3-644a-406a-ce5e-08dc49af18d5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 13:59:16.6085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0v4cIMN9OhVeth2BWu+S06BLNlk4YQT626YV/raRv196NXScI/mP4eOyBsYBrtBk0S1xadKd39tnSeh4hqAj1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8474
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On 2024-03-20 22:03, Alex Hung wrote:
> edid_database includes a set of EDID but does not includes one with
> connector type == DRM_MODE_CONNECTOR_WRITEBACK. With writeback connector

Writeback connectors don't have an EDID. See
https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#writeback-connectors

> enabled, this will always fail even if writeback connector does not
> support freesync. As a result, freesync tests is skipped when there is
> no match in edid_database.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  tests/amdgpu/amd_vrr_range.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/amdgpu/amd_vrr_range.c b/tests/amdgpu/amd_vrr_range.c
> index a77895622..79db6f9c4 100644
> --- a/tests/amdgpu/amd_vrr_range.c
> +++ b/tests/amdgpu/amd_vrr_range.c
> @@ -208,7 +208,6 @@ static int find_test_edid_index(uint32_t connector_type)
>  		}
>  	}
>  
> -	igt_assert_f(0, "should not reach here");
>  	return -1;
>  }
>  
> @@ -268,6 +267,8 @@ static void test_freesync_parsing_base(data_t *data, uint32_t test_flags)
>  	for_each_connected_output(display, output) {
>  		/* find a test EDID */
>  		j = find_test_edid_index(output->config.connector->connector_type);
> +		if (j == -1)
> +			continue;
>  
>  		edid = (const struct edid *)edid_database[j].edid;
>  		expected_range = edid_database[j].range;

