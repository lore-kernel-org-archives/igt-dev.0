Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B050C02181
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jan 2025 16:20:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A21B10E43E;
	Mon, 20 Jan 2025 16:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="n1j4gsq6";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::619])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276F810E43E
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jan 2025 16:20:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLtPzEg41G9zc+viS39wdHY/6oAZD8+qqqJGoIUrR8N4IJBo+o6MkZlid8+f99WgZUq61OVnJISAs9Y3s++Nn4aRT/2Poq/+7j4Fco8Soqx9GCrGNR4ELLzq9jPgqHT+2aRAhQZ5Mm+uSNzpJorsX56sgv7lFAtWXVfCu+iR/7IkxpIKP3oO974RMJZEYAY9hI62+UpuYdneB6I4ZntUmVJtKAC3wYDsIYiqpZfLyl5sxNVN7nxS9hzfuluB2DDxCqRn/jLGZFZsmjTC6lW0LDqPgCBIkoPJHOApcUAM2FH2YGR/Y9YcgLwyWnN5p2gxMrwy1oumztDp4LBTG8ygbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmbzeF31ofK32hGwZD4YyPCby1gTaQYnB0rJul+K9zw=;
 b=e8mJc5fhAgE+Mh1Q61XlJKe8qY6MNjBum/bEpDCDmeA0iNGqmerYWdJ7PnCI8MlzRaCh1cKCQsAE/DGGnVXWcbtzZ16du3QDa+ucON/bEeZXfK+O0o7uLalDkVAZN4EgnZMzZhKgWcW90lr/LM9Er9HP4XEWk31lsJ7/nBN4xNUZioqQzj0X7ocpuo31QCHtbDwYQUtaMojpnH6JRdid0tN4hrkDtCsvO3P7ipnbsiWAo0kTx7oFC4CLtRtGE1bqhLGbdChHZe60AcF2X4PjQTkboj85jY+KNBlOuazZlnRE0fX2xXUemie7/7fzqolYAJgmzjL290XbcN7KG0fnJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmbzeF31ofK32hGwZD4YyPCby1gTaQYnB0rJul+K9zw=;
 b=n1j4gsq6ix+w03TamxBmK5GYdh7aTItMtAVz9H793BAJ0KFgG6d5bPt30/F2MYSoDkm/vK9388JuJqbe8mRZgOMw0Z7fk9s0S/g6Nzy7pCai9ekffXhGjF7tdDJlDgFkSYGK+Ur+mEWssdeGMJ7vzW7oiS+8v4cKWuP+iNRV7Ms=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5300.namprd12.prod.outlook.com (2603:10b6:610:d7::22)
 by BL3PR12MB6617.namprd12.prod.outlook.com (2603:10b6:208:38c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Mon, 20 Jan
 2025 16:20:54 +0000
Received: from CH0PR12MB5300.namprd12.prod.outlook.com
 ([fe80::5313:a4b0:89d7:7b76]) by CH0PR12MB5300.namprd12.prod.outlook.com
 ([fe80::5313:a4b0:89d7:7b76%4]) with mapi id 15.20.8356.010; Mon, 20 Jan 2025
 16:20:53 +0000
Message-ID: <56b39a53-6b47-479a-ab39-990c91161f38@amd.com>
Date: Mon, 20 Jan 2025 11:20:51 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v2] tests/amdgpu/amd_vrr_range: Fix panel cannot
 light up after test
