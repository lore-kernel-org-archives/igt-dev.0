Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E39C54E67
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 14:15:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B12210F478;
	Wed, 27 Mar 2024 14:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B1OJzB/f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C7510F478
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 14:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711548916; x=1743084916;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=9QZ1sqbuABAQLbClVSUcxCltWeufGn4zEpvSwzTodHk=;
 b=B1OJzB/f+aGJ5A/EzFJkkTLTYjj2Evc0aUOwTQ2PLtGObkPb+6sfWM1L
 RSINpoT40aKArsKwQ2n0/ebiyJavbRvMpRTUZux3Es5Ty/7gwjWNM2wxy
 hg8GSSMtH90vUbdNkquQeFyYN9nBTO77jKi4+W5AtoIUwUoRO6AoiTdoQ
 JCLwecoS94CIWtR+6jKsADekMhKw5g/xldsu2jv/qJ9F5v1+5XAY7D7xW
 n/5jKLGfPuotP2Sn/VYOtyccOAla1ZdHWy7b9eLnELzRs6KCGD5mG4TIm
 oUCy0Iat2lcW4rRc5tIhprqMZli4xvl9+Rr/yAoOdhTodP5c5MG5Hg1S2 A==;
X-CSE-ConnectionGUID: y2XzG/PsSqmawT0Xi5ZT4w==
X-CSE-MsgGUID: VK1Peu5gRcaCOWxTHuBsfg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6786120"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="6786120"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 07:14:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="16150051"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2024 07:14:39 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 07:14:41 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 07:14:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Mar 2024 07:14:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 07:14:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z1PlCoVw6mqkTHiHA2rE50xZIyHVZkqvO+7oGI1Q1uu0N9bkfAlC0xvZSaWObMKax8rxhOB8NonxBxNr5r7tj23wf3Xiu7qZ77aSf9OZPz69s1/lB56ByLB3Nf67ak1LrstnaHrWdIJ94wF7tYkusUpb7l8JSIuVvzbVwJRAQEIhjv/vqzHViH4SgkWMyS8myV1kJcDUjbhC52svnSsJ6oacLtCLqCFQssYcXwR3yXXfnwUilU1ZGAVuFqf6dspSGVc7MOQ648e4LjFJGsDXhUin9baMwkU5GIZcdq83LVgcxFu1HjFzl9XnXoggTpYTVXBZWGJ9oyoX6LRDmwUCuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Skixe72SGolsRUmP8tA7vtjoJNAjfHytcWBfL0VuFI=;
 b=kTBec0Y2KM4PuHK+NMIjcphEMb4RjigMeeotSdq0+O5N0fks9IEeqkBEGLkjzu660h2paKh4ji9ELPEJLQnt5dL/KmhHOTLX6oTr69Ytas7tF6/pax/9BWKaDzBS8mF5lc9omc5rk5oE6J/yiBN6Y/Mh5YZOMT82AGd+vjsvP3tE99DZt/hZnpZw7SiYzzD+nPufMg4C4w5FZU+jzJDOwWcc94ZITTfr+jnjJp6zQL+vePbcUb/gptYxxl+kaHYzQSjb3Zt2bCItcWG/dIZxRaRxbHM5leh4+I9sXFexhfoW9r8dzfINd5mpX4hoMCq3EOUqYOAHAGrb9WW13WKbIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CH0PR11MB5235.namprd11.prod.outlook.com (2603:10b6:610:e2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Wed, 27 Mar
 2024 14:14:38 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::3191:4863:ad54:bdb1]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::3191:4863:ad54:bdb1%4]) with mapi id 15.20.7409.028; Wed, 27 Mar 2024
 14:14:38 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240322221908.857024-1-matthew.d.roper@intel.com>
