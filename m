Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDD5D12694
	for <igt-dev@archiver.kernel.org>; Wed,  3 Dec 2025 09:39:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A2010E770;
	Wed,  3 Dec 2025 09:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cqaJyE//";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF56810E746
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Dec 2025 09:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764754780; x=1796290780;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=XZ3JBKFOKES/tc3Ogg60868fvOhX11Ld/sDL92cirX0=;
 b=cqaJyE//dq3kTg2Qq0xWe9VClwgcQArjCQDLb2LImXYORSY+J20nhqlw
 QkuwoI74SH2HfiEewANzBCosZUo0RXmwLn21vQxHa+l9l3WwPQBqRuALA
 bJyDhLiDsZdacHHWDdiwP5sUymh+fl5vENf0+ve9a0PzjswG1G2NbEqjS
 y1kNw8xgnH2njmKxsbC39LHy0I0i0u3Bgpm9B3aKI78ygATgyVFowxc34
 Eh1KTClGIPSZs8xc8ky4rp+vDLDQdkRUfd121SVLEKAPLjzQxfYc87wvl
 QxT7QNRY5mDI7k8R5/mSBSRYOxPwR73WATPGpdv8i56YErJCLwBmsk1fw w==;
X-CSE-ConnectionGUID: lIgDEAtmQ3G0JDt4LR1F8w==
X-CSE-MsgGUID: iwBg391sTYyUTaYk4TyuIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66701685"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208,217";a="66701685"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 01:39:36 -0800
X-CSE-ConnectionGUID: g5GiGQrCSlCvEmXXGKZ9Ig==
X-CSE-MsgGUID: 8TFk++nJTPKNj2kgowy7Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
 d="scan'208,217";a="199035330"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 01:39:35 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 01:39:35 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 01:39:35 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.49) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 01:39:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+sI3QooAP+vmbNq5hjEApHtx7RiFvtbYqWkNjq8G1WhD9IZ4sjzo3iETTnTE+0KPhhWW4n/VnDMf8fb7LJj8oNyzSUbqH0XuiSp4Ux3Edy3Wkj2MKL73T64xWJyxrGViTIiHfXfLy7ngiN8qqPRyLEnPGWEt18sW5t7oUrIOxZgD8YTGG+lvVXSjVUPXMhNf8uANp7vU/7i899U4XgdRB1darJ1cgQ2v1OcXLr6Qhv9WK/UWpg0Wknxx4a8oSxfVAFTSO/flJQ78K4vxpXv0AVTrK4EEogChWSYxJHVYoTLenR4f2bRrqE70mk2sAlnxpeuh9KrFFMcZVje0mvWdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xRDzdVfdCtil9uPmrkHpuJIClaAGzQkLCitjMh1rHS4=;
 b=Jijbb4HUyookWHXVc0wrAmwmSGFwfcP7YPJpQQ8mi2CdV8iDdmp8KPExgfi/hHJkzH+bpNASUUFD5Im7bmhWsipREAZ7qu1bt4wr0hMZ0ajgfr5ngCeU/uv4AxBDvllOdx76RPnGuS1TdUquA0QyP8tPqRovQt8yVrfWcD0ZPqLhb/eRtZNim3EtkcgwJ9jdMnTtruNynP4RNv9P/OBA4Zy/aS7ACpzGKf9l35DQkl7qtDxesiWm9bQ+TrkQg5HUfE4ft0pwD20/LGAKNDsb8cXacYFOhMd1rlC/+ScBmbURRB+h/dXNGTykp/aSDDVdfUQjUDT+pogq3fFLiePsPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by DM4PR11MB6383.namprd11.prod.outlook.com (2603:10b6:8:bf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 09:39:30 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 09:39:30 +0000
Content-Type: multipart/alternative;
 boundary="------------2acYlh0Ux0pHZVePmjqOxwbm"
Message-ID: <9180ae12-d7ec-4a1f-96bc-c610cc20a287@intel.com>
Date: Wed, 3 Dec 2025 15:09:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 3/3] tests/intel/xe_pmu: Refine engine activity
 accuracy test
To: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>,
 <badal.nilawar@intel.com>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <kamil.konieczny@intel.com>
