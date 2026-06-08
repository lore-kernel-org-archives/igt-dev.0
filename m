Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D975CD8C92
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 14:46:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E546610F533;
	Mon,  8 Jun 2026 14:46:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LLs5FQ+/";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013024.outbound.protection.outlook.com
 [40.93.196.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F7810F52C
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 14:46:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=auto7SSaMBd39wgQP+V0OhjR9PURkzG5dcBh8AOKrOzNqeDAOKxLiAN6UEo0hBs+9EhlYpSl9l/S7L32w/faq5OJM/KLyadCWPmsZ/usK9vLth9bDXFnBl5G4gd1ZHLLmDyPSPksHrsBFQ6m59pm0axnz7pEI9wastWox/N0q1no2WmR8GDRC//pxwt1k376WvCBI5EO5koEKxxdnrvMe78GVtsGdwLLoSH1/cLjPv7f/F6kJc578LTHkYuRXzLVggmpzixMbMmts5CURsrILGOtRTm78ANiILT22hMoFTIHIBj32jeHDavFpSK5kAap7SzElmuAFVQyVlUSB8QROw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oP4gG5Z/aFv+rJ5cNMd1kgLx862QGZCQoO4p+7MyfLA=;
 b=xd1cR778CI9CJu+fz8mBJykUer7WccM/WJ2YE+mWz52wIrxydilEhJ0EWmB+ZEijRc6HG1EzDHVrrDOvjD8tKE/J7vbybRdObCf15sxylTfV8KKACK067fdAnVJ6D/nD4QBiRdDuLU1QKTrzMaJ/HXZJ6CkbWQtPfOZQ91TThvAoH7m1lb21VRbuA+XLX3y8Nj1nVKAXcN+AY7n33Fj4zaelkb2kj/W3L8bjJFmHIGylBGfi+Ug7NsfpLsAxbW4988wcBBg5nQrF6jIXC14uw+i9EcNaRFzI8hJhO2Zw2SBKzEA9NhDXGnxmQyismSsoPHp2PBn4AGKIGO2l9LF1Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oP4gG5Z/aFv+rJ5cNMd1kgLx862QGZCQoO4p+7MyfLA=;
 b=LLs5FQ+/tvsJDTbTiot/ETZvMMu9T6DctdAFF02uYsmaPJDs77CvEEv+OlTLjVwE+eXlKz+OsrA5AZmCa8Vh4xTaDcLJ+uqre7eZaDA6CwjKVfPo9+wMhTcLuvGOTtTdtwcgqG4GdCFsBTMo21+LYfCs+UFIzhvX+r2iwUoeNTk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CYXPR12MB9385.namprd12.prod.outlook.com (2603:10b6:930:e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 14:45:59 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 14:45:59 +0000
Message-ID: <6464f77e-72ab-40ad-8641-8c8e3d918544@amd.com>
Date: Mon, 8 Jun 2026 08:45:57 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/amdgpu/vpe: refactor VPE1 blit test
To: Caden Chien <chih-wei.chien@amd.com>, igt-dev@lists.freedesktop.org,
 vitaly.prosyak@amd.com, jesse.zhang@amd.com,
 Jani Nikula <jani.nikula@intel.com>
Cc: Solomon.Chiu@amd.com, Peyton.Lee@amd.com, HaoPing.Liu@amd.com,
 Yu.Wang4@amd.com
References: <20260602114025.649389-1-chih-wei.chien@amd.com>
 <20260602114025.649389-3-chih-wei.chien@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260602114025.649389-3-chih-wei.chien@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0077.namprd04.prod.outlook.com
 (2603:10b6:303:6b::22) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CYXPR12MB9385:EE_
X-MS-Office365-Filtering-Correlation-Id: 290493d8-9abf-41c6-00d4-08dec56ca763
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|20052099010|56012099006|3023799007|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: EDYWuBKnVi65hBT6ovr5L7xZ3NJAYdN2bDUFIl+q2FDz2bNgPxMuBgN+cRL61I5T1yNKtj6nWW2aEehQJScutOyfdvar+ttntehLQVLFUrqUnxXOnQdesysAKO0SWKly4DZ7n3QhVzG/sHay1ThVRblsMkztj4Q5pTbMeobTBYuPXzFcL2kOMocQhesvgxAdmouRQM5J22Y2cJkUuJKD9yf+YCdaWuaNStLrxXQbEtFghWOpZ3xYeJu4I9l39pXY8UMIAnbecoXvwkSXsY/09SAMhCJYGayqHrQXOgsitdR99bC/UEBngMq3RpHu3QxMYakUYQRO+lMKjZc3zcKb5zqo/CpDUkYkXzdV8tZPWk3bVHECmObsIx3UTbkgAujUxDHVPTvgky0zdzYyv1Laefsz6gFiiumbTwggIR7NAxMJMk93x1C2t7+hWphfqsqlbzPoky4+Yheswa9cWZ0pS/dfZcmwCi/ofzq+S1rFduRIIrr0ece38wN1yK2xVES6o1VLIs5WdL+/ULaf19he3BRbVa86eQfncrC+MqFIl5oqUlJKpeZO5PHnZGYL5Q8QSlAtH2PYDSPzJQ8YsBKYpncVTX6VIke77Vz9hK8OeL5lMqWEeetSp2NGAgVBBb2D8cU5QsknwcEuDEY1Utl1WMf9v+wHCIXePSthvQojqOZNUqTAFvbp2jp6TLk19ytC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(20052099010)(56012099006)(3023799007)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QndDY0ZzekczY1MxUk04U1prZU83L3BHYkhPQ1V2U0hBT2NqNzVLTEVicDdK?=
 =?utf-8?B?NThjSmE0TWNCMHpDbVFaR1QzR3RvRnhhNHY2UmVqbU4vZ3YzUkt5dTNNWTdw?=
 =?utf-8?B?MTVhL0RnVEJMMkJOT3hNVXpIWVFWKzZsRGNZVldFc3BPK3ljeHRLcFI5K0pu?=
 =?utf-8?B?T0lxNG8rRkxibUxMREF2S0Y5OThobzc4QlNoZGJRejI4czkyTjdGbU9CNmRw?=
 =?utf-8?B?ektJbVlHeEUzckM4KzVoeHdTQkprbDNIeXJVbGVpVXh3THhyRnp3VjhoVmlp?=
 =?utf-8?B?Y1NPUVZUSFlvZUdIN2xXMnJvM2RnQjlzNmMwS1pRU2VpYkNoQ3JabGJqUHFJ?=
 =?utf-8?B?UFRvdXZzSjNGYm1QUlVCQ2kwdEJOMnV5QnM1WTZIZ2o5dlNPNms2U2tnWkFo?=
 =?utf-8?B?cHRnak9pS1g3OTFTclVuSDJVd05oeWl5Q0VXT1REOXJzTW9mTlRjZXRxYU5G?=
 =?utf-8?B?cDBLUEg2SW82ZytNa3pDM0hWdC9LOFVsQXBLK0pjdDc4NUtFYmFnYjQ0U1ZG?=
 =?utf-8?B?ckpsQmhsMFBocTA2Y1BVZ1RXNFlUblVDZUxGam9JSm5hd0NYYkY4UWErVUhK?=
 =?utf-8?B?c29QRjN6bGI1V3Yxbk5wZCt1Z2tqeGpTRGtVM0UzSkN6bkp1M0c5Z3Y5ekJZ?=
 =?utf-8?B?UTk4UmlXdmU3dmd5eUlmVkpWS0hNL0NEcWxHLzhNUGtINEszeUVyQnRJL3JO?=
 =?utf-8?B?Z2dCNm9kMGE2bkRMZkNlVko5cnZuaFduVldhcE9qNUVmM2RRM1Qrdk9CVGFZ?=
 =?utf-8?B?Q2p6OElRdDF1VEF5MHVnUU1iQnRBMGdES29mbDhlMEkxMEE4YXN5cGVJY21n?=
 =?utf-8?B?dkF6T09CTWRGOC9Iakt1aEZkdWR0VDFrL0xIY2loeUlQVkRzYXFSRkNyZW84?=
 =?utf-8?B?ZDZhbTU1dnMyWGxYemI5WVZEZTdHa05va2hXWXl0eEUyK3NxRmxPTFYvcWI0?=
 =?utf-8?B?RUd3aVh2c2lPWHJWcmx6OGhPd2V0RkxISHF3bDloV0N1SmVhMHJhR1NwNElB?=
 =?utf-8?B?WUlLZm8vc0EyZzNsdHRTbklRN1ArL0ZPN2xqWVZzZzlyWmprblJzeW1vd0Vs?=
 =?utf-8?B?Y0tmZytOZjVxOWNGL0tZb2ZnNTNXV21NanpoWEpaU3JITllQR0pnRWZpVDFP?=
 =?utf-8?B?TWVDOFVVQmNKTlZhVjdrZkw4UTRKWk5ObDRFUWZaWE9NRGlkL2JWK2V3SG92?=
 =?utf-8?B?YU9aSmtIY1ZzNFpQaE1iOEV6cDNLTFpTUzNQRzc4aFBRN00vb1lKRnhNTjdD?=
 =?utf-8?B?YktWOUkySEM5c05UNHBFOGJyQW9EaGsvMzZyRmRuYUFUa1p4NVVwTCt2VmFS?=
 =?utf-8?B?SVcyU1pmaWc3U3dkNXZvcEhSOEh6aDFpM1l4Y2xCMitlYURmNFhPVThkWmsy?=
 =?utf-8?B?Y2R1dG13dDFEVVJ6V3MvQ2ZJOFV3U21JcUxFeUtkNWNMR0loM0dRaElFazl1?=
 =?utf-8?B?cGxVd2F4WXBSTzY3YjNFZUdXNlp1ZEkxL2VBZnlMSGJQMDFLRkFrQi93cm16?=
 =?utf-8?B?NXJqVGlUMGdtL1hnUDROK3JRYmc3WG5XQWthRmhvV2FTWnJPWVdCZ2l1UHJM?=
 =?utf-8?B?dTY2VEUwRVJNbWVQMGZXU1hzSTROK25nd3ZEREhINUNSWHYwbXdyUFUyQXh0?=
 =?utf-8?B?STJTdjNVSDVqS0NKL3dpbFFxOUxvblUzL2E4VXVoQ3I1VWFORWMrSmZnbmMw?=
 =?utf-8?B?YXR2NFAzczZ1WHJlSGdvUkN3UVhYaGh2cUJmOGJnRnBzNGVyU2l6WjduQmFn?=
 =?utf-8?B?cTV6bUh0UjZYTk5ta1NxQ0Q3S3cwZzRSZXFPSnJFMlRTOWxxdkxuK3g3UzI1?=
 =?utf-8?B?R05ranNPZ2RlMUZCMEoreFZ3WlFtMFF0UGFreDhqcUtaVHhZaHU0aDltWEFX?=
 =?utf-8?B?dEpuYnRWQ3htWldHU0RoSXNOV1ZWM2dib043c0ZMMWk1VEtsQ0pBb28yay9K?=
 =?utf-8?B?S1R3OVh3V3VLcGlxNWpSdWpmT3RkanJYQ2RNTzliazFSRlVlTTJMOWg4aEhB?=
 =?utf-8?B?a3pwQXg3WUxEbDh2bWtUQS9uYWdETWtkNjNocWxvTmFCNjJUdWpjYTd2c21u?=
 =?utf-8?B?R1NzVHh6UnpJM2JldVR0QjFyM2R3TWU4MTJSQnBJeFpGNTdVK0ZkKzY5Uy9G?=
 =?utf-8?B?VnlrSWJkVzM2b1RSemFQSzh1alROck5RT3psalZiRFFCT0d0UHVjWWF2YzZu?=
 =?utf-8?B?WFFzU0phS1hJcjdXZHRYelRjSUtSVldnMFVoL3dtWjcxQnZ4akpKdk43VlV4?=
 =?utf-8?B?TDgvZk8za0M5ak8wOHcxTWRIM0RER3NpaUQ1T3VCZXhUZXh1Nk9EVGd0QUZp?=
 =?utf-8?B?SzgrV0Z4RUdQRlRkSHlMY2JDSEFGQ2RLQVlaYWdMdi93OW45U0lJdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 290493d8-9abf-41c6-00d4-08dec56ca763
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 14:45:59.0990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H+w4cfQrPRezC07R/cYWlLPKGb97RtM1pxA9WeSb0VAyQLWEc44Pm+e9qjN2JpT2B2ENiXMb3QfFyP19eWkQbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9385
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

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 6/2/26 05:40, Caden Chien wrote:
> Commands are moved to new source file to declutter amd_vpe.c. New
> commands added in the future will follow the same way, so amd_vpe.c won't
> be flooded with commands.
> 
> Frame size setup is moved into test case to be per test case, instead of
> global, as more tests will be added in the future. Variable naming are
> revised to align with coding style guide and be consistent with VPE2 blit
> test.
> 
> Signed-off-by: Caden Chien <chih-wei.chien@amd.com>
> ---
>   tests/amdgpu/amd_vpe.c     | 105 ++++++++++++++-----------------------
>   tests/amdgpu/amd_vpe.h     |  15 ++++++
>   tests/amdgpu/amd_vpe_cmd.c |  38 ++++++++++++++
>   3 files changed, 92 insertions(+), 66 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_vpe.c b/tests/amdgpu/amd_vpe.c
> index 80b96bc10..658c3b8b0 100644
> --- a/tests/amdgpu/amd_vpe.c
> +++ b/tests/amdgpu/amd_vpe.c
> @@ -14,41 +14,6 @@ IGT_TEST_DESCRIPTION("Test VPE functionality");
>   
>   #define MAX_RESOURCES		16
>   
> -#define PLANE_WIDTH		1024
> -#define PLANE_HEIGHT		256
> -#define PLANE_SIZE		(PLANE_WIDTH*PLANE_HEIGHT*4)
> -
> -#define SRC_PLANE_PATTERN	0x12345678
> -#define DST_PLANE_PATTERN	0xff123456
> -
> -static uint32_t vpe_descriptor[] = {
> -0x00000001, 0x33002200, 0xff000021, 0x00000003, 0x33002234, 0xff000021, 0x33002328, 0xff000021,
> -0x33002384, 0xff000021, 0x330023c0, 0xff000021,
> -};
> -
> -static uint32_t vpe_config[] = {
> -0x00000002, 0x00000000, 0xbeefbe00, 0xff005678, 0x000003ff, 0x00000000, 0x00ff43ff, 0x00000000,
> -0xbeefbe00, 0xff005679, 0x000003ff, 0x00000000, 0x00ff43ff, 0x003b0003, 0x00047808, 0x00000809,
> -0x0004780c, 0x000000e4, 0x00047d10, 0x00000009, 0x00047d14, 0x00000101, 0x00047d18, 0x00000000,
> -0x00047d1c, 0x00000000, 0x00047d20, 0x00000000, 0x00047d24, 0x0001f010, 0x00047d28, 0x0001f010,
> -0x00047d2c, 0x0001f010, 0x00547ee9, 0x00002000, 0x00000000, 0x20000000, 0x00000000, 0x00000000,
> -0x00002000, 0x00047ee4, 0x00000001, 0x00047ee0, 0x00000000, 0x00047f24, 0x00000000, 0x00047fc4,
> -0x00000000, 0x00547f05, 0x00002000, 0x00000000, 0x20000000, 0x00000000, 0x00000000, 0x00002000,
> -0x00047f00, 0x00000001, 0x00049700, 0x00000000, 0x00049704, 0x0000000f, 0x00049f30, 0x00000000,
> -0x00049708, 0x00000000, 0x0004970c, 0xffff0462, 0x0004a208, 0x00000000, 0x0004971c, 0x00000000,
> -0x00047fc0, 0x0001f000, 0x00150003, 0x00047df8, 0x00000001, 0x00047dfc, 0x00000001, 0x00047da8,
> -0x00000006, 0x00047e18, 0x00000000, 0x0004970c, 0xffff0422, 0x00049710, 0x0001f000, 0x00049714,
> -0x0001f000, 0x00049718, 0x0001f000, 0x00049720, 0x00000000, 0x00049724, 0x00000000, 0x00049728,
> -0x00000000, 0x000d0003, 0x00047810, 0x00000000, 0x00047814, 0x01000400, 0x00047818, 0x00000000,
> -0x0004781c, 0x01000400, 0x00047e00, 0x00000000, 0x00047e04, 0x01000400, 0x00047e08, 0x01000400,
> -0x00280003, 0x00047820, 0x00000036, 0x00047824, 0x0960f015, 0x0004972c, 0x00000014, 0x0004972c,
> -0x00000014, 0x0004972c, 0x00000014, 0x00049f90, 0x00000000, 0x00049f94, 0x00000001, 0x00549f99,
> -0x00002000, 0x00000000, 0x20000000, 0x00000000, 0x00000000, 0x00002000, 0x00049850, 0x00000000,
> -0x00049f34, 0x00000000, 0x00049f38, 0x02fff000, 0x00049f3c, 0x00fff000, 0x00049f40, 0x00fff000,
> -0x0004aba0, 0xffff0000, 0x0004aba0, 0xffff0000, 0x0004aacc, 0x00000000, 0x0004aad4, 0x00000013,
> -0x0004aad4, 0x00000013,
> -};
> -
>   static bool is_vpe_tests_enabled(amdgpu_device_handle device_handle,
>   		struct mmd_shared_context *shared_context)
>   {
> @@ -179,17 +144,25 @@ static int check_rgba8888_hmirror(void *addr, uint32_t width, uint32_t height)
>   static void amdgpu_cs_vpe1_csc(amdgpu_device_handle device_handle,
>   				struct mmd_context *context)
>   {
> -	const uint32_t vpep_config_offsets[] = {0x34, 0x128, 0x184, 0x1c0};
> -	struct amdgpu_mmd_bo vpe_config_bo, src_plane_bo, dst_plane_bo;
>   	int r;
> +	uint32_t frame_size;
> +	struct amdgpu_mmd_bo vpep_cmd_bo, src_plane_bo, dst_plane_bo;
> +	/* same height and pitch for input and output */
> +	const uint32_t height = 256;
> +	const uint32_t pitch = 1024;
> +	const uint32_t vpep_config_offsets[] = { 0x34, 0x128, 0x184, 0x1c0, };
>   
> +	uint32_t *vpec_csc_cmd = vpe_get_vpec_csc_cmd();
> +	uint32_t *vpep_csc_cmd = vpe_get_vpep_csc_cmd();
> +
> +	frame_size = pitch * height * 4;
>   	context->num_resources = 0;
>   
> -	alloc_resource(device_handle, &vpe_config_bo, sizeof(vpe_config), AMDGPU_GEM_DOMAIN_GTT);
> -	alloc_resource(device_handle, &src_plane_bo, PLANE_SIZE, AMDGPU_GEM_DOMAIN_GTT);
> -	alloc_resource(device_handle, &dst_plane_bo, PLANE_SIZE, AMDGPU_GEM_DOMAIN_GTT);
> +	alloc_resource(device_handle, &vpep_cmd_bo, VPEP_CSC_CMD_SIZE, AMDGPU_GEM_DOMAIN_GTT);
> +	alloc_resource(device_handle, &src_plane_bo, frame_size, AMDGPU_GEM_DOMAIN_GTT);
> +	alloc_resource(device_handle, &dst_plane_bo, frame_size, AMDGPU_GEM_DOMAIN_GTT);
>   
> -	r = amdgpu_bo_cpu_map(vpe_config_bo.handle, (void **)&vpe_config_bo.ptr);
> +	r = amdgpu_bo_cpu_map(vpep_cmd_bo.handle, (void **)&vpep_cmd_bo.ptr);
>   	igt_assert_eq(r, 0);
>   
>   	r = amdgpu_bo_cpu_map(src_plane_bo.handle, (void **)&src_plane_bo.ptr);
> @@ -198,45 +171,45 @@ static void amdgpu_cs_vpe1_csc(amdgpu_device_handle device_handle,
>   	r = amdgpu_bo_cpu_map(dst_plane_bo.handle, (void **)&dst_plane_bo.ptr);
>   	igt_assert_eq(r, 0);
>   
> -	context->resources[context->num_resources++] = vpe_config_bo.handle;
> +	context->resources[context->num_resources++] = vpep_cmd_bo.handle;
>   	context->resources[context->num_resources++] = src_plane_bo.handle;
>   	context->resources[context->num_resources++] = dst_plane_bo.handle;
>   
> -	// plane config gpu addr
> -	*(uint64_t *)(vpe_descriptor + 1) = vpe_config_bo.addr;
> -	// vpep config0 gpu addr
> -	*(uint64_t *)(vpe_descriptor + 4) = vpe_config_bo.addr + vpep_config_offsets[0];
> -	// vpep config1 gpu addr
> -	*(uint64_t *)(vpe_descriptor + 6) = vpe_config_bo.addr + vpep_config_offsets[1];
> -	// vpep config2 gpu addr
> -	*(uint64_t *)(vpe_descriptor + 8) = vpe_config_bo.addr + vpep_config_offsets[2];
> -	// vpep config3 gpu addr
> -	*(uint64_t *)(vpe_descriptor + 10) = vpe_config_bo.addr + vpep_config_offsets[3];
> -
> -	memset(src_plane_bo.ptr, 0, PLANE_SIZE);
> -	memset(dst_plane_bo.ptr, 0, PLANE_SIZE);
> -	create_rgba8888(src_plane_bo.ptr, PLANE_WIDTH, PLANE_HEIGHT);
> +	/* plane config gpu addr */
> +	*(uint64_t *)(vpec_csc_cmd + 1) = vpep_cmd_bo.addr;
> +	/* vpep config0 gpu addr */
> +	*(uint64_t *)(vpec_csc_cmd + 4) = vpep_cmd_bo.addr + vpep_config_offsets[0];
> +	/* vpep config1 gpu addr */
> +	*(uint64_t *)(vpec_csc_cmd + 6) = vpep_cmd_bo.addr + vpep_config_offsets[1];
> +	/* vpep config2 gpu addr */
> +	*(uint64_t *)(vpec_csc_cmd + 8) = vpep_cmd_bo.addr + vpep_config_offsets[2];
> +	/* vpep config3 gpu addr */
> +	*(uint64_t *)(vpec_csc_cmd + 10) = vpep_cmd_bo.addr + vpep_config_offsets[3];
> +
> +	memset(src_plane_bo.ptr, 0, frame_size);
> +	memset(dst_plane_bo.ptr, 0, frame_size);
> +	create_rgba8888(src_plane_bo.ptr, pitch, height);
>   
>   	/* gpu address of src */
> -	*(uint64_t *)(vpe_config + 2) = src_plane_bo.addr;
> +	*(uint64_t *)(vpep_csc_cmd + 2) = src_plane_bo.addr;
>   	/* gpu address of dst */
> -	*(uint64_t *)(vpe_config + 8) = dst_plane_bo.addr;
> +	*(uint64_t *)(vpep_csc_cmd + 8) = dst_plane_bo.addr;
>   
> -	memset(vpe_config_bo.ptr, 0, sizeof(vpe_config));
> -	memcpy(vpe_config_bo.ptr, vpe_config, sizeof(vpe_config));
> +	memset(vpep_cmd_bo.ptr, 0, VPEP_CSC_CMD_SIZE);
> +	memcpy(vpep_cmd_bo.ptr, vpep_csc_cmd, VPEP_CSC_CMD_SIZE);
>   
>   	memset(context->ib_cpu, 0, IB_SIZE);
> -	memcpy(context->ib_cpu, vpe_descriptor, sizeof(vpe_descriptor));
> +	memcpy(context->ib_cpu, vpec_csc_cmd, VPEC_CSC_CMD_SIZE);
>   
>   	context->resources[context->num_resources++] = context->ib_handle;
>   
> -	r = submit(device_handle, context, sizeof(vpe_descriptor)/4, AMDGPU_HW_IP_VPE);
> +	r = submit(device_handle, context, VPEC_CSC_CMD_SIZE / 4, AMDGPU_HW_IP_VPE);
>   	igt_assert_eq(r, 0);
>   
> -	r = check_argb8888(dst_plane_bo.ptr, PLANE_WIDTH, PLANE_HEIGHT);
> +	r = check_argb8888(dst_plane_bo.ptr, pitch, height);
>   	igt_assert_eq(r, 0);
>   
> -	r = amdgpu_bo_cpu_unmap(vpe_config_bo.handle);
> +	r = amdgpu_bo_cpu_unmap(vpep_cmd_bo.handle);
>   	igt_assert_eq(r, 0);
>   
>   	r = amdgpu_bo_cpu_unmap(src_plane_bo.handle);
> @@ -245,7 +218,7 @@ static void amdgpu_cs_vpe1_csc(amdgpu_device_handle device_handle,
>   	r = amdgpu_bo_cpu_unmap(dst_plane_bo.handle);
>   	igt_assert_eq(r, 0);
>   
> -	free_resource(&vpe_config_bo);
> +	free_resource(&vpep_cmd_bo);
>   	free_resource(&src_plane_bo);
>   	free_resource(&dst_plane_bo);
>   }
> @@ -384,7 +357,7 @@ int igt_main()
>   
>   	igt_describe("Test VPE fence");
>   	igt_subtest("vpe-fence-test")
> -	amdgpu_cs_vpe_fence(device, &context);
> +		amdgpu_cs_vpe_fence(device, &context);
>   
>   	igt_describe("Test VPE blit");
>   	igt_subtest("vpe-blit-test")
> diff --git a/tests/amdgpu/amd_vpe.h b/tests/amdgpu/amd_vpe.h
> index 31015ccfb..804fab45f 100644
> --- a/tests/amdgpu/amd_vpe.h
> +++ b/tests/amdgpu/amd_vpe.h
> @@ -8,6 +8,19 @@
>   
>   #include <amdgpu.h>
>   
> +/* color space conversion commands
> + * source:      1024(pitch 1024) x 256 RGBA
> + * destination: 1024(pitch 1024) x 256 ARGB
> + */
> +
> +#define SRC_PLANE_PATTERN	0x12345678
> +#define DST_PLANE_PATTERN	0xff123456
> +
> +#define VPEC_CSC_CMD_LENGTH	12
> +#define VPEP_CSC_CMD_LENGTH	154
> +#define VPEC_CSC_CMD_SIZE	(VPEC_CSC_CMD_LENGTH * sizeof(uint32_t))
> +#define VPEP_CSC_CMD_SIZE	(VPEP_CSC_CMD_LENGTH * sizeof(uint32_t))
> +
>   /* horizontal mirror commands
>    * source:      1024(pitch 1024) x 256 RGBA
>    * destination: 1024(pitch 1024) x 256 RGBA
> @@ -21,6 +34,8 @@
>   #define VPEC_HMIRROR_CMD_SIZE	(VPEC_HMIRROR_CMD_LENGTH * sizeof(uint32_t))
>   #define VPEP_HMIRROR_CMD_SIZE	(VPEP_HMIRROR_CMD_LENGTH * sizeof(uint32_t))
>   
> +uint32_t *vpe_get_vpec_csc_cmd(void);
> +uint32_t *vpe_get_vpep_csc_cmd(void);
>   uint32_t *vpe_get_vpec_hmirror_cmd(void);
>   uint32_t *vpe_get_vpep_hmirror_cmd(void);
>   
> diff --git a/tests/amdgpu/amd_vpe_cmd.c b/tests/amdgpu/amd_vpe_cmd.c
> index b7849a5f8..5dbc2a83b 100644
> --- a/tests/amdgpu/amd_vpe_cmd.c
> +++ b/tests/amdgpu/amd_vpe_cmd.c
> @@ -5,6 +5,44 @@
>   
>   #include "amd_vpe.h"
>   
> +static uint32_t vpec_csc_cmd[12] = {
> +0x00000001, 0x33002200, 0xff000021, 0x00000003, 0x33002234, 0xff000021, 0x33002328, 0xff000021,
> +0x33002384, 0xff000021, 0x330023c0, 0xff000021,
> +};
> +
> +static uint32_t vpep_csc_cmd[154] = {
> +0x00000002, 0x00000000, 0xbeefbe00, 0xff005678, 0x000003ff, 0x00000000, 0x00ff43ff, 0x00000000,
> +0xbeefbe00, 0xff005679, 0x000003ff, 0x00000000, 0x00ff43ff, 0x003b0003, 0x00047808, 0x00000809,
> +0x0004780c, 0x000000e4, 0x00047d10, 0x00000009, 0x00047d14, 0x00000101, 0x00047d18, 0x00000000,
> +0x00047d1c, 0x00000000, 0x00047d20, 0x00000000, 0x00047d24, 0x0001f010, 0x00047d28, 0x0001f010,
> +0x00047d2c, 0x0001f010, 0x00547ee9, 0x00002000, 0x00000000, 0x20000000, 0x00000000, 0x00000000,
> +0x00002000, 0x00047ee4, 0x00000001, 0x00047ee0, 0x00000000, 0x00047f24, 0x00000000, 0x00047fc4,
> +0x00000000, 0x00547f05, 0x00002000, 0x00000000, 0x20000000, 0x00000000, 0x00000000, 0x00002000,
> +0x00047f00, 0x00000001, 0x00049700, 0x00000000, 0x00049704, 0x0000000f, 0x00049f30, 0x00000000,
> +0x00049708, 0x00000000, 0x0004970c, 0xffff0462, 0x0004a208, 0x00000000, 0x0004971c, 0x00000000,
> +0x00047fc0, 0x0001f000, 0x00150003, 0x00047df8, 0x00000001, 0x00047dfc, 0x00000001, 0x00047da8,
> +0x00000006, 0x00047e18, 0x00000000, 0x0004970c, 0xffff0422, 0x00049710, 0x0001f000, 0x00049714,
> +0x0001f000, 0x00049718, 0x0001f000, 0x00049720, 0x00000000, 0x00049724, 0x00000000, 0x00049728,
> +0x00000000, 0x000d0003, 0x00047810, 0x00000000, 0x00047814, 0x01000400, 0x00047818, 0x00000000,
> +0x0004781c, 0x01000400, 0x00047e00, 0x00000000, 0x00047e04, 0x01000400, 0x00047e08, 0x01000400,
> +0x00280003, 0x00047820, 0x00000036, 0x00047824, 0x0960f015, 0x0004972c, 0x00000014, 0x0004972c,
> +0x00000014, 0x0004972c, 0x00000014, 0x00049f90, 0x00000000, 0x00049f94, 0x00000001, 0x00549f99,
> +0x00002000, 0x00000000, 0x20000000, 0x00000000, 0x00000000, 0x00002000, 0x00049850, 0x00000000,
> +0x00049f34, 0x00000000, 0x00049f38, 0x02fff000, 0x00049f3c, 0x00fff000, 0x00049f40, 0x00fff000,
> +0x0004aba0, 0xffff0000, 0x0004aba0, 0xffff0000, 0x0004aacc, 0x00000000, 0x0004aad4, 0x00000013,
> +0x0004aad4, 0x00000013,
> +};
> +
> +uint32_t *vpe_get_vpec_csc_cmd(void)
> +{
> +	return vpec_csc_cmd;
> +}
> +
> +uint32_t *vpe_get_vpep_csc_cmd(void)
> +{
> +	return vpep_csc_cmd;
> +}
> +
>   static uint32_t vpec_hmirror_cmd[38] = {
>   0x00000001, 0x00800000, 0xffff8001, 0x00000010, 0x00800080, 0xffff8001, 0x008000c0, 0xffff8001,
>   0x00800100, 0xffff8001, 0x00800140, 0xffff8001, 0x008001c0, 0xffff8001, 0x00800740, 0xffff8001,