References: <20240322221908.857024-1-matthew.d.roper@intel.com>
Subject: Re: [PATCH i-g-t] tests/xe_compute: Don't require ccs_mode on every GT
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Wed, 27 Mar 2024 11:14:27 -0300
Message-ID: <171154886764.4174.2317120354856149525@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR03CA0203.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::28) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CH0PR11MB5235:EE_
X-MS-Office365-Filtering-Correlation-Id: d220b260-7808-4b61-bb7d-08dc4e683cae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3b0vS0RyvToasaHOVd0qlvmHLaJpEdpd5F1KQFdcdsKphOTZd8myqScHyD9okprwk/lwz9NwMgUCNIRSfe4xe1y+2bSHDCtc813BOLMkEZzBV+No+QVeVHCyx0/77OL2UR2jJDJRFO2q8d/uCJZgVIh29j9lz8gUnQWWjWd0KRnvnmxqrEuhk9zm/86DlrWBNjuSqJ7yXM2a75OtoqwRJAkg21c0ZP6SX5hCJnZxZSXc+kBbwVw8/lbPUa2qk0Craaw5JzTCNcuV1h4KizbweyiVIVfYyH0Av/WJb7P5NWJAy2p6w/AgrYkkTXMrjZlMFj9z/vJ/17v5ZIMZoT7iuIOrmWb00B41VT588kZD0c9svNSvzmlnnRhByBHrGIb3q/vsmcibCQaop3nfJNZThyuBxffHDiVZ4cWJeWKQa8au/V8+64Q4m/aBWRrjbNunoeGK6USAPzGk3lMDfg/wmMUyum/L1qqYJ771/HGAPgMr64l33cncvg3saimH+rJe7NdRKbZpnfk27l8z3aXXc8rDg92jiamiOQzchXhC7dLBIqUg6Mel/3PqKYT+dpYDTG6nrCT+Jx9uN6TfRjHFvwmu+avu7LA2qsvkK0RKHZjfrNx+en1SLV23SYOlV3C5sCh7aIGlpI8bFmH2Lj3Zlc6PxhWEhDu5dEfXeZs3LU8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1NaN3N2MGtiUGI1Y0xrRmtWVm9YaXUvN1dUeklMZXJIbjEzVEtrYXBMditY?=
 =?utf-8?B?UHhoaFdEaG54cGNBZjBlaUlUcmlJQm9pblVKRXpJa2Z1Z21UajdLckhKbHRm?=
 =?utf-8?B?a3FXa0p3WEJaVU9UcW1EWi9oQy9XNkg4d1pwa2dHZUllU2Y5VEx0VUd5VTlV?=
 =?utf-8?B?ZWJnT2JPY3lEdE1HY1dZYzJXNm5tL3pjWUtsSHd5VFJUT1d0RkhmZDhTRUZ6?=
 =?utf-8?B?YUFvbXpPczd4R3dJVkZYa2g1NHVYOEJZN3RzYkVVV2pJb3lnWWhKblZtZEFz?=
 =?utf-8?B?QW1jOElpcHVBek5LSjIrZlhDUDhwdGVndDV1WHBOd241STBISzIyYnNTTW15?=
 =?utf-8?B?N2MwL1hudHlPNFZmQkVhT3VTR3I1ZmNZTVRmOUhiOEZwU0dVU2RLTGNMcHNO?=
 =?utf-8?B?dTRxNmJDbU8rTitkMzh5V0hTLzZ4ekhLbkcrVVM0aURiUy9vY0VBRlE5WnZY?=
 =?utf-8?B?MU5pQitzNHk1YktBODJtQVhpWm9NTkRIWWZRS1g5cUZBYlVDQ1Q0RmRDMzBM?=
 =?utf-8?B?M2NvLzc0bWZmYmdTN2tXSWZ5ajFza2REWDEwSEdEMXJmOUh0TmIwdnZoWWpO?=
 =?utf-8?B?MjdaTGZlbUFsb3p3ZWhteUtmS2Y3UVhWTEwrT1NwcUdDQkU4bGpvQy91SzR1?=
 =?utf-8?B?ay9TREczUkcvckRVTnpOR3NLOFZWSmhZcFdqNEI1c2sxYzRsNFZzdlhOYzAw?=
 =?utf-8?B?Ulc5RXFtMEI4QklrSUJ4b05qWnpUbEVidmZ2dkJ2Q0graUNNZXd0UFVvWFFv?=
 =?utf-8?B?a2lNRGJPT1JiT2hKNE45YjVEam9SRzRqYWtaZng5eUlzT0kzTWNuWEdNY3hU?=
 =?utf-8?B?RHNrdjlNNjNpc2d5Q0pEYlU4QXVLekFQc3Y3a1BwMVBzK1c4Y2hPN1Z6YUlo?=
 =?utf-8?B?ZSsxaW4xc2NweG1zblArTkozZHlaN1g2cm12UEZkVUhBTEs3QkdqVlZ4TC8x?=
 =?utf-8?B?c1U0aXhRSmFFVXhTTW41NjVBME5QTmFrK1ZHS0tpSzVhMmpjTHEyWVJqaXBh?=
 =?utf-8?B?V3BBWEM1TWFKNXFicGE5czg2L0lzM1FEbGJGQjFIUDdhRmRZYSt0OWZTeUpI?=
 =?utf-8?B?YnhmM2U2ekdFdGh0ejdHZUVJaWdRSWpFY0FObmpZQVIzLzlYbHFQQ2FMRnNj?=
 =?utf-8?B?cDVrdG5MWjJwa0ZqWXZ0ayt4Qnl1MnJMYmM3SURmclB6ZG5lSC9KdlA2M3Qz?=
 =?utf-8?B?UUZHRk5pK2xhdXczNWNTdkZBcmM1N0U1cDdxY29YRFVIMldjekF4NmZWMHRC?=
 =?utf-8?B?N21OSnF2MndmWCswenpQdUxCUmRmalRydEJSdmxydUhQQTZXMTZhODk2OWNR?=
 =?utf-8?B?bGVrQUFGMzRlRDh4aS9IQmhpUlI5SFF1U0hGcjc3UGF3RnFIek9PaTlJT3VP?=
 =?utf-8?B?VkdQOWd3ZVQrVU5GVFZhZjg3UmRJdVRPQWFXUGkvb2poZ1djS2Q1eGRObTFM?=
 =?utf-8?B?YzZvUFJ1Z01WT0xnb1dvcDQ1ZXZTQWQySGkxMHV6WTlxMTlaY1FrTFZ3SEtL?=
 =?utf-8?B?UkQ4Q0hsTEMvZTZxSWRZR0VQM2ZiYkQzemUxNDBwaHVLdGhOMmMxWlNMNDhq?=
 =?utf-8?B?ZmxKSlZud1U2NFRYd2V6Tit6bVRkcDJlQlZnTlRRRWtmb09vSllFa28xUzlE?=
 =?utf-8?B?b1lYNEFPQUFtRnVIdjN5UGRXWmlnam1oUXAxbzZUZVNWcjhBWkdzT2pwYlZQ?=
 =?utf-8?B?YWdlRGFtN0UzOXNTZ1NPY21oajZXZU9NMnpraE8rK003ZGkwM014azRtMWIy?=
 =?utf-8?B?UWJoMDlVQ3lkalJSSkFjdGZwZk53aXNTQ3J6UEViUjFXMm93SUM4aWlFZXBl?=
 =?utf-8?B?Qzdzb3VkUE9zVlFaczN3VHpuSGdjek0wZkFlUEVVWXAxL2lpTktQblB3Qndu?=
 =?utf-8?B?eEt3MUFrMkZXM1BObFJjVEV6UnloVWZ4THJUUnorMGJwM0ZkTEVIYmhSS1U2?=
 =?utf-8?B?Ukp4WTVkQ2VJNG51QjI1OFhoTnRwS0VIbVF3Ti9jSHFTTGpZb3MxQUdLYzRo?=
 =?utf-8?B?T201WEhMQmhKSittWHduS2lLMVByanZXSXJIcVQrZ1NDTHZ5cDNrQkdtTGJw?=
 =?utf-8?B?VmlwSEgvZVVXc0J0NmNjOUxtUTlvOU52Zm9JOWMxVG44SjZxQVVuaHhCMjhj?=
 =?utf-8?B?Skc5M2lKdTJSYTRmMHFvTnFudTBxRXZCYXZ0cmlTbTE0OEhqeFNLVm5zMGZP?=
 =?utf-8?B?a1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d220b260-7808-4b61-bb7d-08dc4e683cae
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 14:14:38.2850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8MpxaNjwy10MeKiFbAmjXBC0HRwscLNRztrOba1zECLGd4WvRPnc+ILX2LeqjpS0H6xRPlf7duwz7BNHzF4yrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5235
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