References: <20251113124936.3878794-1-soham.purkait@intel.com>
 <20251113124936.3878794-4-soham.purkait@intel.com>
 <cf076e76-10b3-46c6-a4b1-a6835fcbabc8@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <cf076e76-10b3-46c6-a4b1-a6835fcbabc8@intel.com>
X-ClientProxiedBy: MA5PR01CA0146.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::10) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|DM4PR11MB6383:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b8cd722-1017-4bbd-b3ba-08de324fdbe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TS9hTWtRcHQ0RS96NzZ1L0NCVVo4M2pvWlRCTGozcXEwLzRlNGNGMHp1b0hx?=
 =?utf-8?B?SXEvYWJseFVXTVFHdlZyY0lDU3B1RXpMb3ZwZnE4UC9xWjRleERVSmIraUVu?=
 =?utf-8?B?LzFvWHdDTXhpSThONTViTWxsTG5TUVNidVZsK0RpdUlHZnM1Z0pPa1ZSNnZp?=
 =?utf-8?B?R0tvb1p3dnZjK3l0ek5UaHVnSGQrRHkyeGk3UmV4a1BhdjFPMnd4Yy8wekQw?=
 =?utf-8?B?TnE3b1NwdHU1UFBjSFh0NUQ3TUhGK1A1MjVaNWNmWlV0ZTliZWgvLzBXS0lG?=
 =?utf-8?B?MFJJdWVXbldTcVVya05mdnBGNURqMFphRURuVE1DTFhMTEJmS3FvQVJwRjVp?=
 =?utf-8?B?Uk5lRnNwUEd1TG9pVk93UENQS0Z0cWFpejRuWUZ3OXVCWTdPYXBROW1RcTJk?=
 =?utf-8?B?Tk5QWWphaDFuN3FneEF6blpoS05vTVBWVlA2YkVlWEcvYkhmK1F2Wkk1cTJa?=
 =?utf-8?B?QlhBbVFPUUcxZ0I2WGQrZTVRd3pkUW81UmNza1YxTGdoWVlGZ2RTdUVWSnAx?=
 =?utf-8?B?elhWUWZmU0llNE9zZExNdDVxeFZPQnJBYUJjb1JmMVNja1NnK0EwZDJkVm5u?=
 =?utf-8?B?cGhHVnc1Y0VOM3UrRFRsMVJwOXRtK0RVOSs4aVJaNVV2TGxBVkVmNUh2eGw3?=
 =?utf-8?B?dVB1dVlrWk9KaGVyVzFDTXNxczZSYWk5eHU1a0g2SjcrTzhUU1FNRlFyb0wz?=
 =?utf-8?B?MDcwclI2OXNpSzNCbWc2N01KOHoycldaS2ZmMXJUaTBxS1VIQUZhTkNWcklH?=
 =?utf-8?B?b0pUTXRpMzZ4WHZUSm03aDUxZTFrRWV6Q0lLYUlKVHVIdnFhdlc4RG5nZTQw?=
 =?utf-8?B?ZThoUzlFMUtsZXdlWFFPdzdkN0xJbFBORTFFbFVQRFROUXBwS3p2TUhKWUpD?=
 =?utf-8?B?aWFmVm54bnVVVVlDcUhFcTZPQ1ZGWE9oRStEYWlIWHBrVXVaNUlYT2ZKZWlU?=
 =?utf-8?B?Z2tDNzZMeGhmK0NWRFd1QWYrZWV1Y1o3Y0M4dXYrU2VRcGEvMDRzeGZTOVFu?=
 =?utf-8?B?NCtiSzB5bWxMVFVTQlR2OHNlNkw4OFovSTFSYW5UNmJ2U0NqVHQ2c2IxTkpZ?=
 =?utf-8?B?ZVBNWmg0WFNWRjJWVlIvR2c3ckFuME9RTGpOYUozbWlKNlB0Unk2bkFlZllt?=
 =?utf-8?B?V3liMU8vc0plOUtuMEowM2dOVGhHYmQ4T0dFR1B3Y003NW9YRnpmNFhpYWtH?=
 =?utf-8?B?NFEvbHNBNUN4RWg4MEtsUHBVRXFXUzAwdUxmdXliMkNYWWF3YVJrQjRuMTBW?=
 =?utf-8?B?bHhGYWZucFF3SkpMVng3Slh5RDF0MWRkR3VmbGsxdVRQY1ZnKzJ1ZWpNZXF1?=
 =?utf-8?B?eVY1K2I5cGUzZ1ZPT2NXRzBqeG85R0Mzd1RsTHZnYnM4NEgxWXpWWEliYTRH?=
 =?utf-8?B?UUZhajg1c2ZCWExyYTI1bERGZWZ3QUJVbjFDS0h2Z21nV1lHd1VEUGFLNkM3?=
 =?utf-8?B?MGcvb3UrdlNocFl1YWhPd3NnM1lUUzJ5d0FhaWZvTGZ3OTJjV0xWUUVIbEt0?=
 =?utf-8?B?ZElPWmVoS1hzVWpGd25KN1NDV0dDYnhOeEtvR1R1VmVZYUVoejQxUFRlYmVH?=
 =?utf-8?B?clNFOHhDZ0dXWEd0ZzFZVFc1V2dWRzhNQ0RBeEhLWE9VQ0FJK2FRNnlyNUNF?=
 =?utf-8?B?K3VEdXVqMWViNk9HcHVLakNQaC85TmZVRTRVOFVIUFF4NG4vRnRtL04zbWF4?=
 =?utf-8?B?cVl0Ky96OXk3SURjNUk3a0tMbE9iWk9kUG9yQUMrZEJlSjBrRVBnRzR1Q1dj?=
 =?utf-8?B?d2RVZEJqaE15R2FZWEFsVkVQUURYKzkvV0JBMm54SW9FSzUrMFZObXpJNUps?=
 =?utf-8?B?OEJNU0FsVk5aM2cxcVB0VWxTc0MrUGRpcDMxMklvc2NmdzllUzBBcGp5UkRI?=
 =?utf-8?B?bmRueS9sS1l4cjlZaThkNmI0eVdhWkZqdmxwRWtGQ3czRnR4dlZzVW9WVlBY?=
 =?utf-8?Q?aYtLLFze264O1UanC5qyDwQ15lQd4VdX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0tDNmxSTHMydlkrbGpXb2tsdzVoSitqNVVRZE4xOXdzZVc4bzZlc3VSNUtL?=
 =?utf-8?B?eXRhRzZZYjlzRUpWcEc2cVJHbE9LMEtxWThoazk0ZnVSdzlKNDNuWXN1Misv?=
 =?utf-8?B?ZFhmeWVzTlhlcko1VnNONmVzem1ETFNBS1IzdXdsa0t3RU1LeUVkUDcwMjRi?=
 =?utf-8?B?WGtHblRDZEd6RWFlbGdNN1QzVWFJOTBEbWV2Zm9KUDNzMEJ3UFFCZUh2TTNP?=
 =?utf-8?B?MWNSU01VTE9yNU1ZZVFFYWx2MXgyK0dRd3Y1MXdSSE9IL0hsdWNSbUlLczNI?=
 =?utf-8?B?SExVSE9oMGQ1TXc1MWRaUlhIazNTQjBMaGZQZEpqTTc0QjFSTFVYNGZjU2t6?=
 =?utf-8?B?S3NrTU5EbVZ5aFE1aG5EcWF4Mmg2UE9scHBLY1k5QWtEdGdIOVNscW5Uc2gy?=
 =?utf-8?B?NW5lcGp2N1dpMnQ5c2psdjFOYTRiNTRyaW03bXUwTkV2dVppU0FDV21YWFIw?=
 =?utf-8?B?RGp3VEk5WERxaVNIUkFzNmg1eTZOeXBwWHl3U01ZdVcxTTM0S3NlaXRtNWdK?=
 =?utf-8?B?bTM3MFA0V3VsdzVtTDluZHE2MW85MVlkSlRwRUZJemFNbTFuV20zbjMvOWZ2?=
 =?utf-8?B?eUFFNnhFMjd2cUZabXFhcjdNVno0OHpDVXN4MDZRQkJaSWk1bjl5VkVmTSt1?=
 =?utf-8?B?THlGMkt6VjgxS3k3d2VrcFNKMHFnMFJpYkgvQ1hjN3lQb1c0OVc4STUvT1FN?=
 =?utf-8?B?N1lIOXdya2VLeVBSTWxMWWNXelM2L2tZTVpwamZ0NEIzcTV3a3pjQmpDMWFP?=
 =?utf-8?B?Y0k2NzVqaDlISEN5bmp4RkdtODZxZ2JzdlVlU0dFWVZYUlMvZlFWZEhEemJQ?=
 =?utf-8?B?dENzaG44L2NoZUdBZjBLUE9iQlM4YXRycExiVHBYQks0bERVZ2U1ZkR5eldI?=
 =?utf-8?B?ZmdVYjFDa080TDMvM1RtR0N1MHpyWTJ5QU5SRGtQTld3RW9ud0xRbW5GWlB2?=
 =?utf-8?B?WC9XS1gwbHdaR1VuZXVuVXprc3dQeVM0amp6RWVLWnFhMXl4bU5LU1RXTFpn?=
 =?utf-8?B?QW9lSlVIbEt3eTN0NWRhclVHcjl1eUtQUUVvOHlVWmNkWjkzZ3dSTUhselBp?=
 =?utf-8?B?UlcranJ6SlkxUTNnOFBLSmdhRVgwR0dwc3M2TWx5SnQydUlmUHV3L2w1K25T?=
 =?utf-8?B?amZjYU1OU254UERNd3c1OGloWlJxT3dQSWJMUkdoMU8zZlBDN0MrUUxwbElV?=
 =?utf-8?B?bTlsN2wxeWtnR28vME1xTHY4eENmZnd1SS9rbHBVRWNYZzhNcXNOSWlzdkFR?=
 =?utf-8?B?VCt1T3JXWXl6OXllK2xaWkFPT2lDWjl3ZUJhZk1wV29HYkcvMjkrZDAwbWdI?=
 =?utf-8?B?QU9aVm5ld0R3RW1GUGFEQVVXdm9iZjczQ2NlcWNoeFk5ZDFkSm10MzVPa056?=
 =?utf-8?B?UDNZNFdzb0RsRXlUSDdyc2xld2RGTWtLaGJFK1ZrMEJ0OWF3d3N0SG9abmR3?=
 =?utf-8?B?cUQ5STUzOE9tRUFnSWx1OFplQjZMdGFBYVlTVFRPTVZYVUZwSzlSZWUyWWJE?=
 =?utf-8?B?VTF4SGNTR0VUVmxpSGNDWUliRmtybWNjcENpZFdDZldKV2RBa2JYNmFZUUV3?=
 =?utf-8?B?K0s3ak5iQ0k2dlN5U3ZTcG8rVDZ5UGMzdU16am5VYUd0RU1GQlIxem1FRUhw?=
 =?utf-8?B?SXNjTnBoOTJzRDBnSWo4eHowWjh6eXA4QjkwQWhNMEN1eGZ5WWV1VkwvV0Iy?=
 =?utf-8?B?YVY2ZkJjR2JobkNadzJKeUJTMEVhN05ObUlqcUJhSUQ5U3lWVlRyVVdIai9P?=
 =?utf-8?B?NXYvK04wcEt1TTR6bUJ6Z1ozMkNBbUFwUEFnSlloZStpd1RsRWpZaEpRcmwz?=
 =?utf-8?B?L0czdU0vOFNVZnV2VFdGaGdoaWtMYndnTTV2VmdQQjNQckJtcVgyZnJUWllZ?=
 =?utf-8?B?Z0M0TDhEaUUrbU9XTTJKeHl5ekpQR096Q2JUWVlmVG9ITHF6d3FqekRnT0Zz?=
 =?utf-8?B?M0hMVmNkZWF1MWNPd3J1bzVGQWVOZUMvTmhpUVZ6WTBWN1dVSExtc08xelEx?=
 =?utf-8?B?clJSYldZWjJwVEE1OU1Vem5IWG5ZejdZUkZ3eTlFUVQ3YU8rL2RoTElqQk5W?=
 =?utf-8?B?N0FFd1IrUXNEWVQ4Nk1kYnJrNlZTZFE4UzZLaFRqZ1lTa3hJT0txcVh2TmhC?=
 =?utf-8?B?dTQ2Z3ZndU9JS0sxV0dOTEN1Mi9ud1BVb1JnVm1MZWlhc3RwOERRSUNYcmR6?=
 =?utf-8?B?dmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b8cd722-1017-4bbd-b3ba-08de324fdbe3
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 09:39:30.7803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AFGfGx1jxqKHg4pCqkus+yPbqflD6z7Ln/UAJj/OKREbk3MW2FFavxzS32QgNfm98ejTsMiaAorriMLZYD3MZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6383
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

