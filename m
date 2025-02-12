Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D06DC02198
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 10:07:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0688510E837;
	Wed, 12 Feb 2025 10:07:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hKb3qG/+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F1E10E837
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2025 10:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739354841; x=1770890841;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=fIdjwEq5pMcMgtPQLxcnIyYazzADokGQ2zuYQyzgqVU=;
 b=hKb3qG/+NAFIXbeHGvfT2+eYYSG3xuZutGltIIrNWp4N2RMX1u3iiLA5
 BS1HmxT+yHmt9XzwX6Yw0A+vVvFY9ZfGOEIPPpBZ5oL/Y10uSmWGhi04K
 r3Ixf7RKmLDjt0vIFE4b001bGszKx46glG5DxBH9WQr1TJ8PPa1GZOkYb
 R+XX2B7JAHeK9hj6lKJosoSzHPJjs4c0qXsE2W7L/MQw2nzmrUtGhmQ49
 bhRmHQ2KBbdkkAHmAlFt3bZPMCsqPTcrgMEAnoG5FOUY1XolRHnN7XIzX
 BmL/5HFB6wx/0zgoX7D6wyk7K4Wl1irBuMmY6yPqY4dMvpcFqegRtqgcl Q==;
X-CSE-ConnectionGUID: YoyLenVUSHKQhr0t8Gvejg==
X-CSE-MsgGUID: GePYgBipQ4yWuIpabC0Hpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39236430"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="39236430"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 02:07:20 -0800
X-CSE-ConnectionGUID: aYlhvAU0S8SKi0sVGCLi9Q==
X-CSE-MsgGUID: 0xkgprqzREKjERSf/ZSUWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="112610781"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2025 02:07:20 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 02:07:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 12 Feb 2025 02:07:19 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 02:07:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RGCumhWRmm7pKU7Hngk41cyV+8GIVfpMoGkRvGMcB1BpMJvOK4S8xqJ8hJ5hdQ2QxB23QI1cl8huNTmK8OVC3Ky00dyA3btIrcZaHjnEYNKvWOeiVMBQJeEvtJ4VeJZobX4lKJeltwnQ7ijOHyydthour+yPoajhXyC4R9bIMEUJE6NpsZLtVe937MJl28RUS/RpgA3A4jFdmE9WkZosk30XcGWCh/aOuYI721J4TpwAdJn6sARd48G/RTcNaJ6EelPUp0Dv+e0JzqHS8ADyCxOnoVPgGEh7RwDNniGYq8rsd/DoTuLIGae7eOAF2O91FOwe5epkW4eeirTz45thcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fIdjwEq5pMcMgtPQLxcnIyYazzADokGQ2zuYQyzgqVU=;
 b=LIof4C1fcluL1QNy9BjlWAUpkgLy5BVe9+yFYp65yrjL0hepIgW4sYmRC7/oWiI/h9HYgdU4E+4aX04oe681c/sf5IWQWw8tEytIlga1WnsAjBGQsfgTR3i4q/sSty9FaU6uzSZpa5Vj5sh4LXUAukQLphMCnhpg6Sa9sjO/UYmZhY4OGsV1zB+/MJ5ZYoMCkBnpGUZ9Mpbb9vWu4I7yCRHVT7YRmeEnoNA68UCEHIKWfo18qM6+bZJaOY08fNtV80g7l8lFh4Kos3OsoTAZPtyje0FK0NtPpjCR1KfsLxWZZu7PQwkMfS/gi9N6jKOukh/j4w+U/2utTs8DtfwZwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5861.namprd11.prod.outlook.com (2603:10b6:510:133::8)
 by IA0PR11MB8420.namprd11.prod.outlook.com (2603:10b6:208:482::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Wed, 12 Feb
 2025 10:06:48 +0000
Received: from PH7PR11MB5861.namprd11.prod.outlook.com
 ([fe80::b320:4d74:ffda:ecbf]) by PH7PR11MB5861.namprd11.prod.outlook.com
 ([fe80::b320:4d74:ffda:ecbf%6]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 10:06:48 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "Musial, Ewelina" <ewelina.musial@intel.com>, "Piecielska, Katarzyna"
 <katarzyna.piecielska@intel.com>, "Heikkila, Juha-pekka"
 <juha-pekka.heikkila@intel.com>, "Grabski, Mateusz"
 <mateusz.grabski@intel.com>, "adrinael@adrinael.net" <adrinael@adrinael.net>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Brodzik,
 Konrad B" <konrad.b.brodzik@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, "peter.senna@linux.intel.com"
 <peter.senna@linux.intel.com>
Subject: Re: [PATCH i-g-t] Bump aborting on network failure deadline to 40
 seconds
Thread-Topic: [PATCH i-g-t] Bump aborting on network failure deadline to 40
 seconds
Thread-Index: AQHbeKsMTfTlXcEkHUyPpoEH5+j2nrNB2zoAgAAJo4CAACKOAIABcuWA
Date: Wed, 12 Feb 2025 10:06:47 +0000
Message-ID: <c246f66564337e7778abc23b23fa1ad7400138c1.camel@intel.com>
References: <20250206152147.209277-1-peter.senna@linux.intel.com>
 <20250211092108.enj3kzrlh3rzh6rk@kamilkon-desk.igk.intel.com>
 <d137decd-4adf-474b-a56b-1398ef5472d1@linux.intel.com>
 <IA1PR11MB6097AD4DB631A02EF73EAE1886FD2@IA1PR11MB6097.namprd11.prod.outlook.com>
In-Reply-To: <IA1PR11MB6097AD4DB631A02EF73EAE1886FD2@IA1PR11MB6097.namprd11.prod.outlook.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5861:EE_|IA0PR11MB8420:EE_
x-ms-office365-filtering-correlation-id: a814541e-d370-47df-2a27-08dd4b4cf671
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?b0RzVWVYVTVMODc3c1JXMVJZZlBhZXd0b3pDaEdBSEx0STNoZmZaQVdTVDBn?=
 =?utf-8?B?N2dkYVRuNkc2NEptVG55dzNxT25YbGVBY0cwZ05MSGtDd2Zna3JDK252emo5?=
 =?utf-8?B?dG9zSkMzT3JKU2h2WWJlYUx3NEJ2cUdaOThNd2dubU5pd1gyTVVSbytLT0RV?=
 =?utf-8?B?VFl4WXRUdzQyUmc0dGIrL3lNTkVubTlWVDBUVUlCQjR2Qi9KcHpqRWRCVlNw?=
 =?utf-8?B?Z1FQUnBkT1R4V1B3ZFpEZnNXV1ZEZ2U1MGVDeFkrMDdmQk9qN09BUzFxanps?=
 =?utf-8?B?RmFrajJSRThqRjRnc1ZWM1ljWjlxTmVpbkExbUZQUmxLTEZnc1ZFdUN3Sm01?=
 =?utf-8?B?NUc2am5zemQ1MGZlVXQ0em1FRlEzZ0YrdlJtejdPUXdieXV3L1FiVHc3dUxr?=
 =?utf-8?B?ZFI4UlFhNGw2dms4R01xMlBxWUdWU242TzdoRjU4OTF0V08weG43Njg3SlRE?=
 =?utf-8?B?c01keDNQbGs1dmU3dW1zRDdoRjBjQXlqenJiSzBBWkI2NGhNSEdWTHpuMG5v?=
 =?utf-8?B?SkFKMXRYVlM5OTl5SVQ5cFNuNjRFMUdhVC9VN1RZMXc0cnFjUXlwMVlhMWJP?=
 =?utf-8?B?NnJSekxyRkx0aFVXT2lOaFduL1FudGFxMjUyYjNJL2VxdzdHcWYrZEZ5M3d6?=
 =?utf-8?B?SkhmWlhoMDl1amRwYW9LeElMZzhIV2tBbE1oRjRKVkpMQ0NvdjhFdGwzUVBr?=
 =?utf-8?B?NStoSzQyYXRURnE0dHI4cHlWSDRZa1QzbzF2K0ZCOGRDYTVhbGxYd0Z3eHlG?=
 =?utf-8?B?Z0c2dVJqeTlOTHRGUzRpWTZWbHkwVGpXNXg3WklYTVMwUkFhcGFoVWRJNU1i?=
 =?utf-8?B?TmZoWXVrcWZQMjBiRGNOd2lEQ0dIWDFIR3VEa0E2YWhaYVNPWEtKY1VaUjNQ?=
 =?utf-8?B?TVdwNUM3RTc2cXFmUnNFdGxYa2JCVERGWndiRDFVQ005TUVTL2NlSmFid1E3?=
 =?utf-8?B?eXRGQkVYV1lGNkF6di9qalVCY0pLRmpkank4c2Mvd0VKbjdDaTVvRUYwT1A0?=
 =?utf-8?B?bDhVUWpPYWVQOGpUcXFRc0dUQ3VPd2phYmo1aTFBRFRFRXgzUnhlWGxXKzhj?=
 =?utf-8?B?VXBZMDE0eU5xYXJEUGtZYk83Q2MwT0JJOTdFNmpFd04zcU9VUGdUSnVNTmt0?=
 =?utf-8?B?VExBMnVjTHIyVDhsSUtERTAwMisrdzJCZFU5RHNwRVp4YzNLTkhUTDJCLzBH?=
 =?utf-8?B?MFhJNzd5bnV4TUhHMFJPNEQ5S0RvVTBRQUExYVVuYzAwMXFtWmV3UnlxL2RB?=
 =?utf-8?B?Z0dGMGpMOWxwNmtRUzJ5YjlWSzZaNmlmNXJaWVI1UGVKVkdZejA3b3RCa0JJ?=
 =?utf-8?B?YVJGNy9OQXJ5cnFVUFJET2hUa0ZncWxSaVpzQ010Z3pnNUNmV1l5VlZUdUFF?=
 =?utf-8?B?V2o4bzNCR2ZqR3dtdm9sU0loZG9DekROU1Q5MnpuaGs1cnc4RlB6ejNXakZ1?=
 =?utf-8?B?bnFaVUxKWC9paldEWTMzS3FBdWswZDBsRXltZTlqeUVxSHYreUJQY3dBcThi?=
 =?utf-8?B?dVBZcWo5Tng2MkttM05MUzQ4SXFoYWZuTGxNQ2NlM3lLSzN5amh3eHFZdERN?=
 =?utf-8?B?bExVSUE0VDFXTjlveDVaMFJpUjJzUVpFUVpBUHBGbC9mendFaDl1UGd5ajRN?=
 =?utf-8?B?WkphbmpKUGlSbkdJZ0ovbmZORTRuRWduRERRd1R0UWdaRHkzRzlLMi8yZU8r?=
 =?utf-8?B?em9FaC9YaU85QjNUUkxRSWx0UFFxWEtCKzFTWm9tR3lLdjlLNzVGb09CTmJJ?=
 =?utf-8?B?ZE0xTjJDdmVYckYyRElpUWNwT1c2djUzc0ZLaDU0WFpvTVV2cFhGdTYzQVUy?=
 =?utf-8?B?M0xTMDY3a0JSMElMZXdsUHNuQ2YzV3VXRnpRcEs0MDZ5ZlZXd2FzM05NUUc3?=
 =?utf-8?B?eGVRQkJOd1g0ODF4RTNMUHh6NWlLR2hFdVl3cHY5ekJYd200OGc2U3dJR1VZ?=
 =?utf-8?B?K2t6ZHByL1ZiUUthRzdVcktQSWNHeWorMmxSdmkrcWI4SHQvdmovUFFmWExK?=
 =?utf-8?B?RlNBUitGUmdnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5861.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(921020)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2Z0c0o5NWZ6WklHZHVLVXovTHNKZ0k3ZmVZZU1iWWVFdkJQN2ZNa1NIbUFB?=
 =?utf-8?B?VTM4bFdKcWVKSVBOQzdVTTdUT09LMzhtVEQ5aFgybWx1a0Nnc3RGclVVZ1Bh?=
 =?utf-8?B?TnJ4ZG5VYWNtd0tpSmFqaHh2NjRRQVZ1MU4rZ3hxcVBzNU1xYnI0ZG13OW81?=
 =?utf-8?B?ZjVHMkczR2REWm9tYnR2d2p0cTZnU3drNWt5QWR2eDN6WTlRa3lydklKVTBP?=
 =?utf-8?B?MjRiOTdCZk81OVZEVytZMlhtL0Z4WU42cWdJbHYvS0xHc1Z4QzcreXhOaDZu?=
 =?utf-8?B?WUxOcnUycmhOVkZScExtTXp3QmZ0OU50dXRTWFBRUC9OZ3pjOWkrNlhRR01O?=
 =?utf-8?B?VU9DLzBteUhBM0VPajV0Q2ZBSU9LV2lhV2ZuQWlpd3hxVXR2Ykxya1E3OUFh?=
 =?utf-8?B?bkxPRWQwcVc1bElJclhqRTRSU1ZLSUJiVG1KSHQ5THFSVFhLOHY0cDROTjZ2?=
 =?utf-8?B?TXIxaXFhZ0lLU1YvMDhsZ1N5aXY0alA4V2IyaldNMDlJMHFmMzlkcmpzd2p1?=
 =?utf-8?B?cXluSW1qVjhHNnkxc2twWXZtS1YyVzZzWmJRRUFtQ1RKWnN0OUpNaWowYlhr?=
 =?utf-8?B?cm1IYjJBZ0xhZlFNb2dZTXVrbW5oS0dVdmxlODArR3BmQVJLbXFiay9BN2Vv?=
 =?utf-8?B?d2xaVk0xV20wYld3V0RNa3NEQzBQWG1xOXhjb1g0am9Tb3B0VmFLV1BlVjYz?=
 =?utf-8?B?YnNYNzljL0VNdEZRT010MitOZVVCcXFIbGdEN1BkSjNPREFGY2V0VVQ3QUht?=
 =?utf-8?B?V1NlY21QZmRvVWg2MkRPWU45b1FzNlBtSDdaVXVPNlBBK0VGSFdlSXllSTJL?=
 =?utf-8?B?MEI0dXRIWWpQWFMrTnFHUTYwUWIzK3pxV0pkT3BGaWNuVXh3aUZJTWFHU2p3?=
 =?utf-8?B?eTVYbU5ubHZHMEFRUm9XNk5NOXNZQytiNGF3WmhRUWJHZkY0WFUxNXBzMUtJ?=
 =?utf-8?B?ZGlPYnFwUTVMSC9rWUo0NFUvS0kzNkNKdlQrcjM5c25FQzkwZkRhWWZjVlJW?=
 =?utf-8?B?aGN6RkpIaU9SdVRaazh2R2NsbXVaaHN0T1g5OWxFU1ZKWisyUVQrYzh6UjZx?=
 =?utf-8?B?YTUwb1NyaWFpYmNBQmdURlFEV0pNaDRrSE12cVVFUEE2MzIwaGRKSlFYVzdJ?=
 =?utf-8?B?QlZJcXlvbkJxK01hVGF3aVpENlQ3R3JvZ1FpUEpZRjlRbk5NbTZlaXdvOUQx?=
 =?utf-8?B?N3Rsd0FFcllhWVByOWpPOUxoNzBOZzlFbTRmS2JVVm1TSzNvRDNKVE9YV0V3?=
 =?utf-8?B?TkRDREJlTkNiUUs2cVlhdkJXbVRKZXpDOWoybHdhcFBzWENrVG4zbjBmSU0v?=
 =?utf-8?B?VWIzc1dEOGFXajE0aGY4QlVIQ1ZtSVdhOTgrUlF4UkxPRjVPZVlnbDdIT05t?=
 =?utf-8?B?QkZhYXlMUEd6UnAxcU1yYkVhdmVLclltekIrZXBCdjRRYm5jMDNiK1NyWWFI?=
 =?utf-8?B?eXlMM3UwMGkxS05NbW1QMnZuUmZ3N3lWa01kYnU0WHdGYjZSV014YlR2N2Va?=
 =?utf-8?B?RHkyUDViOU81bFB0NXh4L2t5QmUyNmF0aExqR3owSmZYTitsUTY5MUtCMmNP?=
 =?utf-8?B?NHNEa3FvL1ZEb0dpc3RtMVRMY0piem4wbHNLVGttbSs2OWZkMWRPaktubEo2?=
 =?utf-8?B?LzZZNlFFTFArdmRvejdKN2NWZm82dFROdXR2R0p5VVpLRlNGbjlFMTAvRXZV?=
 =?utf-8?B?eTJLcnVGNjlQY2U5amF5N0xmWnh4a3ErQnYzVUZQN1k4NnJ4WkdMSDhxUEJo?=
 =?utf-8?B?TXkyMGpjMWF4bkJSVGpuQnl1Vkh1WVVBd3FTemlrU29RTU5uME04VU5QU0Ns?=
 =?utf-8?B?V1B6NDlnSXlGVWtBelIzMEM0Q2R4amxBdFJrcUd0cS84SlpITDVtNFUrK2h4?=
 =?utf-8?B?WGZxOTZWZzBQVzNlL0xHUURnSUFGZllrZzV0RWVSVk8zU1ovN0hVRTM0UmEw?=
 =?utf-8?B?N0VNa3oyWmlySTRvU1psZWIrRkNSbUtzdEN1ZS90ZTk4alpBcFZUdnZaNmcx?=
 =?utf-8?B?ZE1oRjYvM1I0dU40ZUkwcGZWL0JkVUJ6UjA1R2M0Y3NPR3c1b016VjF4VkNG?=
 =?utf-8?B?ZUhmbFkrNUo4ZHpQOFBSbmh6WFRUQVg2TW1CRmlvMTFZMUdCcDNhcXhSUDJE?=
 =?utf-8?B?Tit4WENINWpLbytvU0ZwSGprVEZkQWRaODhHTzA3SVVTdUVaZlNKM2s2M1ZC?=
 =?utf-8?B?SVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8781427E528A3E47B0A0BD6D51B86DB6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5861.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a814541e-d370-47df-2a27-08dd4b4cf671
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 10:06:48.0241 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lOEh7hD07JN4PmmC7+6wXPSkBamKzAi4pyCGeKMzWOY7GORKcQxE4LtPz+uMVJUpSXSg4Q4xIEEq2oM2HDGRlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8420
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

T24gVHVlLCAyMDI1LTAyLTExIGF0IDExOjU5ICswMDAwLCBQaWVjaWVsc2thLCBLYXRhcnp5bmEg
d3JvdGU6DQo+IEhlbGxvIFBldGVyDQo+IA0KPiANCj4gDQo+IEhpIEthbWlsLA0KPiANCj4gVGhh
bmsgeW91IGZvciB5b3VyIHJldmlldy4gUGxlYXNlIHNlZSBiZWxvdy4NCj4gDQo+IE9uIDExLjAy
LjIwMjUgMTA6MjEsIEthbWlsIEtvbmllY3pueSB3cm90ZToNCj4gPiBIaSBQZXRlciwNCj4gPiBP
biAyMDI1LTAyLTA2IGF0IDE2OjIxOjQ3ICswMTAwLCBQZXRlciBTZW5uYSBUc2NodWRpbiB3cm90
ZToNCj4gPiA+IENvbW1pdCBkZGZkZTI1ZjE2YmEgKCJydW5uZXI6IEFkZCBzdXBwb3J0IGZvciBh
Ym9ydGluZyBvbiBuZXR3b3JrDQo+ID4gPiBmYWlsdXJlIikgaW50cm9kdWNlZCBhIDIwIHNlY29u
ZCBkZWFkbGluZSBmb3IgdGhlIERVVOKAmXMgbmV0d29yayB0byANCj4gPiA+IHJlY292ZXIgYWZ0
ZXIgYSBzdXNwZW5kL3Jlc3VtZSBjeWNsZS4gSWYgdGhlIG5ldHdvcmsgaXNu4oCZdCBiYWNrIHVw
IA0KPiA+ID4gd2l0aGluIHRoYXQgdGltZSwgaWd0X3J1bm5lciBhYm9ydHMgdGhlIHRlc3QgcnVu
IHRvIHNhdmUgbG9ncyBhbmQgDQo+ID4gPiBwcmV2ZW50IHBvdGVudGlhbCBsb2cgbG9zcyBmcm9t
IGFuIGltbWluZW50IHBvd2VyIGN5Y2xlLg0KPiA+ID4gDQo+ID4gPiBUaGlzIGRlYWRsaW5lIHdh
cyBzZXQgdG8gYWNjb21tb2RhdGUgb3VyIGludGVybmFsIENJIHN5c3RlbSwgd2hpY2ggDQo+ID4g
PiBjaGVja3MgZm9yIERVVCBuZXR3b3JrIGNvbm5lY3Rpdml0eSBldmVyeSA1IHNlY29uZHMgYW5k
IHJldHJpZXMgdXAgdG8gDQo+ID4gPiAzIHRpbWVzIGF0IDIwIHNlY29uZCBpbnRlcnZhbHMuIElm
IGl0IGZhaWxzIDMgY29uc2VjdXRpdmUgY2hlY2tzLA0KPiA+IA0KPiA+IFRoaXMgaXMgYSBsaXR0
bGUgY29uZnVzaW5nLCB5b3Ugd3JvdGUgaW4gZmlyc3QgcGFyYWdyYXBoIGFib3V0DQo+ID4gMjAg
c2Vjb25kIGRlYWRsaW5lIGFuZCBoZXJlIGl0IGxvb2tzIGxpa2UgNjAgc2Vjb25kcyAoMyoyMCku
DQo+IA0KPiBUaGUgZmlyc3QgcGFyYWdyYXBoIGlzIGV4cGxpY2l0bHkgYWJvdXQgdGhlIGRlYWRs
aW5lIGludHJvZHVjZWQgYnkgYSBwcmV2aW91cyBjb21taXQuIFRoZSBzZWNvbmQgcGFyYWdyYXBo
IGlzIGV4cGxpY2l0bHkgYWJvdXQgdGhlIGludGVybmFsIENJIG1lY2hhbmlzbSB0aGF0IGluc3Bp
cmVkIHRoZSBkZWFkbGluZS4gQ2FuIHlvdSBleHBsYWluIHdoYXQgaXMgY29uZnVzaW5nPw0KPiAN
Cj4gPiANCj4gPiA+IGl0IHRyaWdnZXJzIGEgcG93ZXIgY3ljbGUgb24gdGhlIERVVC4NCj4gPiA+
IA0KPiA+ID4gQWx0aG91Z2ggb3VyIGludGVybmFsIENJIHN5c3RlbSBjYW4gYmUgY29uZmlndXJl
ZCB3aXRoIGEgbG9uZ2VyDQo+ID4gLS0tLS0tLS0tLS0tLS0gXl5eXl5eXl4NCj4gPiBSZW1vdmUg
dGhpcy4NCj4gDQo+IE5vLCB3aHk/DQo+IA0KPiANCj4gS2FzaWEgLT4gVGhpcyBpcyB1cHN0cmVh
bSByZXZpZXcsIG5vIG5lZWQgdG8gYWRkIHdvcmQgJ2ludGVybmFsJy4NCj4gDQo+ID4gDQo+ID4g
PiB3YWl0IHRpbWUsIGV4dGVuZGluZyBpdCBmdXJ0aGVyIHdvdWxkIHVubmVjZXNzYXJpbHkgcHJv
bG9uZyB0ZXN0cyBpbiANCj4gPiA+IGNhc2VzIG9mIERVVCBoYW5ncy4NCj4gPiA+IA0KPiA+ID4g
QnVtcGluZyB0aGUgZGVhZGxpbmUgdG8gNDAgc2Vjb25kcyBrZWVwcyB0aGUgYWJvcnQgbWVjaGFu
aXNtIHNhZmVseQ0KPiA+IA0KPiA+IGltaG8gdGhpcyBzaG91bGQgYmUgb3B0aW9uIGZvciBpZ3Qt
cnVubmVyLCBJIHdvdWxkIHByZWZlciB0byBub3QgDQo+ID4gYWRqdXN0IGl0IGxhdGVyLCBsZXQg
Q0kgdGVhbSB0dW5lIGl0LiBPcHRpb24gY291bGQgYmUgZWl0aGVyIHRpbWUgb3IgDQo+ID4gcmV0
cnkgY291bnRlciBvciBib3RoLg0KPiANCj4gSSBkaXNhZ3JlZS4gV2UgY2FuIGFkZCB2YWx1ZSBu
b3cgYnkgcG90ZW50aWFsbHkgcHJldmVudGluZyBwcmVtYXR1cmUgYWJvcnRzIHdpdGggdmVyeSBs
aXR0bGUgcmlzayBvZiBjcmVhdGluZyBhbnkgaXNzdWUuIFRoZSBwZW9wbGUgaW4gQ0Mgc2VlbXMg
dG8gYWdyZWUgd2l0aCB0aGF0Lg0KPiANCj4gVGhpcyBwYXRjaCBpcyBhcyBzaW1wbGUgYXMgaXQg
Y2FuIGdldC4gSSBkb24ndCBidXkgdGhlIGJlbmVmaXQgb2YgdGhlIGV4dHJhIGNvbXBsZXhpdHkg
b2YgYWRkaW5nIHlldCBhbm90aGVyIGNvbW1hbmQgbGluZSBvcHRpb24uIEl0IGlzIHdheSBtb3Jl
IGVmZmVjdGl2ZSB0byBzZW5kIG9uZSBvZiB0aGVzZSBldmVyeSA2IHllYXJzIG9yIHNvLg0KPiAN
Cj4gQW0gSSBjb3JyZWN0IHRoYXQgdGhpcyBpcyBhIG5hY2sgZnJvbSB5b3U/DQo+IA0KPiBUaGlz
IGxvb2tzIGxpa2Ugd2UgbmVlZCBhIGdvb2QgZGlzY3Vzc2lvbiB3aXRoIENJIHRlYW0uIEBLbm9w
LCBSeXN6YXJkIEBHcmFic2tpLCBNYXRldXN6IGNhbiB5b3UgY29tbWVudCBvbiB0aGlzIGFwcHJv
YWNoPw0KDQotIElmIHRoZSBjdXJyZW50IHZhbHVlIGlzIGdvb2QgYW5kIHRoZSBwaW5nIHRpbWVv
dXQgY2F1c2VzIG1hY2hpbmVzIHRvDQp0YWtlIDIwIHNlY29uZHMgbG9uZ2VyIG9uIGVhY2ggYnJv
a2VuIHJ1biwgaXQncyBqdXN0IDIwIHNlY29uZHMuDQpDb21wYXJlZCB0byBldmVyeXRoaW5nIGVs
c2Ugd2UgZG8gc3Vib3B0aW1hbGx5LCBpdCBjb3N0cyBtYXliZSBhIGZldw0KbWludXRlcyBvbiBh
IGJhZCBkYXksIHNvIGl0J3Mgbm90IGEgcHJvYmxlbSBpZiBpdCdzIG92ZXJzaG90Lg0KLSBJZiB0
aGUgY3VycmVudCB2YWx1ZSBpcyB0b28gbG93LCBydW5zIHRha2UgbG9uZ2VyLCBidXQgb24gdGhl
IG90aGVyDQpoYW5kIHdlIGdldCBsZXNzIGJyb2tlbiBydW5zIGFuZCBsZXNzIG5vaXNlIC0gSSB3
b3VsZCBwcmVmZXIgdGhpcw0KaW5zdGVhZCBvZiBzcHVyaW91cyBhYm9ydHMuDQoNCklNTyBpdCdz
IGZpbmUgdG8gYnVtcCB0aGlzIHRvIDQwcy4NCg0KVGhhbmtzLCBSeXN6YXJkDQoNCj4gVGhhbmtz
LA0KPiBLYXNpYQ0KPiANCj4gPiANCj4gPiA+IHdpdGhpbiBvdXIgaW50ZXJuYWwgQ0kgc3lzdGVt
IHJldHJ5IHdpbmRvdyB3aGlsZSBpbXByb3ZpbmcgY2hhbmNlcyBvZiANCj4gPiA+IHByZXZlbnRp
bmcgYSBwcmVtYXR1cmUgYWJvcnQuIEZvciB1cHN0cmVhbSB0ZXN0aW5nIG9uIEplbmtpbnMsIHRo
ZSANCj4gPiA+IGRlYWRsaW5lcyB2YXJ5IGZyb20gMTYgYW5kIDI1IG1pbnV0ZXMsIGFuZCB0aGlz
IGNoYW5nZSBoYXMgbm8gaW1wYWN0Lg0KPiA+ID4gDQo+ID4gPiBDQzoganVoYS1wZWtrYS5oZWlr
a2lsYUBpbnRlbC5jb20NCj4gPiA+IENDOiBrYXRhcnp5bmEucGllY2llbHNrYUBpbnRlbC5jb20N
Cj4gPiA+IENDOiByeXN6YXJkLmtub3BAaW50ZWwuY29tDQo+ID4gPiBDQzogZXdlbGluYS5tdXNp
YWxAaW50ZWwuY29tDQo+ID4gPiBDQzogYWRyaW5hZWxAYWRyaW5hZWwubmV0DQo+ID4gPiBDQzog
bWF0ZXVzei5ncmFic2tpQGludGVsLmNvbQ0KPiA+ID4gQ0M6IGtvbnJhZC5iLmJyb2R6aWtAaW50
ZWwuY29tDQo+ID4gDQo+ID4gaW1obyBiZXR0ZXIgaGVyZSAnQ2M6Jw0KPiANCj4gVGhhbmsgeW91
IQ0KDQo=
