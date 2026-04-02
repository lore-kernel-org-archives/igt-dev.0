Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7CAD3941A
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 12:23:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4142910E0E1;
	Thu,  2 Apr 2026 12:23:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VXOyJ7St";
	dkim-atps=neutral
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012008.outbound.protection.outlook.com
 [40.93.195.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FF310E0E1
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 12:23:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PVESvletbLg+CRSurgOZo+KdNb4Q3xxSealX1YbwIzZ3N8Q6Q0AS6Jh+fkAOvXfKh4OnaHUvJn/iPwgZ435coITTYxt2ZqQEo57v/q12FHuXSoEUdGHmefeW8QzmVCDsjXklOChtNIKyLTbbhwgDQEfzkL/bk9QJ0PHztMBiAeYWlzH5OwevF9cg3H+8uf8P3QyjMpmzsyaZeylPA808iERoUcvOBARlUS2FrRhAHX8BBQims5UAfkl1M5PC9DqZXTrPL40n1v2doZiYTAM7alDL40fBTSeZgtG++pYFV2N9u+6nRu3Jp99y+x4Ufzu3OH77T2YndaOiQOsTZHxf4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gX3TFyNY+qy2J6aiEZBaFDU6nLxlGXfl61fhN4wBbk=;
 b=cCVLCOxmsUQfkERaWlCsjjKvsFqTzI4vyjmcV17CYCXu7j7OwfGoFQ1FZQxUXEFn7EiPos1buzrRbz+U5063mNRl4x39eGR3Ppja3zgK2wZAU3OGL83vPT87kNZpM6WrL0Lt5XCF7PfT0yzKpJYy/FgLScgd4s25I5mRJBHcw9EmaCL6rgzQKQFkfmnYvXGk2mjnQwhGQs4iqIFV1TWgeDrwbrx2sF9ALevnYzvQaf+9l2RiH36r4+ueMjoO7UKzJkEN2QX3JVskjmoSzuYU22eg81c+cjc2i/zCxEEQISRFfoVKUIfimrWQM9EbDGs1umyPADAuvSJoCrUH/7gISA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5gX3TFyNY+qy2J6aiEZBaFDU6nLxlGXfl61fhN4wBbk=;
 b=VXOyJ7StH8Env5/dBw7n+gyAYwozDEelt6LhHe1Di5gNpXnkfFZDT8c/5ZoM7AC4e3lFUSC3Xqg5GV+VMNsWg8k1xXkSM9Eo4+hI4pT5TfaO7byzIsv28TWychVd7drbO2ANlot+GjmupYYI1Wm4aZSscMhkGRmX/RiJVDpiDto=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5674.namprd12.prod.outlook.com (2603:10b6:a03:42c::7)
 by DS7PR12MB5934.namprd12.prod.outlook.com (2603:10b6:8:7d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 2 Apr
 2026 12:23:37 +0000
Received: from SJ0PR12MB5674.namprd12.prod.outlook.com
 ([fe80::4609:c7e9:bd7f:e50f]) by SJ0PR12MB5674.namprd12.prod.outlook.com
 ([fe80::4609:c7e9:bd7f:e50f%6]) with mapi id 15.20.9769.015; Thu, 2 Apr 2026
 12:23:37 +0000
Message-ID: <9ad5da9e-2671-4b3d-b1a3-d65beca63834@amd.com>
Date: Thu, 2 Apr 2026 08:23:33 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amdgpu/amd_fuzzing: Remove unused variable
To: Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, kunal1.joshi@intel.com,
 Jesse Zhang <jesse.zhang@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20260402085039.1655070-1-karthik.b.s@intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260402085039.1655070-1-karthik.b.s@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::14) To SJ0PR12MB5674.namprd12.prod.outlook.com
 (2603:10b6:a03:42c::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5674:EE_|DS7PR12MB5934:EE_
X-MS-Office365-Filtering-Correlation-Id: e76f0be5-89a0-491a-a824-08de90b2aa5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 7NcqClo9Csgahi9nz67rhlE/8dSHyw2BLcUdnePYAposZ4kTFcFT1cnwCqc7ibrayAZq51rGo3Vle3PEFhRcwA7VkuVMzKh9QWbyUwilhoVHenxqDa4dYyOgrwoGS51nZx+9Sb8/ikgIE98cAjMmRAbeEzWUAyklIglJO5DaBR+m6fUkB9X09QYkYKZXOMhIf+E4kx/63HuPAo+pBdSOr/JNK3ASAtMq2OKEES3xozp1+NfHXUA9rur/eAFYseNWWCcw79rrks2ppAsMDHRuozcJhzwHgmeIFgV/Et17RgXraxU6a0aysIa6XLbzvAapswHvXaU8CRkDMWKyIjR90PJqbLIXQNEPy+7D59xTyv+oH1QKPLtb5/vGZibo5RdiY7IRC7KNpJIDSswTCSzHVKeSL9pBgm1mU8qw3+ox2BTRPimAhLyGJHXGRxnK6pdu1iEA4N5Tphuf51ClMhdzw5oFo4G4Mi0J2RJuGw5ZcsLJIoYMyTW4eiNRGerbLl3G4aZCEFxpmlPw/cbEsMNdSCQLxS7inNnAGnul1PPwAY/qQX98/ajXoXpKqH1G6nbl0Li5Ps3qy2pxhCNZMAFtCOmVWNd7cWe9UYnPH8GsgLLE+jmOgvZ0H6MEoPywI0+6Uf7qS2hZUBDtwFZY+G2MOKP7mzi1iM14p8jbNune8hJge2D0LMNA5uKJtLav++Ml4O4HdOWXcW7YdkcDqeL73xjs5pDX2YkjArAajxfKipI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5674.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUNpMVhwTUF2MjBRWkNmQklhMmtjcDFSOHRrN0xjS3VsVm1iRUppQ0FYS2JP?=
 =?utf-8?B?OVViM0w0ekVMRE55RnE5ZkJvcXMzbVhxS09WRVlPTkZ4T2dkS29hYXU4b21C?=
 =?utf-8?B?U3A3eWVwak9DQmZUTU1oa2l4a0dsM2E5c3MwSGtCN0FoOG1hYWg2SEZCRHdx?=
 =?utf-8?B?bXErbXkvWUJvYWxCRXY3VS9LV21UYnd0OUFMTE1sWmUzakVyRjFMVFNPeFZx?=
 =?utf-8?B?Y1hTZittQ0xPVWx1dkgvTVYxOEVtazRHWkVaVk44V2JuWTluZWE2MmlMekw3?=
 =?utf-8?B?MUVTNTlZRmsvR3pRaG9BY3ZTRUN6cURnMDlhVDg3TjRiWUt0ZEJaZ0NBQlE5?=
 =?utf-8?B?N2loQTBHdHZqOEcySGN2M3p1RWpQZktPT2NTaHlETkYwcVllVkhza3p5VlRW?=
 =?utf-8?B?MEVKcThsZGV6RjFscTdlc3hQcCtmY3N4R0poZ1RvNmxGcXB2Ukh0TWV2ZHVm?=
 =?utf-8?B?anhSalBSTFg1NWRLaEtGdVdaaTk5S3RBT3EvUG1qWkdzMThPOVczeW1LOUNI?=
 =?utf-8?B?bmRaMEdtUkx4N21PRUY4RTM0cnFPMjJIU2RVdWFaK29uOUlPaTdVMy91OTdJ?=
 =?utf-8?B?ZkJsQ3hGR1dFajZOMy9EMWJRUTdaVEJhWTVKa3RTR0dsK3NFKzNueStmMk94?=
 =?utf-8?B?TTFMWHVHZGJSWnh3MHRTUEI2OE5RUmtmS2oxaTBRRkd2QUwwYlUrbGRLbDk2?=
 =?utf-8?B?VFpIaStUQ0QwOGxodmE2SmNzL0hMdnVOb1FlU3BLSEl6Zkx0Q3pzbUJkZzlH?=
 =?utf-8?B?MG51cHRuZlFFL0tCVkFuekNlUVFBWWVvZmFhbUlPOTU3VWc2SnlVdW1zTWsy?=
 =?utf-8?B?TzNrZ3ZIS1IwUmIrU0pWbjFRbUxlMmU0YTFGUXdRR0xrTTBpeDYvV3IyeEdI?=
 =?utf-8?B?aG9XWm1nNVBvQkRvMVdWZXA1NlVhVURLYnA0dUdiRjZTRENhYVRoc2ZMV2Q4?=
 =?utf-8?B?UFZjbWJYamVySWlRR0ZkT3p2RDlsSmhkN2U0RU9aTDlMa0NnZTBRa2lYbHFC?=
 =?utf-8?B?SnpoYjVIN2MvVnl2b29nT2RxZ1B1M0J3VHlpVkYwQlRqVWxpWU1XV2tpMGI1?=
 =?utf-8?B?MDFWanJleEt5c2ZuenhwYW9SaStqUjhPMFN4amxFVUZqRmNXT05RQXYxS2w3?=
 =?utf-8?B?cVJqR3ZPZ3ZvMjZ2V3pZUWxCelBpOXgvaFpDUSt1ekg2cHlhdFZvVGU3Wjdn?=
 =?utf-8?B?MlRDYXF1Ymx5N3l0VmN5ckxhSURGcmduMi8wak1KTFBLNVFIR0hTdW0yZHE5?=
 =?utf-8?B?akgvUkdudThwMjhVby9HM3k2T0JuUEdpczJ0K0UwL3pKSHFhUnRwblB1Z0dD?=
 =?utf-8?B?elVzNFZJbFQxN0JiQXhMWTl6ZTloN0RPdXprZjZScEl1NDZJV1VzdDBNaWl4?=
 =?utf-8?B?eUZ2U2Y3MjEvMCtuZW4zMEZadk9WbVgwSTNBaWJ5dWVBM09mT1g3MTd2VXF0?=
 =?utf-8?B?U3ZJQkU0ZkJENDFVRlAzcDF1SmlsZ2hNTHJ3MG9KS2cvR01ac09rZXdhN1kx?=
 =?utf-8?B?SHRPb2UrS1oyS1FvUklXUmJ0Sy8vNWJtZEZrTWtrSGY3TGZYd1htS3pSRGR1?=
 =?utf-8?B?SHRmSGttRUF4cWdXZ3ZVeWNkeWxkcVFHd0VjQkpZSjZHYk95REZraXkvYkdX?=
 =?utf-8?B?dDV3MjE3d3pRdWJkOVVmdHB3MXFSUkJNTWplT1hMVU9PSFRsNmdseWFZeGZ5?=
 =?utf-8?B?Y3Y5OWE0YVp4ZWRiS3FMbmwxZXRIMENnSWtZMEdNY3FWOE1vdG5vbjJHTE9q?=
 =?utf-8?B?NzhNVUtacjR4cjZTUVVPTEwrYzVxSDVpdEVvVGNqVVlUc0prOENqa3FzM0d1?=
 =?utf-8?B?RFFWSnNiWHlBeTE0T1FDUjJNVXJqK3RaR0xXUEF4T3FRUnlqM05TYXpkRFlM?=
 =?utf-8?B?YzlmemxVUm40YUY2L1VFYmFjQVdCMmFDVGJLbUo4czN1ZWtoc2Z4YXlwRnVv?=
 =?utf-8?B?TWtKWjNTWFJqSHRpdVRoTTZiQ0FqOElwOFBsUkxaUVBwZ2VaUld1YnhZL256?=
 =?utf-8?B?Y1ZyNkZPamhwWXg0TzI0WldLOG52SDV4TEdWcWwrWitBNFRBOXBMb3dvTjNm?=
 =?utf-8?B?YjNkU1lyRTVBaVFDa3V3WWFDUFNTSjBNSHFwQkdwR3pJN09iK1dvOGNmdEN4?=
 =?utf-8?B?NEptZ2ZoYm5HTEdwMmxKS3J3VGRqOGVoWUlaSldVMzRvamY4MHFOSFdrOGtW?=
 =?utf-8?B?d2c3RUdHenJOVmhwak8yek1SOGljV1dIL3MyZU11YVI5UU1iYzVSZWp1Vll5?=
 =?utf-8?B?SzRWZkdTNFYyL2MxMFFmUVBqWWhNOFFCOURhUkVDWS9yWGV6UzFxbGg3eTJt?=
 =?utf-8?B?NEZoM2JpZEFhZkxqbXNDU1N1WUNFN0JkNWxyclpoNk9sSVdtamYzdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e76f0be5-89a0-491a-a824-08de90b2aa5a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5674.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 12:23:37.2157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pf3Li+RCS48EHIkxo/uAcGjzypvSBjz/BpfGk5XhHfKIH2M6ZEk9hAYOn1IyUZZwunvtIH6dYTLD2RBp/qGzzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5934
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

Hi Karthik,

Thanks for fixing this, and apologies for the warning introduced by my earlier patch.

Reviewed-by: Vitaly Prosyak  <vitaly.prosyak@amd.com>

Vitaly

On 2026-04-02 04:50, Karthik B S wrote:
> Fix compilation warning:
>
> [1694/2119] Compiling C object tests/amdgpu/amd_fuzzing.p/amd_fuzzing.c.o
> ../tests/amdgpu/amd_fuzzing.c: In function ‘amd_kgd_multi_ioctl_field_fuzzing’:
> ../tests/amdgpu/amd_fuzzing.c:298:14: warning: unused variable ‘have_amdgpu_dev’ [-Wunused-variable]
>   298 |         bool have_amdgpu_dev = (amdgpu_dev != NULL);
>       |              ^~~~~~~~~~~~~~~
>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Fixes: 49cf0900dd23 ("tests/amdgpu: add field-level negative ioctl fuzzing tests")
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/amdgpu/amd_fuzzing.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/tests/amdgpu/amd_fuzzing.c b/tests/amdgpu/amd_fuzzing.c
> index 21dab4afe..00717e593 100644
> --- a/tests/amdgpu/amd_fuzzing.c
> +++ b/tests/amdgpu/amd_fuzzing.c
> @@ -295,7 +295,6 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  	uint32_t valid_bo_handle = 0;
>  	bool have_valid_ctx = false;
>  	bool have_valid_bo = false;
> -	bool have_amdgpu_dev = (amdgpu_dev != NULL);
>  
>  	memset(&valid_ctx, 0, sizeof(valid_ctx));
>  	valid_ctx.in.op = AMDGPU_CTX_OP_ALLOC_CTX;