To: Tom Chung <chiahsuan.chung@amd.com>, igt-dev@lists.freedesktop.org
Cc: Rodrigo.Siqueira@amd.com, alex.hung@amd.com
References: <20250117100101.4282-1-chiahsuan.chung@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20250117100101.4282-1-chiahsuan.chung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0184.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::18) To CH0PR12MB5300.namprd12.prod.outlook.com
 (2603:10b6:610:d7::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5300:EE_|BL3PR12MB6617:EE_
X-MS-Office365-Filtering-Correlation-Id: c78cc808-bf71-4376-8512-08dd396e6965
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGZuNW81Z0hzSkc3OXZ5Q3lYMnd4NFc3YkYzQk1yY0R2UVlYSHVGdTFSUExH?=
 =?utf-8?B?d2RUNHZscktvdWRCdTdZa1BlUUcyWFNRd2NDRjg2aGtOZXQzTkI0WDJ6UlVl?=
 =?utf-8?B?TFRxSTV0RzRYeG5vMURqWWtqdWNLNEcrRWdZUGorZ3RmbDJ6ZVFvUEhBQU1Z?=
 =?utf-8?B?QUJnaGJ4ZHEzZ1ZrdXZjNkJONExUSklITktJODYzS3RLRWgvNitQZWd1VVNQ?=
 =?utf-8?B?K2FUd1JNa1ZkZis2TElYWEc3U3VPVS91R0ZlUGZNSkZVUkw3RjRDdWxjRkRZ?=
 =?utf-8?B?ZGk5bmdRL2VIZnhMdWNyM1BOeU50YVIyLzVRaGs4b2VOVE9xaDdTRmFydzZM?=
 =?utf-8?B?akFnWDUvRERQOUdDMFRKODQvdFVKTDV3NjZ6QVFObjdySmJlNmpkR1k1aTVq?=
 =?utf-8?B?NHNwU1dLNWVNWnBZOWNBQUxrRld6K0R5NDVGOHJTUHpmcCs1N0FtTU4zTUZy?=
 =?utf-8?B?ZUF2MmhCaDU3RmNQemhnSmNzRmI5MmgraksyVXg4Qk9YNUY1NVB3ai9NTy8w?=
 =?utf-8?B?aXVMU1BCYmdLcWZOTXJVN0htK0FKc0czcGlUNDRaMC9XaCtYcjFFL0dQek02?=
 =?utf-8?B?bUpuOElRRGtrYzlvMUgwOEdHNlNFeTBPdFVrSERrdTd4bUxpY2FaMEdYaE9o?=
 =?utf-8?B?c3FrMllYVmRHMmtQUHl4cmhPSXd6b013LzZrREsya20venZycTJJU1hjQnY4?=
 =?utf-8?B?dEQ3WkJDLzh1OW9iS2cxK1hIamJEcTVGYmNCUFR0b3M2U0JWV0hXcUphdk9Y?=
 =?utf-8?B?cm1DRkV4clY0NVdYSEFqNUNUR2lsVC9zTjBReDhMWTJoVDhnOUtZd2tzNGpY?=
 =?utf-8?B?RkR4bGRqbEFVT2NnZmRHaVFZcGQxS3ZRYWdhTDJqZ0pONXZYY29tNEdCMTJw?=
 =?utf-8?B?c3cvS2diVFRaNVIzZVRhemljTWd6L2tzanRqUVRCVW9LZGcrUXF1UzY4N1BH?=
 =?utf-8?B?QVlVa1htUGVMeTc0WjhlbFVCSWpZNmVYNWFQM1Zpd0ZBK2tiQk0wS0ltMzkw?=
 =?utf-8?B?UWlyTVZGdnZtOUZCY1Vjekd0enpocERNc2VtaEJGTEEwdnE5TElHRGIvVkY0?=
 =?utf-8?B?andIL0liNDVlVVBZclB5VC9pNER0Z2ZSZzEvRXZtZ1hHNjkwY3FDSmtVNVov?=
 =?utf-8?B?ZkNuMFUwdWN2cytjSnFuSUNMdDIzR3Y4b0QxYzVXY1A1WFplbG5NVWdKWjdj?=
 =?utf-8?B?Q0I3eTdaNXlFRFRCY3d0dC9mRmhVMDlKNmZWRDUvTjgwbGZib3YwK1BuUFNH?=
 =?utf-8?B?UE9VUnhSblZvOVMvcTlLai9sNnh4TGdYOVFXQWswMDloSlBROERTcEdTcHg4?=
 =?utf-8?B?YUtxWTZYbFhDVlJoQklEdWFNWEEzVUlEZytDLzhkSE9TYkg4NEllRitwcnkw?=
 =?utf-8?B?ZUxOOG95UWdEYTVSY1pQOFBqUUo1aDloSWpxaE5uL0IzbHRBNUYrYkxmTnpI?=
 =?utf-8?B?dHk0VGFjbVExdEZCMlZEQmlVdFFuZDJsSTJJQXFyZHZXZnBuT0tOa2hxbzZx?=
 =?utf-8?B?SFdhRFhhUTRUUld3NEpzWE0wUWV1ZEFiNGtDcTRhcG1hNTl5N2FQRUJqY2pL?=
 =?utf-8?B?dlBPVFlZL2xDcEFlK015WDQ3TC8rQ3ZadnlMdUZhRHU1aG5GMWNrcmlqR1Uz?=
 =?utf-8?B?c2JqZkpBbHVFbEJGWE1FYkNQOTJJWEtlVW1Yb2M2U0JlcGg3ZXEwTHdUeDVa?=
 =?utf-8?B?NkJrdVVvdXFLcmdYN1BwSHQ4L3lKdVNmajk2MExhUlkvbGg2NVdsU2ZjZURt?=
 =?utf-8?B?a2ZCa0NIYzltcUlXWkJjREFsVjNzS2JDR3RvZjBCK2l5MU1uTjZJaWVtUlIr?=
 =?utf-8?B?MjkrZ1J3RDVnYWF4aE1idnBrUE4vY0hNc1QrN2dRMDZHRDYrajcvbENQOURE?=
 =?utf-8?Q?UlPhI5KDQqvoY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5300.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmZ6K3VSWjFEdjh2aHludExUZlc2bzVKYmd1WUhyTGRpTVI5TFk0UmJoTVo1?=
 =?utf-8?B?VDd3TDJmbFBHN2cvaElKbk1yb0YveFFnUDhBbTFxajZRUTgwOHNIdnVwZDEx?=
 =?utf-8?B?cXRNUlUvdFVETWlhRTBNOXRDTGpRa3liUWc2eitRTDc0UU9vUHFqM2RJUjY2?=
 =?utf-8?B?VzQ5TVlRUkZpb2FNdlkzUjR1YmpBem12Q012Y1FnblgwcjhIbjNmSWZ2T1lr?=
 =?utf-8?B?UDlmMFhGbWNMWHIrUFpPNUVwRC9JOGVTZG5FU2E5RERKNTlzWUltR0xyYVJH?=
 =?utf-8?B?MTZCS0YwbHcxTWRPbGUrRnRqOG5vbE1QUlFRWjNBVUFjVGIxcmoxem14MzZa?=
 =?utf-8?B?ZXRjSDhEeG9oZmx6aW9pdDA1TlNGUzZOdi9KVkd6LzhDMzFWQXdFbzhBU2s4?=
 =?utf-8?B?RkNkaTZweHB3ZFBaL2ZkUGpCanloTjB2cm51cGtkRVNVanFqZ1BSMURsd0VE?=
 =?utf-8?B?c2UyQ0FmdFF0QVkvdUNRVEF5dHdMbFJMTllNRndqV1Qwdm5xazBpTlhJS09j?=
 =?utf-8?B?OXZWcnpDLytLYm5rNDdzc2hwRDNOOHptV2JENk9mazdHa3NDR0Q5ZFIvdXhP?=
 =?utf-8?B?L2VoN3pJVkNsaDN3QldBV2ZDNDlBUUl4eXNzYWdsMjBVQmFlR0ZlR2JqUE9U?=
 =?utf-8?B?OE5jNmg1cVBlZUhJbFRod2xvanEwRWdJTlp0RXJWdTNuQmtHaUNKQTNFY25r?=
 =?utf-8?B?UmY3VnE2bldMRWJjVEZBdFFseTVQbytLTGN5cnlqNkdSd2pVTTR3UGlBckNy?=
 =?utf-8?B?UjRhaUZUcmF6bE5uYWRldHpYcExnK3AvZS9XT09oVzgxL05OSUNJN3FlYVVx?=
 =?utf-8?B?aXJJU0xNcWN3elNmRkIrREVQcnhxYlNjbG1JVENwTi9nRXFUUSt6OWJkd3dZ?=
 =?utf-8?B?bzNJTjY1Y3ZjNVZMSXJqZjNnVWphZjhNTzEyS2lWSGc4Q1I2RGI3R05mMHRL?=
 =?utf-8?B?NFVCOG5iWXdkVnREZnR3UTlsWjVpTzRaWW9qU2tTTGNFWjBCYnZaQ1pDSkZZ?=
 =?utf-8?B?UGVvOWZubHRNN3pRWExLYkFybmdzc0RHbU1mamovMUMwejc5NEw2UDFxc0ZG?=
 =?utf-8?B?TXRUNnA5Y0tIbUZsLzBLa3V4eFN2eGtNeXhJYm9MZXdodDFEb2FrOFNiN0dH?=
 =?utf-8?B?eGlTM1lxY3Evd2hCdlNzM09leUJHT0pXVXV0YStzdXJoSWMzbFpWTXY0NS9P?=
 =?utf-8?B?QzZPbU1PQjBKVG1HeGtEUEpQYS91K3dScnhyd29MS3hDSllGVzhydW1xdFpD?=
 =?utf-8?B?WGt2d0w3TEc1MThGcFRyZlNuUG5Bb01scVhHVnd1KzEvRnhaSXFEYkJHR3Bv?=
 =?utf-8?B?ZDRzR2ZOQ2dwN2VvQTExZjN3bFBDVXpqVUpEYkVtN3E4ZGJ4TzkvOUVFWHRu?=
 =?utf-8?B?OWlzTWgvS3hLT3RKRXJaOVBIK3RKVGR3c0NhT3FzNGh2cTZ5S2VmcGNCck1O?=
 =?utf-8?B?WFluRkNlcHFWWnExcm0rOXBUTjdJbFFiU01Na0ZBRTcvU2lvZzFxQTVubDE3?=
 =?utf-8?B?aDBPUlJlSDdjY2RrbXRLcnVMdFZWY1JxZTdDQ0o0VUxKQW1pREloQUFhUkhw?=
 =?utf-8?B?S095OWFlMExLTWsyWEZGQ3hsMUdHQnovTnpIaWJTMWcranBpTGdETFEwWTBj?=
 =?utf-8?B?eHhGT1pVQkpDTFZ4WUNtRW1HZ2N3b2lxVXJkVUg4U3NYcWExSWRIdUhMSkFv?=
 =?utf-8?B?a0Yxaktya3IzQ0lXWjF0T043WWttSzk2MmJBV0RWU0p0dkY5UmJGMkRvMVBE?=
 =?utf-8?B?Zm44RUhkRHZRL3ZWUUFFb2h0RWlNUjNta0cvYzJMdDNEZXg0Kyt4SmVkTUVw?=
 =?utf-8?B?YnJoYjhXMEowMzgvbjcvOTRGekc5TzVFd1NZWHJHMTdrUW00a1lZNXpwVS9X?=
 =?utf-8?B?ZmdMSGpJSFQwdGN2SlhkTDlSaFFzdUFQa2QyNWRmSit5dDlPOU1zVVpIOVl5?=
 =?utf-8?B?Y2dBTFdWWHdtaEVsQ0lCTm5tejM4Nys4Znd6Y1FhZEN6NTJla2NOUEpVUDRQ?=
 =?utf-8?B?SkFOMm12Z244NXQzeGFvT01zTWsrdEMrc0xvWXR3cFdQYUVObTBJemdydHB3?=
 =?utf-8?B?WkdVYmFNWi9ZaU5sUnk5QytrMWRubVRiejI1MDBXNWxuQng4MlEwQk1WS0Qv?=
 =?utf-8?Q?YUBzB3o5XIv5v6Q3kiKAIPgpp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c78cc808-bf71-4376-8512-08dd396e6965
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5300.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 16:20:53.5579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dLnKk+0Ll9dlXE5mLrpUDEPCXNIzmcQp0QG8pndySKxgtQpOGeloWZqSvSnulxKe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6617
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



On 2025-01-17 04:59, Tom Chung wrote:
> [Why]
> If the sink side support VRR, override the EDID may cause sink
> side cannot light up.
> 
> [How]
> Just parsing the VRR range from sink side EDID without override it
> if the sink side support VRR.
> 
> Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
Reviewed-by: Leo Li <sunpeng.li@amd.com>

Thanks!
> ---
> v2: Move igt_amd_trigger_hotplug() to non-VRR sink only
> 
>   tests/amdgpu/amd_vrr_range.c | 140 +++++++++++++++++++++++++++--------
>   1 file changed, 110 insertions(+), 30 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_vrr_range.c b/tests/amdgpu/amd_vrr_range.c
> index 79db6f9c4..9d2462e5e 100644
> --- a/tests/amdgpu/amd_vrr_range.c
> +++ b/tests/amdgpu/amd_vrr_range.c
> @@ -29,20 +29,23 @@ IGT_TEST_DESCRIPTION("Test EDID parsing and debugfs reporting on Freesync displa
>   
>   /* Maximumm pipes on any AMD ASIC. */
>   #define MAX_PIPES 6
> +#define EDID_SIZE 256
> +#define EDID_PATH "/sys/class/drm/card0-%s/edid"
>   
>   /* Common test data. */
> +struct vrr_range {
> +	unsigned int min;
> +	unsigned int max;
> +};
> +
>   typedef struct data {
>   	igt_display_t display;
>   	igt_plane_t *primary;
>   	igt_output_t *output[MAX_PIPES];
>   	int fd;
> +	struct vrr_range expected_range;
>   } data_t;
>   
> -typedef struct range {
> -	unsigned int min;
> -	unsigned int max;
> -} range_t;
> -
>   /* Test flags. */
>   enum {
>   	TEST_NONE = 1 << 0,
> @@ -53,7 +56,7 @@ struct {
>   	const char *name;
>   	uint32_t connector_type;
>   	const unsigned char edid[256];
> -	const range_t range;
> +	const struct vrr_range range;
>   } edid_database[] = {
>   	{
>   		/* EDID Version 1.4. Timing requires 2 DP lanes. */
> @@ -212,12 +215,12 @@ static int find_test_edid_index(uint32_t connector_type)
>   }
>   
>   /* Returns the min and max vrr range from the connector debugfs. */
> -static range_t get_freesync_range(data_t *data, igt_output_t *output)
> +static struct vrr_range get_freesync_range(data_t *data, igt_output_t *output)
>   {
>   	char buf[256];
>   	char *start_loc;
>   	int fd, res;
> -	range_t range;
> +	struct vrr_range range;
>   
>   	fd = igt_debugfs_connector_dir(data->fd, output->name, O_RDONLY);
>   	igt_assert(fd >= 0);
> @@ -249,13 +252,84 @@ static void trigger_edid_parse(data_t *data, igt_output_t *output, uint32_t test
>   	usleep(1500000);
>   }
>   
> +/* Returns true if an output supports VRR. */
> +static bool has_vrr(igt_output_t *output)
> +{
> +	return igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
> +	       igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE);
> +}
> +
> +static void parse_vrr_gange_from_edid(data_t *data, uint8_t *edid, int index)
> +{
> +	bool max_rate_offset = false;
> +	bool min_rate_offset = false;
> +
> +	/* Check Bytes 4 Vertical rate offsets
> +	 * Vertical rate offsets:
> +	 * 00 = none;
> +	 * 10 = +255 Hz for max. rate;
> +	 * 11 = +255 Hz for max. and min. rates.
> +	 */
> +	if ((edid[index + 4] & 0b10) == 0b10)
> +		max_rate_offset = true;
> +	else if ((edid[index + 4] & 0b11) == 0b11) {
> +		max_rate_offset = true;
> +		min_rate_offset = true;
> +	}
> +
> +	/* Bytes 5 Min vertical field rate (1–255 Hz; 256–510 Hz, if offset).*/
> +	data->expected_range.min =
> +		min_rate_offset ? edid[index + 5] + 255 : edid[index + 5];
> +	/* Bytes 6 Max vertical field rate (1–255 Hz; 256–510 Hz, if offset).*/
> +	data->expected_range.max =
> +		max_rate_offset ? edid[index + 6] + 255 : edid[index + 6];
> +}
> +
> +static bool find_vrr_range_from_edid(data_t *data, igt_output_t *output)
> +{
> +	char edid_path[PATH_MAX] = "\0";
> +	uint8_t sink_edid[EDID_SIZE] = "\0";
> +	const uint8_t range_limits_head[4] = {0x00, 0x00, 0x00, 0xFD};
> +	const unsigned int range_head_size = sizeof(range_limits_head);
> +	int fd, i, read_size, index = 0;
> +
> +	/* Get EDID */
> +	igt_assert(snprintf(edid_path, PATH_MAX, EDID_PATH,
> +			   output->name) < PATH_MAX);
> +
> +	fd = open(edid_path, O_RDONLY);
> +	if (fd == -1)
> +		return false;
> +
> +	read_size = read(fd, sink_edid, EDID_SIZE);
> +	close(fd);
> +	if (read_size < 0)
> +		return false;
> +
> +	/* Find Display Range Limits Descriptor block */
> +	while (index < EDID_SIZE - range_head_size) {
> +		for (i = 0; i < range_head_size; i++) {
> +			if (sink_edid[index+i] != range_limits_head[i])
> +				break;
> +			else if (i == range_head_size-1) {
> +				/* Found Display Range Limits Descriptor block */
> +				parse_vrr_gange_from_edid(data, sink_edid, index);
> +				return true;
> +			}
> +		}
> +		index++;
> +	}
> +
> +	return false;
> +}
> +
>   /* Check if EDID parsing is correctly reporting Freesync capability
>    * by overriding EDID with ones from golden sample.
>    */
>   static void test_freesync_parsing_base(data_t *data, uint32_t test_flags)
>   {
>   	const struct edid *edid;
> -	range_t range, expected_range;
> +	struct vrr_range range, expected_range;
>   	igt_output_t *output;
>   	int j, test_conn_cnt = 0;
>   	igt_display_t *display = &data->display;
> @@ -273,25 +347,38 @@ static void test_freesync_parsing_base(data_t *data, uint32_t test_flags)
>   		edid = (const struct edid *)edid_database[j].edid;
>   		expected_range = edid_database[j].range;
>   
> -		/* eDP allow read edid for each display detection */
> -		if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP)
> -			igt_amd_allow_edp_hotplug_detect(data->fd, output->name, true);
> +		if (has_vrr(output)) {
> +			/* A VRR sink, just parsing range from EDID directly */
>   
> -		/* force to use hard coded VRR EDID */
> -		kmstest_force_edid(data->fd, output->config.connector, edid);
> +			trigger_edid_parse(data, output, test_flags);
>   
> -		trigger_edid_parse(data, output, test_flags);
> +			igt_assert_f(find_vrr_range_from_edid(data, output),
> +				"Cannot parsing VRR range from EDID\n");
>   
> -		range = get_freesync_range(data, output);
> +			expected_range.min = data->expected_range.min;
> +			expected_range.max = data->expected_range.max;
> +			range = get_freesync_range(data, output);
> +		} else {
> +			/* A non-VRR sink. Override a golden EDID */
> +			/* eDP allow read edid for each display detection */
> +			if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP)
> +				igt_amd_allow_edp_hotplug_detect(data->fd, output->name, true);
>   
> -		/* undo EDID override. re-parse EDID of display */
> -		kmstest_force_edid(data->fd, output->config.connector, NULL);
> +			/* force to use hard coded VRR EDID */
> +			kmstest_force_edid(data->fd, output->config.connector, edid);
>   
> -		igt_amd_trigger_hotplug(data->fd, output->name);
> +			trigger_edid_parse(data, output, test_flags);
>   
> -		/* eDP dis-allow read edid for each display detection */
> -		if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP)
> -			igt_amd_allow_edp_hotplug_detect(data->fd, output->name, false);
> +			range = get_freesync_range(data, output);
> +
> +			/* undo EDID override. re-parse EDID of display */
> +			kmstest_force_edid(data->fd, output->config.connector, NULL);
> +			igt_amd_trigger_hotplug(data->fd, output->name);
> +
> +			/* eDP dis-allow read edid for each display detection */
> +			if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP)
> +				igt_amd_allow_edp_hotplug_detect(data->fd, output->name, false);
> +		}
>   
>   		test_conn_cnt++;
>   
> @@ -317,20 +404,13 @@ static inline void test_freesync_parsing_suspend(data_t *data)
>   	test_freesync_parsing_base(data, TEST_SUSPEND);
>   }
>   
> -/* Returns true if an output supports VRR. */
> -static bool has_vrr(igt_output_t *output)
> -{
> -	return igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
> -	       igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE);
> -}
> -
>   /* More relaxed checking on Freesync capability.
>    * Only checks if frame rate range is within legal range.
>    * Display under test MUST be VRR capable.
>    */
>   static void test_freesync_range_base(data_t *data, uint32_t test_flags)
>   {
> -	range_t range;
> +	struct vrr_range range;
>   	igt_output_t *output;
>   	int test_conn_cnt = 0;
>   	igt_display_t *display = &data->display;