Quoting Matt Roper (2024-03-22 19:19:08-03:00)
>On platforms with standalone media, we expect some GTs to have CCS
>engines (meaning ccs_mode can be tested if there's more than one CCS),
>but the media GT will never have any CCS engines and will never expose
>ccs_mode.  Move the igt_require() out of the loop so that we don't
>declare the whole test a skip upon encountering the media GT when the
>test already executed successfully on the primary GT.
>
>Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> tests/intel/xe_compute.c | 8 ++++++--
> 1 file changed, 6 insertions(+), 2 deletions(-)
>
>diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
>index 42f42ca0c..fffcfa08e 100644
>--- a/tests/intel/xe_compute.c
>+++ b/tests/intel/xe_compute.c
>@@ -51,13 +51,15 @@ test_ccs_mode(int num_gt)

Looks like we also need to fix test_compute_kernel_with_ccs_mode()?

> {
>         struct drm_xe_engine_class_instance *hwe;
>         u32 gt, m, ccs_mode, vm, q, num_slices;
>-        int fd, gt_fd;
>+        int fd, gt_fd, num_gt_with_ccs_mode =3D 0;
>=20
>         for (gt =3D 0; gt < num_gt; gt++) {
>-                igt_require(get_num_cslices(gt, &num_slices));
>+                if (get_num_cslices(gt, &num_slices) =3D=3D 0)

This next comment is not really related to this specific patch, but I
wonder if `igt_require(get_num_cslices(gt, &num_slices))` should have
been `igt_require(get_num_cslices(gt, &num_slices) > 0)`, since ccs_mode
is only exposed in that case.

If so, then maybe add a follow up patch replacing `get_num_cslices(gt,
&num_slices) =3D=3D 0` with `get_num_cslices(gt, &num_slices) <=3D 1` in th=
e
condition above?

--
Gustavo Sousa

>+                        continue;
>=20
>                 gt_fd =3D gt_sysfs_open(gt);
>                 igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", 0) <=
 0);
>+                num_gt_with_ccs_mode++;
>                 for (m =3D 1; m <=3D num_slices; m++) {
>                         /* compute slices are to be equally distributed a=
mong enabled engines */
>                         if (num_slices % m) {
>@@ -105,6 +107,8 @@ test_ccs_mode(int num_gt)
>=20
>                 close(gt_fd);
>         }
>+
>+        igt_require(num_gt_with_ccs_mode > 0);
> }
>=20
> /**
>--=20
>2.43.0
>
