Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095E6C55822
	for <igt-dev@archiver.kernel.org>; Tue,  4 Aug 2026 06:05:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D40110E85F;
	Tue,  4 Aug 2026 06:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LSPxcAKK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 842A410E101
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Aug 2026 06:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785823493; x=1817359493;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WFmzKSsWBledRhs7OZiDxNniwn7Krdo+3nWbZy5rg+k=;
 b=LSPxcAKKrFwYq2zZaJsQTZtvXfcDcrcmCKwh8VTzsfD+tP2APIN8zObT
 392oskromGTobpkT+yHrGPRnJmiC832gnsHNqjddBPf8KSzkWVdNBezOt
 eeTgayneVoOwrr9NxznbYtMwGpm2kFN2xk/8WgvxuePRZKOtl1xCfRjE6
 cykQVFg4LTBpSBhBfOl9TFBEkx4MVN7zk7eA9fhn7W8umjhDAqko4l4Qu
 HE3oXKgAKnr3qaVFqRrClOBy1lxpLLM/K9MCZCFt/bN4bWMg4m2kXt44E
 0+r3UuxXqh0cw0XnZOaBGiH2GN1FerADPvKzLbNnXiVMiSZ9yU2wVqrJu g==;
X-CSE-ConnectionGUID: 2PHYMaQ1THu38ABN9HyENQ==
X-CSE-MsgGUID: 2V27+ttrTMqXwoALYCxZPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86219954"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="86219954"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 23:04:52 -0700
X-CSE-ConnectionGUID: cZTaFMjzRDmgwY9tz0Kirg==
X-CSE-MsgGUID: lW5Fbc4VSR2MbcB3+b+nHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="266538335"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 23:02:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 23:02:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 23:02:48 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 23:02:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCDehFLxRSNYZTPsLymKYFeP9G0lX6fZqaAgtt29lK8RH0zR+jYaLrjwgTi27ozpWtdrugdlIL2k8ebZRZBw5y4MLgJjdBDct7+o5xtozAFGTp7PY1HcU0k+4nCiMoaMmcNyamgWijTR+wevyMLxULQCXTOO0+Tm7jx8uGgeotx22cj6b6tue2p8fMYZOEylcsjx/RxjkkJ9JYLF1r7jXDwgrbtziiSWtbsex3kCItxQrVeGbDPYcmIGdPzGseA3EHnXepB0QTARI5rxSZhz56FK9HhYTbxxaLzcl9OsrYs30fylKXce/fS6t/Unj2IlrdTLxWMJDGnNq9H7zKIggg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9NR492x7Gutry4mQDJfaYryt8jXVuUpxsW3iJuBI8I=;
 b=YK+geHSmk/uTLo9xXVP+9EQXr5gCWr5hS+curzP4JYPxbawKQRpAvzJS/R035DmyWKVTCEMaT5KQWLfBbNljB2QduxnT18ZP6J8cD4QaDOmOcql1mMgUkInDD2iaUGgjrjt0hWJykWNoShl/XfApaeNVV/ADFsAbaFyzpsPTanZQ0hwd7zrqgtMl17UzOGHaP0gp9uQ4fnqgTyUecR83YYsVtz/kWLZ/LozFseA+7A4LklKUbxw4uyMu0YXdTU41fRuSw9kHpRKdTNYZnQqruorvxIQ3gFq2naBYjn6L507k0ijhSiyOi6kagX6nb2dSRs7YLt017CtAindiQcy+sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 DS4PR11MB275037.namprd11.prod.outlook.com (2603:10b6:8:509::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.18; Tue, 4 Aug 2026 06:02:41 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 06:02:41 +0000
Message-ID: <d5e894ac-935e-4a47-a4ea-59e6d0abcfa4@intel.com>
Date: Tue, 4 Aug 2026 11:32:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/2] lib/igt_kms: Skip joiner exception modes in
 boundary non-joiner search
To: Sowmiya S <sowmiya.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20260727060321.361027-1-sowmiya.s@intel.com>
 <20260727060321.361027-3-sowmiya.s@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260727060321.361027-3-sowmiya.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::7) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|DS4PR11MB275037:EE_
