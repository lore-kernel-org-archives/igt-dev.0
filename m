Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4328FCD5BB1
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 11:59:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE12710E189;
	Tue, 26 May 2026 11:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RvZmFqXb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53F010E189
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 11:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779796767; x=1811332767;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=78zOQ7WQ5GC5D6FNMSmdePG9c71xINX0H+Imnd/gCuY=;
 b=RvZmFqXbMOxZOFQ8l+7EkTKSSOd7wKvgQic13s0gA1ae814DsYOU3cAr
 84CxLzKGOfOaajemQF5kRKM5Ab8TfCFhW/9+2zJJpI7dNaD0RNGhkkHkf
 w54TW7SHShCSuWV77d26uInt0l3gYKAyICohdeoSiUo5h7208SS0+gZqa
 3GBmfFFm1hqNAmNYZz823DJcvqILar3O6QIMNtdTx98/Q6yUKjqMIzhMa
 knCikAMwCOItNSiXTS5ozB/E78wSL+/GXPzUxcWnTLMe9cExIE7tSnomV
 pCJHaYXvPALPgBjx8BcxmTb9PktAQYCoXofB8Rr392i1lSmvt7uJKs/eI Q==;
X-CSE-ConnectionGUID: YGsgHngoQOul3WsUNohSkA==
X-CSE-MsgGUID: zzlLXWmmRZGCnCguvwgnRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80456243"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="80456243"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 04:59:26 -0700
X-CSE-ConnectionGUID: XzXBovkbQ1KkkrrkIjzQMw==
X-CSE-MsgGUID: bA1mcDyPR/abYsNvfuH86A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="240850402"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 04:59:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 04:59:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 04:59:25 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 04:59:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RFK22SnV4/fxeysl392X2zKuMB34ca4RwGwb96v6dZu9WI7vgaM07DXscJpTbP8FCJqFFoepeOgsvxS7e/C9u28VAeaCyxt2RM+4h0D4ZUAnEQ0rXZzSb6ijZXNaP8lQ6VWJ3pBVe2K1tyX+dRp933PCjX5ycpAGUF7oeKRIqa5i++/nyoAX4Dwgdb35QvtP/hpA9TKMhahimemQgso/lIdw4mmNi4Dghtk56tq1u7kU3ZH9e4/g9sNjf7V2DF5573EozsJPu3V82R3gqR0sY8aqRPdZASYxGIksDa3z0EWYZxfhlJ7QToGXHEBgu2rTnTQj65Zu25yPb7BvXpAKgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78zOQ7WQ5GC5D6FNMSmdePG9c71xINX0H+Imnd/gCuY=;
 b=SdlRL9MMbWEwmthr5LEmkjvL9N6iyT+no/GTIsiUPWalGki/cJLnlWN6dpJi2FLwy/s0c1aFknfNHykmqxJF9czWrEb7NKesBRSvwO3b6xPtDwAGiNmNe3aWkiWMsm+FtyX50RMXPnJIT3s9zwhDGxHJN90Kc8LK0+KBaL1yjW53co49gzyYHQksGxZDCk/mRuiDjC5PR72don7W3XklhaC8Wt6LIFORo8R4k/dK+CB+jukXfuSRo4AY/k3ouckAGu7ykM+BIDF8Xbw/3VfrDXS6bKrgY9CdRwQmVJuefdss626av8Z8rubopmHFAZITffL/IbROu1JoWJtQ8k5s4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by PH8PR11MB8013.namprd11.prod.outlook.com (2603:10b6:510:239::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 11:59:15 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0048.016; Tue, 26 May 2026
 11:59:15 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 26 May 2026 13:59:09 +0200
Message-ID: <DISLAJF1M2CM.34O1ZGNO7XPCJ@intel.com>
CC: <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <zbigniew.kempczynski@intel.com>, <x.wang@intel.com>
Subject: Re: [PATCH v4 1/2] lib/drmtest: add __drm_open_driver_path()
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, <igt-dev@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <cover.1779793438.git.sebastian.brzezinka@intel.com>
 <ce36517d762c8e1f7e8988df446f12853f2fdda6.1779793676.git.sebastian.brzezinka@intel.com>
 <c7f64283b82bdbf091007180335a3eed6a56c4ba@intel.com>
In-Reply-To: <c7f64283b82bdbf091007180335a3eed6a56c4ba@intel.com>
X-ClientProxiedBy: DB7PR05CA0006.eurprd05.prod.outlook.com
 (2603:10a6:10:36::19) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|PH8PR11MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bf9416f-b2b3-4ed0-d735-08debb1e3570
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003|6133799003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: gMvenfSw0OHMi3erZVLNSI+OzRWMqJbarbsFJZBCOiHVGRGRU2rDZDold8JERT96jg+1GMWU0zicu44Kv1hbMjfbyXLaXpYE+12PT0DMypaUudbu5tMf7oxv7jfk4IZVij0/FBcBWf5deZ2uGkwPEwdoRlE1CzwnX5+DQryLH20Rdub+6iVbaoHm87mtKMoa2YTmW23U9o7bpD3rJyXi1O3vj+EbNwnocF3s5LVIMYqUr2KsJ8i4M4vQU4Np/xEFLklGHrDxT1JimHPJiccGdFKDSfwbXkO9TlIExW4h3fuCB2ll6TRCO7EvmcnmX+YS+sPcWkm1zlJjK6uHeeAbcNKeS2RX28xFKhz56/Ogji4xErU0iUpPhYYoZwIexUAZ8qB2hQTRjNmJ7pgNUx4/f9q85gtH1+YQeJxiDJPGLow5+20qdNyK1DsmZWawkOyU+sWqc58urAqC0QsRAddKLLNGdSy0LNnlzds5D1CSZkaA9/6/TVPV0Bn6+i5ewzJV/5XOyxXlMqeCp+eOn1XoRhZOPAwbRSBAsZ/xYs/AUyCQXoGaN/uKykqJKDmUICr6FLhlIkblMqzDrqLirRopjAB8TD9ACwVLukN2wO8P8Fw3ooHG7XrAJ8Mv5Tl3V9/eiA+5NE9sa2RK/xorrGHhREY57YRKrpOaV7WBGc61kwnGkMsL8VeStBC+cxJP2pEw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003)(6133799003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NSsydWJFelZKcVdjYUZTY1RPbmlyaGlCcjBpa3FFeE82QWVFdnE2UmhULzJy?=
 =?utf-8?B?U3RCTVJDeUpkd3VwWmxBRTF6c1NQaFZtTU05WXVZSk9SQWZvYnZZSFdLNER6?=
 =?utf-8?B?OHc5MmVqR3lXdUpGR2Rmek92MERGcHk2cDU2MkpSR1MxaE4ydzdRaTk5Q1ZH?=
 =?utf-8?B?WjRIeEk5N09kMng4WlFiU0tUT2ZBc254VUtNSFdZejRJcmxUdU9VWDRsWktF?=
 =?utf-8?B?U1BqUGdOcWpaZG1JNzZqMUdwRVQzTkl6ajhKQ3dMSU1NVkp4R3I4Y2R3UWs3?=
 =?utf-8?B?OUl5cXA2aENEYlNLU2dsL0wyQ2k2MkREcHVhNWlNeHYvR3Q1MUlEU0FWeVAz?=
 =?utf-8?B?NTFlanZ5QldoWENOZFJuMUNuUWtKbExzTzBvNGptSXJ2UVFlejFkeW84eU8z?=
 =?utf-8?B?R2xrWFlTYW9XVlFEeDJjZXkyUktaM1EzdFJBdlZ0ckRnUTJEZHNhQnBicy9H?=
 =?utf-8?B?RTlqMG5PV2EzWTlHU3VBVTRjazlkdzFDblBqMnNEb3NvSnNMdHRENjNpRE5l?=
 =?utf-8?B?OS9hUWhRbG1Jbm4wOGs2dUJMRUphRlNLTnA5d3RhU01Dd2hkdThSeVlFalMw?=
 =?utf-8?B?UUFySGRLNmtITktVMEtkS1QvTFNpbFA0YjRBN2s2SXk2NVdGWUMvcUgzUnRU?=
 =?utf-8?B?VndnVFdyRzVGQS9ySHNhaW1UaS91QzZpOGNoUEJ5WC9TSWl3T2NaZ1pwL2JP?=
 =?utf-8?B?enBMbFVYT1ZodmY2YWtZU0RKY0NpVXlHOU5HM01MSXpmcDdzd0g1NldsMnJr?=
 =?utf-8?B?ODgyMkxiUVZ3ZXdoSUNnblpMSnpGQm4wSFcwMFdveDQzUFVlZFIvTmtPRVlJ?=
 =?utf-8?B?YkJERlgwMmRLbWdFQ3kxK0VJaUNqOFZvaElQWXRHYTJ0NWxKSkFwOHNWQlhl?=
 =?utf-8?B?cUJYN09VUDlaVE9qNFBxeVRMTTRZTW1IOTRVaWJpRnZwNzRmOGkzeVUrUWZM?=
 =?utf-8?B?d1RiU3dHT2VNenNkcWV2bHVKOG92SDU1Z2Q2TThTVjhwSkRSUjdIOHNXZWp5?=
 =?utf-8?B?NHpGb2NkTGMvWG5CZlpzYTdwdHA2TXU1bXpwSU5ValYzdDZjVVJ0T1RNWWpI?=
 =?utf-8?B?R2hYTG9wL0M4ZWFpT3IzdVVGdkw1TjhYQ1E3aDliVmNJamhpOXN2UExwS1pv?=
 =?utf-8?B?a2dPanpadk9NM3BaS0RONUNlcEVVTk1VdVg1TFBsZkx2TVg0VU8xZVEvNUpP?=
 =?utf-8?B?ZnBxSmRDaXpEOERhQnVMSTZQK0I0N0M0eHN1MHlWMUtEOEVTZ3JRMkpuTWZt?=
 =?utf-8?B?WmNwMFdkNWd4N2g5MWhnNzR2NWpoT3dEWE8wVDZGR3BjTFZ1cmlHRkdHdG1Z?=
 =?utf-8?B?V0VPSi9XZUFFSHZFdzlERjdwZGdqSU92alJROUZlcmd5L21oTWhQd0VjUG85?=
 =?utf-8?B?aUlJbG1TMHBpRnVHT3Z2YXRhbFVjR01Dci9nL1F4RXdKOFdqN3FxOGZhbFpD?=
 =?utf-8?B?Ni9uUHVSenhKQ0lRRWlhQUtGNEw3TXhYY0JoQU5wMXN0d3BjMXI1TzBRZDRB?=
 =?utf-8?B?dHZ3T2doSVdzQmdDTFNMZE9TWTFFSnU3ZFltVmhqWngyVTh1NXRZMUFBdnF1?=
 =?utf-8?B?RmhwUEw5ZFNsZS8wZlZkMEcwTThwVktSY3NVc2hKdWQ3R050OFZDR1dvellG?=
 =?utf-8?B?cmsxdnlhaGFyTmxtb0tsV0lHVHB4cFBYeDFtTk1vZ09abG9xTkNjRTZLaWgy?=
 =?utf-8?B?RURDVjN5QWR3NVdqNk1WbFRrT2liQUV3Um5KQit0bDVzZzJLNzN1Wlo4SCtF?=
 =?utf-8?B?bEI4ZXZKUnIyN1lFNTQ0OVQ2Nm9sb1RQaWVic3Qxc0o1bFdHekdhZUtabVV5?=
 =?utf-8?B?cGY0ZGdlWXlxeDNJTDVHdEYyQ3RGdmVZZW9ESStzU29KTVczb2ZyME56WkRJ?=
 =?utf-8?B?bG9ZamUxazlqOVlOMEQ0UHpSV2VVNFAxcWZibkgxQngwQkRYZlFpQnFsSURl?=
 =?utf-8?B?Ym1CbWVYTlF4Ykk0bEMzRG5SSnJnUEllTEdYc2Q0UkE2WlFJQ2Z6QzV1MWhv?=
 =?utf-8?B?dC9CRW1Zbi9sQXZIaVRWYlNDdjdIVUo0MlhuaTVSQWFPclF2RloxR1V5NHNI?=
 =?utf-8?B?MlIvN2JSaEhob2szL0FKRStGd3FXb0ZCL2MyRXpLZVpJa3owbGZXTUFGbUFs?=
 =?utf-8?B?eDBHdzhZeHNLc0dqRXZnZGVaWkJZc2RNTlRaUXVZS3hFeXBKMXJZd0pkbmhF?=
 =?utf-8?B?R0N1QVZPd0RsVVJQQWVSOG9oK3VrWitLaEFMYWZsVFVwbDRCMUFlcndKeE0x?=
 =?utf-8?B?cWVzclk2YmVOSjc1U1U4VVZpcWllMGUvYjFaWFo1Z21ZKzZKREZRVFM0Qng2?=
 =?utf-8?B?T0padlZiZHBDMk9RK2w2bkF4d0RSSWNCOVo5VDVUcmlSRWxGaHpEYjRLOUZW?=
 =?utf-8?Q?aJfseLS2CrITCjpA=3D?=
X-Exchange-RoutingPolicyChecked: l5dspl+RKcwrN/5Gh3GiZYbR4PqT5XpqNdMcEZEkT4qrAiIVkDGR0LEZl6PXpBpfVBHkCq0itGcgjNyn5Y7nE7Czyx/eH9Ozj21Ok4uomjkYDhSp5cbC/XaGCX0R/9bYoUTnUsepwkCSc9waUp47kbt4hKQf9wFwqW4SasoN3Xyl4OX4OUO1loKMz2lyvORHyGwObHjYvmp3FiJKgbYQ9Pt6SAk9X19UqtB865PBAoqI+tBSLq1nYfaHSGl0FB+pYqDEfmki52co9TkTGyD1FKFtlND0b6XZ5lM41z2+Tzw46Eai5oJtrMaTyXWpSzU0v1AkEeXxCy+lmq47//AcOw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bf9416f-b2b3-4ed0-d735-08debb1e3570
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 11:59:15.4365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jOCUzbfRJf6KV7CdsXp3USM7Iuo3jHBsRNabHQg7v9AklJBb/QMxG0wghamDxUZmccrdooy/tZT0shmbWPKmdlFIftqQKATVv161reoJmow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8013
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

Hi Jani,

On Tue May 26, 2026 at 1:51 PM CEST, Jani Nikula wrote:
> On Tue, 26 May 2026, Sebastian Brzezinka <sebastian.brzezinka@intel.com> =
wrote:
>> Add __drm_open_driver_path() as a path-based DRM open helper. It opens
>> the given path with O_RDWR, verifies the resulting fd is a DRM device by
>> issuing DRM_IOCTL_VERSION via __get_drm_device_name() before proceeding
>> (returning -1 and closing on failure), logs the opened device path, and
>> populates the xe_device cache when the device is Xe.
>>
>> The __ prefix signals that the function does not throw assertions or
>> igt_require() calls, consistent with the existing __drm_open_driver*
>> family.
>
> FWIW, I think the __ prefix should indicate "implementation detail,
> don't call directly" or something along those lines.
>
> I think it's problematic to encourage tests to call __ prefixed
> functions.
In general I agree with you, but in v3 Kamil comment on this:
```
>>Could you rename it into __drm_open_driver_path?
>>The idea is that all __functions should not throw asserts nor
>>require.
```

So I added an explanation in the comment.

--=20
Best regards,
Sebastian

