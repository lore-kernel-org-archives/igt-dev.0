Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09CEE7717F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Dec 2024 14:14:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863EC10E1CB;
	Mon, 16 Dec 2024 14:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bVVrQ+EV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F3310E1CB
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Dec 2024 14:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734358483; x=1765894483;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HBpmuo/1FYOlbCL62IzdSe/yklSszjzu5IrhZRp1fAo=;
 b=bVVrQ+EVeQjS/cTNaRe8TaFZm3wN8+oTAgPVGqXYyydGbHCaNL3sHSfL
 3HpTsMLsA9qbehuxFI5hZ/tFlaARpPbHHDgQbSQj/ho8Ckf8H7n2uB0Fo
 Iur1YUZJ+HLmCtmQBqHLv0E+xXIv4rTSJSrJZ1y0rmMK8k1U921H9s7JL
 Une2GPIZpAIZVwRgx0d7wyhp88CS6+gD33lNbLT9AlQbWkFL31NJB+XWZ
 PDhzeDsxPVPu5S70OLyA5X9FVbVVXNOxASM6eTfA2ual/8Ro1N7H7um7K
 nYUkOtbZgF8EeHXptgCEzcO1AC53x6w+xd9o52uZaL2VW8YsUgX6ogu2j A==;
X-CSE-ConnectionGUID: B6xIOQUbQIeH4BacaVGqzg==
X-CSE-MsgGUID: Ncan7WzuS8CYrBc2+jAxgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="22330311"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="22330311"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 06:14:43 -0800
X-CSE-ConnectionGUID: k3dzYh4aTmWvwQ2iFAdIzw==
X-CSE-MsgGUID: GB2Lor1cQEqIpdBUs0QM0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="96977814"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Dec 2024 06:14:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 16 Dec 2024 06:14:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 16 Dec 2024 06:14:42 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 16 Dec 2024 06:14:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQr1sVlk5CxEqpMWtJWA0rdpViqlGhz/K/Nt3IMxtP4WjGRIMmRpr7UwGbwHWB6HokyeG7DFXc2MeFT4YmxxOf1QyJRyt+Bd0YdwRRbl19qsE9oBtM9XrmTT0c8EkN+A9uc6r/1VsnFzaqb8a32jrNy71rNe1edu9DYuHrDWmozo+0Vmrz39hWul2eLAc8ZuKJSXsK5PPZPnL1N8B2lpiUC4qVKPfQpLqlrzQR1k6lHWVw8hi6kkudQVxoRnkmTCupYuWboY40GD/C/WQ4787plNe8uTs0Fh+fu+nKgIUY5rgD186ImSYu3EWfks6edFIqbyxbsSvJR5KxXQ15JLlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dxuNXaLk66fASWUjh2PLMZuffXLMgyf6INrcJ/lS8W8=;
 b=F24VSWzXy+D5HJ+hJQGDMVDZ7KZzzWgUAdd+Xp2vXmq5nDnWAhebek3Jfa19vG57wlMBg40NMAwuEDkVFOZzWXru8J77WQbl0WZubJ3RxdUbZwfX5eHFxrr1m2QVCEKPlUZWw4ZS9YQHWJQAYQuZNfQdRW2Ii+ZiW1qugSnsdsIKWccBBjaTgsg4D3NSUwcbArlD9yFF9qu9evP5wpK1EuebzSUq3uNkX4yOdQ/VN9j2rwaKj7X4lsNVpa3Wylxp1X6S4R76C3wu/xiVcvs7K1RsG/WBsu5PB/+VS0GEx+621JJgwH1h6QOXKTfLavOkEzBf6O6kklz1IQrXPl+SSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6409.namprd11.prod.outlook.com (2603:10b6:208:3b8::18)
 by SJ2PR11MB8300.namprd11.prod.outlook.com (2603:10b6:a03:548::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Mon, 16 Dec
 2024 14:13:59 +0000
Received: from BL3PR11MB6409.namprd11.prod.outlook.com
 ([fe80::74e:6abd:bab0:3d0b]) by BL3PR11MB6409.namprd11.prod.outlook.com
 ([fe80::74e:6abd:bab0:3d0b%7]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 14:13:59 +0000
Date: Mon, 16 Dec 2024 15:13:43 +0100
From: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <andi.shyti@intel.com>
Subject: Re: [PATCH I-G-T v4] tests/intel/i915_hangman: Fix spin engine hang
Message-ID: <xarj46jl7t23hkexmp2wrkxh6q6yioplpl2hggfxio6wr5sjvv@3ygotnvwalhs>
References: <wk2ejntldlc7ayamr7iiblcmh6jumx5a563jpfllco56d4z53p@2ib6m5s55dfx>
 <a3evoug4tajult4jtj5c4vn6plfh3db6mkvg3hludtqrptwy4u@khgd2axkfwpw>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3evoug4tajult4jtj5c4vn6plfh3db6mkvg3hludtqrptwy4u@khgd2axkfwpw>
X-ClientProxiedBy: VI1PR04CA0094.eurprd04.prod.outlook.com
 (2603:10a6:803:64::29) To BL3PR11MB6409.namprd11.prod.outlook.com
 (2603:10b6:208:3b8::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6409:EE_|SJ2PR11MB8300:EE_
X-MS-Office365-Filtering-Correlation-Id: 998b10ff-4bff-4c71-fae6-08dd1ddbe22e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVd0QnNiNGNkZzRXMkkrclNtVmw3R2IyemRSSHQ1L3hZNWlEbFFObXN1eWtq?=
 =?utf-8?B?T3A0T21YeXA4WlRQallLTGlOazhCWGpnZHBuL3ZlQXVhWmgyRm02QzVkZFJ2?=
 =?utf-8?B?VGpJZE1KNXRUV0w1TXdxQUVnUXRENlFHQ0M0Ym84RW92OFpQV0NTVFJEMyt2?=
 =?utf-8?B?MEpaVTBZV3NIYmdRb2UvSGN3aWxPcmQyM2laSGcrVjIvMEE5RUt1RUpnc1RQ?=
 =?utf-8?B?ak9lTUpIVmNpMDY0eWZHK0RqdW54ZHZGMjJOOXRMSTgvMW15UHVBbTgrYk4y?=
 =?utf-8?B?Q2tCbTBFMzIwVWk2K2M1N1RaVlNNM2ZFNnJ3VkZ1NTRsYTdyeTNiNzduQ2Jw?=
 =?utf-8?B?R0dEVjRDRkNKOWtJNERKUmxQNnFCR0xMbUsrWVZJb3VlWUJ5TFFuNEpTZHZq?=
 =?utf-8?B?eCtWK0YvakFORE03Y2JSdDNtazc3SXY3U3ZjYWtzVFpyUk9CSkpKOW44WEY5?=
 =?utf-8?B?SnJyK2NBL2VsZ1liN0w1cTdCUjI3NFE4amcxbFdVWTR1WU5VZzBmdWE4U2xM?=
 =?utf-8?B?RFlzRWRKYWRwTGxlOWs1K0gxekF0UFh0ZUVac0xqbFY1cG5NSVA4dk1zV3lv?=
 =?utf-8?B?N0svZDBJQjFyRjZzYUYycU1aZUhvKzdTWG9XY1FmOWJWSlpGQXdod3RTbHF3?=
 =?utf-8?B?K084SmpldnRxNFREZGFrMjNXNUVCeitrUFVRMHNUaUtjaWVGYi9SZ2t5blp1?=
 =?utf-8?B?TkZid21vUFBDeEQ3ajZPelZlQy9yejNzTW4wZU9Ib3B6NXFvWnJ1eWU3UHdx?=
 =?utf-8?B?bmkwbTVldEFlVHl6Rmg3UGU1K2kwRHJ1anhEMzRtVmpqRC8xMWZISERldGw4?=
 =?utf-8?B?T0crTEwxaDZQOTVsT21FL3M4QURWSFduQVl3RHBINzl6NjBPdjRvWW9rS0dL?=
 =?utf-8?B?bG5QNzcxU0IxK1lBVzRGNDBTZWNyMTY3bkNyMkFPMFlVbWgvNCt1czUrNCs5?=
 =?utf-8?B?VDVNa2xjV0FZUlEvc0FWV203NjNoTWtNT2ZTTHVZb3JMbTk2SDdqOVFsM0tn?=
 =?utf-8?B?bGN5cllFTWxIdkt6dGp6YTR5UlFLaGVsSTRidjNyb2RkZ1plNGVVNS9HNjJ2?=
 =?utf-8?B?ZFVRRGVGZVRFVXdtcSt0Wm1vM0ZqcmJ4czFqNXpGL1pYZVp0aE1HKzVHdnFC?=
 =?utf-8?B?a1NYTGN5NytXNDZuMHE3L3JyclBwNUFJcWZKclIwOVRwNHEzcndZcUwwelB0?=
 =?utf-8?B?Ym9FTG1FSVhzUWlFM3ByUDhqaWtBd3lCcGZKd3QvMm5mdnJxZnF5WThCSUFH?=
 =?utf-8?B?Zms5WSt1eTM3RldJRVdEWnZFeEpUcGI1blJxYUwySEpVR0RsTmhpbUlxcWVM?=
 =?utf-8?B?MWZZZDlhbVFpUGpUTXpQejFiQ3hhZWRJRjRMaUJXYWs4dEZpYVcybTJOTkl4?=
 =?utf-8?B?Vnpzc3FqS2FZSEw4NDV4dzdrS0JHSW5Ra2xOdXdPdkdSSXZXQk04MzVmUkw5?=
 =?utf-8?B?dnVOVUJTWWw3dGRLbmRDV0tiNnFseXBYN0RvVjFHQlBwdjFHZ3MwcFg0dTdr?=
 =?utf-8?B?VXltTk96Zi84WXh5UFNCVVdTaU9YRE41ME15Y2hMMk1DZk5Ob08vNUp4Uzgx?=
 =?utf-8?B?OVAzdWxKZDR4eEl6RktBZ2JXNCtMZmc5WjZKTTd5ajB0dlBaYVZia1g3UDBP?=
 =?utf-8?B?NGhVakcvMDI1b3dKZ1lqNEcwYkFTVkw3SGNSTEhOK2twNXA3WXc1R01tbjVn?=
 =?utf-8?B?aTRPK09yOUVId1AvS2hnTzJFTHNMaWpiZFowSktDNjF0SU9uME5aaWdoenRU?=
 =?utf-8?B?SDFWZnhIaVpPVk9mUEJ0ZmY3QWtrYUhySTY0elBvZjNxa01uL1JCVTJGRC92?=
 =?utf-8?B?UmZYejVHMWhTd21CVVhZaEFseGU3WExIL0RIQ1hpWFBodlQ0MGJCOFRROVJk?=
 =?utf-8?Q?nw6T9FxyDKpGm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azBKSVVxUHovY252dXFsUkZKUGtWNiswTFAwZlA4UUNkbEpuVjNPSEJ2eWZ3?=
 =?utf-8?B?Q1o4QmVaZUY5OFZpdHRGMnlndGJCYThkY2JVZ3pDQjJ6UmVWMUU3Zy9leWM3?=
 =?utf-8?B?RmhzTmxVWWJ6djVOTEJheXdIY3A5OTh4aHlJR0crazhiRytsZUVEdVNGRXZH?=
 =?utf-8?B?NmFueHRkellKYVZyQndIdnc5M1pnSXJrdDhHZHBvcmhNZkxkQVFXdllIMGJw?=
 =?utf-8?B?SzJyNGNRNEI2T1dteDBjN3JzZk9PK1pjYzdDcG1FdHN0NU1EU2h2TVBablJn?=
 =?utf-8?B?bnpKUzBaVys4a0puT0orMzVHMXY3eTBlbmU1dDI4dUFrVHZJbmU5OEFxb3Rv?=
 =?utf-8?B?ZDY4WnZOWU5mMG1USDF1M2RVa1ExUE9UMHBBdUx6Z3ZNZzMzbndUMjJQWTVT?=
 =?utf-8?B?SVNTdkNRek5WSHRaeTdRU3BST1RhU3RmWFRudEkzMnM5QzhYZzlpSFFURjc4?=
 =?utf-8?B?SXlBVmxUQTIzK21jdkk5MDFEc01zRFVxd0pLZ3dUSzYweDlVeE1HdkJMNHNB?=
 =?utf-8?B?dFdXUjJhVHhYMHNXdEp0Wi96VWRrMHpKRE1yejROVGRLWlR0YzBrN0F2dFZY?=
 =?utf-8?B?YzJ5WUhnd0Y2YVpicWdrWDJvUHNuMzloSk5VNFpIaElEeDhoOEVYS01oZytj?=
 =?utf-8?B?TktPenc3ZmxnNERMbENUWk44emE4TG5PUDBYYmo2Nm50cHJPWGlwWFRRNW9y?=
 =?utf-8?B?YkVKWFBXRGdBZnRJNFlaTWRaenNWTWZ0TnpmOSsxU0Q4Y2J6d3hqRmtIcklv?=
 =?utf-8?B?dmpiUS9KY04rd1c5aTgxYlk4VU5ydFpEU1NXaTNPYXFOa1VNZFNXWnhkeVpB?=
 =?utf-8?B?eUxkbXlwVkFvSFgxVkFjdTgzbXZmaDNGNEIyN0lla1FGeHA5QUI3RGRZZXUx?=
 =?utf-8?B?bmhsV3MvMDVKK0E4YTRXcU4rS1Vab1B3c3FoUStSWFl5MHZTWlMxU2xYU2tu?=
 =?utf-8?B?VEtIQXU4a2IyTFl5azFISjRJc0laYlczSmt3NkNFcmFQYXVBemwyQkx1dEtF?=
 =?utf-8?B?RnZ4MkRRcWdrV1I2TFVjTVBRa2h6Q3llTlFtZThlby80NUxoV253NnFqdUdx?=
 =?utf-8?B?a0lGZTRRbjhpSDlBSHVFV2sxUkQvRmt2MWRQbXVySkxuNWQxeFdJNHZHT0ZK?=
 =?utf-8?B?dFAvaWR4UXFEajBoZHNWZEpaWkFMcDJLbHZ2dVFZWlJuRWR3SEpGQ2Jma0Jx?=
 =?utf-8?B?Q2paWmNHSXJhM0VPVTFiQUFQcmpYZVVCOU5zZTd4cy83R1ZhQnZUWUxtSVA2?=
 =?utf-8?B?Z0diZXgrUTlxemxWTlE2VG8xK2xveGZQWXRHQm5FOXVpMWcvbFRycGdvWThC?=
 =?utf-8?B?dXZiRGhlSzlRYUZMZTUzc1lLUEQ1bWVVaUhlRHhkbnhVQTAyaFRCNkdyaUl1?=
 =?utf-8?B?L2p4MjVOOHZmLzRlZ1hMMlgxdE94RmtMelF2cm5YV0l1MEI3MzFTM2tPdmZB?=
 =?utf-8?B?N1IxVVI2UzZWSlpRaHBob2VqMkVjUmlYYWZqOXFrbVg0R0ZQVmd4VVlZQ0tj?=
 =?utf-8?B?VkZuM2JOaXdJSzFXaUFkZE9ZUTRNTXNGajR3eGpjdERkQVc2TUloQytINGQz?=
 =?utf-8?B?dUR5d2R2S1U0WGIxUWVodlBOZXJzQ21pT0pDbkFaNlIzVWQ5Ti9qTnN1aVN0?=
 =?utf-8?B?WmhHb1BPcWgxSjdqeW9PVEVFbVYzSzZybTBxckZyTFE4Q0N3cWp5OSt6ZTRV?=
 =?utf-8?B?ZjNjdkJnb1BBYnVMbVJYYVNqN2RMSXFLL0h3NEZMQVE2dkk0RnFHM0lZWlpz?=
 =?utf-8?B?Nm5GamRxQ2ZISVhGQlo4QXgyY05GSkZKYUh3SitWRnUyTDB0emdqQWhIS3R3?=
 =?utf-8?B?ZWpxQVlMNEtNVmY3UWhyRUh6SXdkU0h4dEs1N0t1dHlDNWhNdVhhTXkzZG0r?=
 =?utf-8?B?ZUQwazJzejlxSW82L01lZVhLalN3cmFWcU5DN2xTYUh0bDJ1ZURHa1VxWTBn?=
 =?utf-8?B?V2xadEszdG5pdWJtQlZYdGpxMjA4TVBpL2NJOFg0SnNueEpkdERrcytKamtV?=
 =?utf-8?B?L29VbFhCM0dWMHdta0Y3S0J2Sm54NEc0MUtad1FNWTlYZEtYczZDUWx2cU9H?=
 =?utf-8?B?Qld4citrVzdJd3VKdmZNbGdXQjEyeUQ2NEg3Z1BBQWNNRXJNZDVMMy9JeDZQ?=
 =?utf-8?B?cXRyTFkvV3dsQXNlenIvTFR1T1QxUEQyRytvbXpnWGZPY1FiWVFmODZMZG5M?=
 =?utf-8?B?ZVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 998b10ff-4bff-4c71-fae6-08dd1ddbe22e
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 14:13:59.0693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kdoKV5cfq4UVzRdPaQmG+WO7Cc2E3In7kIofN9wr529+7Pq3s6lFgVmXUfAUYOxf8M8Kj+VE03sk5WESHDUmgDjsmuOX8xob4uCRARPITtU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8300
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

On 2024-12-16 at 13:42:37 +0000, Krzysztof Karas wrote:
Hi Krzysztof,

> Hi Mikolaj,
> 
> > +static bool is_rcs_ccs(const struct intel_execution_engine2 *e)
> > +{
> > +	return e->class == I915_ENGINE_CLASS_COMPUTE ||
> > +	       e->class == I915_ENGINE_CLASS_RENDER;
> > +}
> > +
> >  static void
> >  test_engine_hang(const intel_ctx_t *ctx,
> >  		 const struct intel_execution_engine2 *e, unsigned int flags)
> > @@ -388,6 +394,10 @@ test_engine_hang(const intel_ctx_t *ctx,
> >  	 */
> >  	num_ctx = 0;
> >  	for_each_ctx_engine(device, ctx, other) {
> > +		/* Wa_14014494547:DG2 */
> > +		if (IS_DG2(intel_get_drm_devid(device)) && is_rcs_ccs(other))

The test fails when both rcs and css engines run in parallel.
What I overlooked in first patch version, was case when both of 
them are running as background spins (initiated exactly in loop above).
So now the test passes not only when one of the engines is tested one,
but also when the other ones are tested.

> In previous version of this patch there were also checks to confirm
> that:
> 1) the current engine is one of the two types,

Current engine doesn't matter now because even if we run test on rcs or
ccs, we will know for sure that the other one won't run in background.
The tested engine is run later in the test and not in this loop.

> 2) the engines are different.

Cc: Andi

This I'd like Andi to comment on. What this check did, was that it
allowed for tested engine to have both frozen spin and normal
background spin. Do you think that this background spin should
still be run or is it negligible?

Mikołaj

> 
> > +			continue;
> > +
> >  		local_ctx[num_ctx] = intel_ctx_create(device, &ctx->cfg);
> >  		context_unban(device, local_ctx[num_ctx]->id);
> >  		ahndN = get_reloc_ahnd(device, local_ctx[num_ctx]->id);
> > -- 
> > 2.47.1
> > 