X-MS-Office365-Filtering-Correlation-Id: 758a131e-f34e-4e36-d735-08def1edfe57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|11063799006|4143699003|6133799003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 8EKt2CnFzLq9xUKJ4c8evlq0NNQkBSIeGYXyHzwwVkM6smYdZfJXNqXLNG/PW08tZh964JISMinUex/BsiytsEPz/0zZgfOYwQiJHYGHNIqmY8vU1NRAqJPI6NuzCX8dpn9ywyRJjfy+0Z3VbEesqDd+MjXTDT4JipF3CNZAZCt/pqOWNb9l5NF3iC2NRFTE+2FK6hgZH4L6M9YZgJ5Ye0p/qKYhaUWwGR6ijlJ/5I7u54tdZhUXg7OlZEdDiWmsRV4/2n9EpGjwY0NmNbouNAdGLeOn1+HhqGXQs6Cudbg3eur02FGLMB8S+8G53tz+zJZzUQzChFdB36icy0DoHJyiYXEzi+UE67gA6rzVjjhJ0tP7j057R+j7H89uM0E1fwtniIDnjTlPRgWN76rKyFDaV/AvemhbBYqu1la8QIrawAXaYS4U3u0wxL0UthrqAPM8sJ7p2YpVxC1ufNyH0uih80Zcoiblk0CjAVHYwRBk1AZG0Ey0CigJT/6m4fOvmx7JoyAY255X3uA/XSQaQE4yOFgeAUNU2ro7sfELlCHLlEeLCCCuG8pC4rOlIowX3EQJ1PPvh3/s3dbMGu/ijqDB6V9kB37YjCdCRl4eQutD5ZAczkiUnBUOhnW7iIHBaY69pYtOqxE3+++4Qn9/8rTVL+EuVzqaLUmiClfUvpM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(11063799006)(4143699003)(6133799003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0dtNmVpM2J1U2RteWVNMTZsVGpYMXhtaEc1QzhaamYyTC9pekxzTzRMM3F5?=
 =?utf-8?B?emljb2tkNlRkZ3hMeUs5bWNVQnV1NkZ6SVlUYkZDQi9OMDVYcnlydW5zLzdv?=
 =?utf-8?B?OW8vQm1RWWlrZjFZRkZEdVQ1cVVKblpTajFIUkFOQUxaWi9EbUZDaXZXVmc1?=
 =?utf-8?B?cE5wc2N0NWRIdFkvTGNOREM3dkR5a2VlVnpmSkQzd3hUM0N5M3RhdnErRzJv?=
 =?utf-8?B?MVRtUng4bm1xUjBQZ0VtZnZRNjRBZHc3THcxKzdrdFluTjZUMGV3QjV3blJ0?=
 =?utf-8?B?OGlKR044NUd4M0J2aENsVXVzNW15WWw4aDl2eEtKR3ljV2h6WlZVenVRL240?=
 =?utf-8?B?M2poSGVmWTdMWG1RTzI2QVdiMnJGV3VOMWJ5c0l1ZXBZT1dIYzJyV2lUMFR5?=
 =?utf-8?B?c0gxT01uNnNNVHpOeWlzeTF1Mnd6dUUwakw4NU5UOHZiOE1udkhJb3p2eXQy?=
 =?utf-8?B?T2J1QWt1NDZ6OXJRdzN4M3dXSUJNdzdrc3MxNzhqeWJGdU9sU003MXhLb1Bs?=
 =?utf-8?B?T1l0b3F2aFV4WjYxRnZaMGlNMmV5QloxeUdJaEJoTkt6akNjclY2QjJqSEV4?=
 =?utf-8?B?aFVLTk9Fd3JRTFpIRk5GQzhRb3F0dXUycnN5VEZyaXI5VHk1dGNsc00rMWFU?=
 =?utf-8?B?V3ZER3prSzI1Z3NjRUY5eitwczBCUDhSTmxjTmR2TnA5NFZqTG1zTzRka2pp?=
 =?utf-8?B?ZjR5RDlXaDVCcnhEV0RsZTlWbXBXbmxTeDd2U1pOclRWNlp0QnpsNmpFaUMy?=
 =?utf-8?B?bkFSVm5TU3JmZEFkaHY3cWtMQSthQnd2N0RFbVB5VktHVUtuNTBieldZOFNQ?=
 =?utf-8?B?b3J3M3ZXRDBxN0hVSXhoTmV6VVdmYnNOREloOTZ0a0Z2RVVuV0xiaXNFZGNn?=
 =?utf-8?B?RUlFVEM2ckFrcXFmVFl3WnVYTW9SY0RMSlBQVW9uNkduQ3p1TXpVV0xlOXdX?=
 =?utf-8?B?NWVhOWF0SmorVW9OYmRybWxmVmtUTytWS2I2TGQxajNOVTlJdVZMS1JFaExV?=
 =?utf-8?B?Y0tRVXJnb0E4MzVEbjBJTmhDS2VuQ1U4OWwxdGdQSklRR1BwY1B4enlWaVJz?=
 =?utf-8?B?VmlCNTRRSFVydDIrSjlqNC93QUJrckFraS8zaEsrQm9mUjRsR29jTFBZV1cx?=
 =?utf-8?B?bWhYd0xVRFJVckRjaTlMT1lWaC9uQzcvQlc5eGNZZlRiU3JFVXdBcE43Mm1Q?=
 =?utf-8?B?d0JFUlFzSDQ5bExrU3BKRkd3N3d6cGdPWnhpQzk4NWJrK0VoTXlxRjBIV0ZH?=
 =?utf-8?B?ZDU5azdzeGtxNUpwN1A3dXJSR3UrdElKQlRNOFNXSTJvakFLVXNXSDdrcXhr?=
 =?utf-8?B?ZHRLWHhPcW5COGpXNmhJMkpmeE9ZRVhqR2NVNzgvYmgraDk2QjZTcFh4bmZ4?=
 =?utf-8?B?VXByN0NxeEN3eVpLZkpSemdWaDNhTy9obmkxVmhrL0ppMS9FbndRQy9WTmRr?=
 =?utf-8?B?ZmoydWZRL0NzQzBpZU9hNU4xbXhNUmMrWlJYNVcreGQxTXNwTHFsbjZFZXVJ?=
 =?utf-8?B?SVlYVm9MTlRRUEUyS05SWWhteXdFMHhhRlZBVXpEZWJ2MVk0ak5Zakc0VHlq?=
 =?utf-8?B?OURFTVNkK3FWSER5M3ZZb3pUUGQ1b3VLaE1aMU54bnU5dFZMSXUxR2F3S285?=
 =?utf-8?B?dHFrdk44R1ZRMmJEU2ZzSjR1V2g0emU3bTJ1QVRleFJ2SjFRbDJOQmRMMGpm?=
 =?utf-8?B?QWF4Z05RQngvLzRwYms5blRLMXlnSytadzUvSlArZGhlTXhuZU5BYzR4MGpT?=
 =?utf-8?B?cjViTTFpRklNMjQzSjdEYW9uNy9lbmdVM1d0ZExmSmEvNzAvSU1DTGxIN3dT?=
 =?utf-8?B?REQ5ZVNEbkFPaW9MeWxYK0VTN3VnQTdGa1pWS1VoYkd4b0YvZ1o3a1B3Q21J?=
 =?utf-8?B?SWV3SGFwSEhzZ1ozbTY5MnhPMVRsNkZZek1mMHc3dG1VT1VrbHQwZXlWQklw?=
 =?utf-8?B?c3JLNi80aGo1SUtSZTN3M0RvYTQzVTRKTm0xb3RMblUvdW1UbHBmdTlvZjcx?=
 =?utf-8?B?V2VmeFcvbURIektnWDFtYVBtOEhFVFFGbU5BS0syQ0tJSnUyZ2lONDY2bW1u?=
 =?utf-8?B?WWJEeFo5NGFOKy8wWEtjSFZxWFRqRGgyYU5SWGV6Z0JCYVBIWHhGdE5qOXRQ?=
 =?utf-8?B?a2xscUw3eUFZUUVocWh4T09DNW1oUjNhaHNqa0V5ck1TU2RBTFdabjNSQk5n?=
 =?utf-8?B?Ykd1WnRXK3VwdkphbnVPcm1aVUlTdlN0djE0Z0JBaXJpemllcDZHM3NKRjJQ?=
 =?utf-8?B?T3EwMlBybmlKSGdwT3pBUUVZa2g5L2Vtc28wc1MydzFVQzdEOEZQWEhwQ2xR?=
 =?utf-8?B?clRDVzVzVldoWlZDVTdnWFlqYVpLQXNydElTWTZ4ejV0amVlVlVpY2Q3MFJQ?=
 =?utf-8?Q?HxluAvqXesXHBAYo=3D?=
X-Exchange-RoutingPolicyChecked: aNRxODQsqDpzeeGBsi3Ea5JzISi1Q0JL9Eb1wPjwMUGNBiADkTVzYrRonSpA2JgVxkKe8dK4FIia74ZViC+J4nYEVrYhCNogm2yF6AJv2LxptCkZFNFvslJlnDK6szTycp6RqQbhuJjpt5G5Oi/PROxhnZfwi/ANaSr/Pt/LgCdWiy/Motdh0cKGo7PX4kRUSEPcJE6xd494jCwdO667ov6ACmXRNdohLXFlsfWNDF2Zy7J2WOR6f5JsFZe2X5sTUnLG1PLFW00n1gk/pwluAKrYh1IABtgdRIDPB1+WBSl9tbe14dENeCjDYmN/MFgk5AI21J9M9cS5vVzwKcvgYw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 758a131e-f34e-4e36-d735-08def1edfe57
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 06:02:41.1218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9H0hzWuQtDqHr2r0Bq57fSXiFjlYPvAyq5L1woKkNWyiqXZJWPraRvJ2+R+m9+gxlOEE/aBdRKuj/2o0u14utc/qem4TU4FS5F9ZhHrLkutKjvl/Hwul5lysnqhdRk7D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB275037
X-OriginatorOrg: intel.com
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



On 27-07-2026 11:33, Sowmiya S wrote:
> Fix intel_boundary_non_joiner_mode_found() to skip exception modes,
> preventing test_basic_max_non_joiner from incorrectly selecting a
> joiner-required mode as a non-joiner boundary mode.
> 
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   lib/igt_kms.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index d591e696d..2475f0916 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7192,7 +7192,8 @@ bool intel_boundary_non_joiner_mode_found(int drm_fd, drmModeConnector *connecto
>   		drmModeModeInfo *current_mode = &connector->modes[i];
>   
>   		if (current_mode->hdisplay == max_hdisplay &&
> -		    current_mode->clock < max_dotclock) {
> +		    current_mode->clock < max_dotclock &&
> +		    !mode_needs_joiner_exception(drm_fd, current_mode)) {
>   			*mode = *current_mode;
>   			return true;
>   		}