--------------2acYlh0Ux0pHZVePmjqOxwbm
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Riana,

On 28-11-2025 14:56, Riana Tauro wrote:
> Hi Soham
>
> On 11/13/2025 6:19 PM, Soham Purkait wrote:
>> Instead of creating a new spinner during each pass, it's more 
>> efficient to
>> instantiate the spinner once and reuse it by properly ending and 
>> resetting
>> it between iterations.
>
> Give an overview of the the issue and the links in Closes
>
>> This approach reduces the overhead associated with repeated spinner 
>> creation,
>> saving time across multiple passes. By eliminating the cumulative 
>> time spent
>> on spinner initialization (i.e., creation time * number of passes),
>> the spinner's active duration more accurately reflects the actual 
>> engine busyness.
>> This leads to more precise measurements of the percentage of engine 
>> busyness in
>> terms of spinner running time.
>>
>> With this change engine-activity-accuracy test result clearly shows 
>> the difference:
>>
>> Before spinner reuse :
>>
>> Starting subtest: engine-activity-accuracy-90
>> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_RENDER0
>> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% 
>> (90000us/10000us)
>> error=-2.90% (81.03% vs 83.93%)
>> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_RENDER0: SUCCESS (1.598s)
>> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_COPY0
>> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% 
>> (90000us/10000us)
>> error=-2.81% (83.06% vs 85.87%)
>> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_COPY0: SUCCESS (1.684s)
>> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_COMPUTE0
>> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% 
>> (90000us/10000us)
>> error=-2.04% (83.83% vs 85.87%)
>> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_COMPUTE0: SUCCESS (1.667s)
>> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_VIDEO_DECODE0
>> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% 
>> (90000us/10000us)
>> error=-2.15% (83.99% vs 86.14%)
>> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_VIDEO_DECODE0: SUCCESS 
>> (1.647s)
>> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE0
>> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% 
>> (90000us/10000us)
>> error=-2.00% (83.59% vs 85.60%)
>> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE0: SUCCESS 
>> (1.664s)
>> Subtest engine-activity-accuracy-90: SUCCESS (8.264s)
>>
>> After spinner reuse:
>>
>> Starting subtest: engine-activity-accuracy-90
>> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_RENDER0
>> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% 
>> (90000us/10000us)
>> error=0.03% (89.45% vs 89.42%)
>> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_RENDER0: SUCCESS (1.560s)
>> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_COPY0
>> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% 
>> (90000us/10000us)
>> error=0.02% (89.56% vs 89.54%)
>> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_COPY0: SUCCESS (1.559s)
>> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_COMPUTE0
>> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% 
>> (90000us/10000us)
>> error=0.02% (89.42% vs 89.40%)
>> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_COMPUTE0: SUCCESS (1.571s)
>> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_VIDEO_DECODE0
>> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% 
>> (90000us/10000us)
>> error=0.01% (89.28% vs 89.27%)
>> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_VIDEO_DECODE0: SUCCESS 
>> (1.581s)
>> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE0
>> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% 
>> (90000us/10000us)
>> error=0.01% (89.37% vs 89.36%)
>> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE0: SUCCESS 
>> (1.583s)
>> Subtest engine-activity-accuracy-90: SUCCESS (7.859s)
>>
>> v1:
>>   - Add how this patch improves the engine activity accuracy test. 
>> (Lucas)
>>   - Show the numbers with the said improvement. (Lucas)
>>
>> Fixes: 477154cbad2c ("tests/intel/xe_pmu: Add tests to validate 
>> engine activity accuracy")
>
> Add all gitlab issue with Closes:
>
>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>> ---
>>   tests/intel/xe_pmu.c | 11 ++++++++---
>>   1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>> index 9525655ba..af0c2dfe4 100644
>> --- a/tests/intel/xe_pmu.c
>> +++ b/tests/intel/xe_pmu.c
>> @@ -534,6 +534,10 @@ static void accuracy(int fd, struct 
>> drm_xe_engine_class_instance *eci,
>>           intel_allocator_init();
>>           ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>>   +        spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe = eci);
>> +        xe_spin_end(spin->xe_spin);
>> +        xe_spin_sync_wait(fd, spin);
>> +
>>           for (int pass = 0; pass < ARRAY_SIZE(timeout); pass++) {
>>               unsigned int target_idle_us = idle_us;
>>               struct timespec start = { };
>> @@ -552,10 +556,10 @@ static void accuracy(int fd, struct 
>> drm_xe_engine_class_instance *eci,
>>                   igt_measured_usleep(target_idle_us);
>>                     /* start spinner */
>> -                spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe 
>> = eci);
>> +                xe_spin_reset(fd, spin);
>>                   loop_idle_ns = igt_nsec_elapsed(&start);
>>                   igt_measured_usleep(active_us);
>> -                igt_spin_free(fd, spin);
>> +                xe_spin_end(spin->xe_spin);
>
> Should there be wait here?
Yes, ideally |spin_sync_wait()| should be used here. However, to my 
understanding,
the amount of time this call consumes actually defeats the very 
objective of the test,
leading to a higher error percentage.
Although, in my opinion, as wait is not used, the rest of the block 
compensates for this.
>
>
>>                     now = igt_nsec_elapsed(&start);
>>                   loop_active_ns = now - loop_idle_ns;
>> @@ -590,6 +594,7 @@ static void accuracy(int fd, struct 
>> drm_xe_engine_class_instance *eci,
>>                         sizeof(expected));
>>           }
>>   +        igt_spin_free(fd, spin);
>>           xe_vm_destroy(fd, vm);
>>           put_ahnd(ahnd);
>>       }
>> @@ -622,7 +627,7 @@ static void accuracy(int fd, struct 
>> drm_xe_engine_class_instance *eci,
>>       igt_info("error=%.2f%% (%.2f%% vs %.2f%%)\n",
>>            (engine_activity - expected) * 100, 100 * engine_activity, 
>> 100 * expected);
>>   -    assert_within(100.0 * engine_activity, 100.0 * expected, 3);
>> +    assert_within(100.0 * engine_activity, 100.0 * expected, 2);
>
> Is this tested on multiple platforms?

Yes it is tested on BMG, LNL and PTL.

Thanks,
Soham

>
> Thanks
> Riana
>
>>   }
>>     static void engine_activity_all_fn(int fd, struct 
>> drm_xe_engine_class_instance *eci, int num_fns)
>
--------------2acYlh0Ux0pHZVePmjqOxwbm
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Riana,</p>
    <div class="moz-cite-prefix">On 28-11-2025 14:56, Riana Tauro wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:cf076e76-10b3-46c6-a4b1-a6835fcbabc8@intel.com">Hi Soham
      <br>
      <br>
      On 11/13/2025 6:19 PM, Soham Purkait wrote:
      <br>
      <blockquote type="cite">Instead of creating a new spinner during
        each pass, it's more efficient to
        <br>
        instantiate the spinner once and reuse it by properly ending and
        resetting
        <br>
        it between iterations.
        <br>
      </blockquote>
      <br>
      Give an overview of the the issue and the links in Closes
      <br>
      <br>
      <blockquote type="cite">This approach reduces the overhead
        associated with repeated spinner creation,
        <br>
        saving time across multiple passes. By eliminating the
        cumulative time spent
        <br>
        on spinner initialization (i.e., creation time * number of
        passes),
        <br>
        the spinner's active duration more accurately reflects the
        actual engine busyness.
        <br>
        This leads to more precise measurements of the percentage of
        engine busyness in
        <br>
        terms of spinner running time.
        <br>
        <br>
        With this change engine-activity-accuracy test result clearly
        shows the difference:
        <br>
        <br>
        Before spinner reuse :
        <br>
        <br>
        Starting subtest: engine-activity-accuracy-90
        <br>
        Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_RENDER0
        <br>
        calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00%
        (90000us/10000us)
        <br>
        error=-2.90% (81.03% vs 83.93%)
        <br>
        Dynamic subtest engine-DRM_XE_ENGINE_CLASS_RENDER0: SUCCESS
        (1.598s)
        <br>
        Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_COPY0
        <br>
        calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00%
        (90000us/10000us)
        <br>
        error=-2.81% (83.06% vs 85.87%)
        <br>
        Dynamic subtest engine-DRM_XE_ENGINE_CLASS_COPY0: SUCCESS
        (1.684s)
        <br>
        Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_COMPUTE0
        <br>
        calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00%
        (90000us/10000us)
        <br>
        error=-2.04% (83.83% vs 85.87%)
        <br>
        Dynamic subtest engine-DRM_XE_ENGINE_CLASS_COMPUTE0: SUCCESS
        (1.667s)
        <br>
        Starting dynamic subtest:
        engine-DRM_XE_ENGINE_CLASS_VIDEO_DECODE0
        <br>
        calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00%
        (90000us/10000us)
        <br>
        error=-2.15% (83.99% vs 86.14%)
        <br>
        Dynamic subtest engine-DRM_XE_ENGINE_CLASS_VIDEO_DECODE0:
        SUCCESS (1.647s)
        <br>
        Starting dynamic subtest:
        engine-DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE0
        <br>
        calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00%
        (90000us/10000us)
        <br>
        error=-2.00% (83.59% vs 85.60%)
        <br>
        Dynamic subtest engine-DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE0:
        SUCCESS (1.664s)
        <br>
        Subtest engine-activity-accuracy-90: SUCCESS (8.264s)
        <br>
        <br>
        After spinner reuse:
        <br>
        <br>
        Starting subtest: engine-activity-accuracy-90
        <br>
        Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_RENDER0
        <br>
        calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00%
        (90000us/10000us)
        <br>
        error=0.03% (89.45% vs 89.42%)
        <br>
        Dynamic subtest engine-DRM_XE_ENGINE_CLASS_RENDER0: SUCCESS
        (1.560s)
        <br>
        Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_COPY0
        <br>
        calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00%
        (90000us/10000us)
        <br>
        error=0.02% (89.56% vs 89.54%)
        <br>
        Dynamic subtest engine-DRM_XE_ENGINE_CLASS_COPY0: SUCCESS
        (1.559s)
        <br>
        Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_COMPUTE0
        <br>
        calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00%
        (90000us/10000us)
        <br>
        error=0.02% (89.42% vs 89.40%)
        <br>
        Dynamic subtest engine-DRM_XE_ENGINE_CLASS_COMPUTE0: SUCCESS
        (1.571s)
        <br>
        Starting dynamic subtest:
        engine-DRM_XE_ENGINE_CLASS_VIDEO_DECODE0
        <br>
        calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00%
        (90000us/10000us)
        <br>
        error=0.01% (89.28% vs 89.27%)
        <br>
        Dynamic subtest engine-DRM_XE_ENGINE_CLASS_VIDEO_DECODE0:
        SUCCESS (1.581s)
        <br>
        Starting dynamic subtest:
        engine-DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE0
        <br>
        calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00%
        (90000us/10000us)
        <br>
        error=0.01% (89.37% vs 89.36%)
        <br>
        Dynamic subtest engine-DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE0:
        SUCCESS (1.583s)
        <br>
        Subtest engine-activity-accuracy-90: SUCCESS (7.859s)
        <br>
        <br>
        v1:
        <br>
        &nbsp; - Add how this patch improves the engine activity accuracy
        test. (Lucas)
        <br>
        &nbsp; - Show the numbers with the said improvement. (Lucas)
        <br>
        <br>
        Fixes: 477154cbad2c (&quot;tests/intel/xe_pmu: Add tests to validate
        engine activity accuracy&quot;)
        <br>
      </blockquote>
      <br>
      Add all gitlab issue with Closes:
      <br>
      <br>
      <blockquote type="cite">Signed-off-by: Soham Purkait
        <a class="moz-txt-link-rfc2396E" href="mailto:soham.purkait@intel.com">&lt;soham.purkait@intel.com&gt;</a>
        <br>
        ---
        <br>
        &nbsp; tests/intel/xe_pmu.c | 11 ++++++++---
        <br>
        &nbsp; 1 file changed, 8 insertions(+), 3 deletions(-)
        <br>
        <br>
        diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
        <br>
        index 9525655ba..af0c2dfe4 100644
        <br>
        --- a/tests/intel/xe_pmu.c
        <br>
        +++ b/tests/intel/xe_pmu.c
        <br>
        @@ -534,6 +534,10 @@ static void accuracy(int fd, struct
        drm_xe_engine_class_instance *eci,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; intel_allocator_init();
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ahnd = intel_allocator_open(fd, 0,
        INTEL_ALLOCATOR_RELOC);
        <br>
        &nbsp; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe
        = eci);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_spin_end(spin-&gt;xe_spin);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_spin_sync_wait(fd, spin);
        <br>
        +
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (int pass = 0; pass &lt; ARRAY_SIZE(timeout);
        pass++) {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int target_idle_us = idle_us;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct timespec start = { };
        <br>
        @@ -552,10 +556,10 @@ static void accuracy(int fd, struct
        drm_xe_engine_class_instance *eci,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_measured_usleep(target_idle_us);
        <br>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* start spinner */
        <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm,
        .hwe = eci);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_spin_reset(fd, spin);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; loop_idle_ns = igt_nsec_elapsed(&amp;start);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_measured_usleep(active_us);
        <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_spin_free(fd, spin);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_spin_end(spin-&gt;xe_spin);
        <br>
      </blockquote>
      <br>
      Should there be wait here?&nbsp;<br>
    </blockquote>
    Yes, ideally <code>spin_sync_wait()</code> should be used here.
    However, to my understanding,<br>
    the amount of time this call consumes actually defeats the very
    objective of the test,<br>
    leading to a higher error percentage.<br>
    Although, in my opinion, as wait is not used, the rest of the block
    compensates for this.
    <blockquote type="cite" cite="mid:cf076e76-10b3-46c6-a4b1-a6835fcbabc8@intel.com"><br>
      <br>
      <blockquote type="cite">&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; now =
        igt_nsec_elapsed(&amp;start);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; loop_active_ns = now - loop_idle_ns;
        <br>
        @@ -590,6 +594,7 @@ static void accuracy(int fd, struct
        drm_xe_engine_class_instance *eci,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(expected));
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        &nbsp; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_spin_free(fd, spin);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_vm_destroy(fd, vm);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; put_ahnd(ahnd);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        @@ -622,7 +627,7 @@ static void accuracy(int fd, struct
        drm_xe_engine_class_instance *eci,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_info(&quot;error=%.2f%% (%.2f%% vs %.2f%%)\n&quot;,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (engine_activity - expected) * 100, 100 *
        engine_activity, 100 * expected);
        <br>
        &nbsp; -&nbsp;&nbsp;&nbsp; assert_within(100.0 * engine_activity, 100.0 * expected,
        3);
        <br>
        +&nbsp;&nbsp;&nbsp; assert_within(100.0 * engine_activity, 100.0 * expected,
        2);
        <br>
      </blockquote>
      <br>
      Is this tested on multiple platforms?<br>
    </blockquote>
    <p>Yes it is tested on BMG, LNL and PTL.</p>
    <p>Thanks,<br>
      Soham</p>
    <blockquote type="cite" cite="mid:cf076e76-10b3-46c6-a4b1-a6835fcbabc8@intel.com"><br>
      Thanks
      <br>
      Riana
      <br>
      <br>
      <blockquote type="cite">&nbsp; }
        <br>
        &nbsp; &nbsp; static void engine_activity_all_fn(int fd, struct
        drm_xe_engine_class_instance *eci, int num_fns)
        <br>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------2acYlh0Ux0pHZVePmjqOxwbm--
