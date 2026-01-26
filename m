Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D52ACF65FF
	for <igt-dev@archiver.kernel.org>; Mon, 26 Jan 2026 12:54:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 211D710E417;
	Mon, 26 Jan 2026 12:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ebfEC0m3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F369510E416
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jan 2026 12:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769432064; x=1800968064;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=99Yf+ELc1CiQoYX/hTwMICcZkAcHfQg/hIfRc1fvlUA=;
 b=ebfEC0m3GkDpJ9PtShUN5bff2CwDw/X8/ohqiBd35WM93BJqxDg5m7Hq
 +o4BdtN2GZ5Z4HWuHUk5ICNChCe4W4ef3kKvgl4q5SPxH2tfRABHpzl4U
 +K/aNvrr/lIeHpSssgcN9v4bMi1YthaEL3MAM0DJrV5+I5v6Wqcy1Z52C
 Ny37MGsyX+e208nqDYJOrsji4eb2rI/Bu7QSlUqJRDvLUZ9GvxA4t3xwL
 gEG5cWudIMq4EGVuh18sPRqgWEb14mYd2HtmzML3K4OY6md/uUELQCE9+
 u9BC2CisV26FSKcoQbbyctIAX2J7wmaMC8+Ya1Dxspp3IoEoO/wxiKTO5 A==;
X-CSE-ConnectionGUID: dDJge4AaRX2IE5a5T79Waw==
X-CSE-MsgGUID: oyrGJ9zfR3CGNzDZ7HdkmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="88019614"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; d="scan'208";a="88019614"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 04:54:24 -0800
X-CSE-ConnectionGUID: sGeMroM+SLC67GzHeY1puw==
X-CSE-MsgGUID: 0ton66heSfWZqOiKrl3fzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; d="scan'208";a="211764366"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 04:54:23 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 04:54:22 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 26 Jan 2026 04:54:22 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 04:54:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dv/IbmJ8GdiBHAoRGpo5mHW/zKvGqKctbp6nj+YGK9I9bYU6TNyGAHV3HzcDtp0GfrdT8aMAF+h2J/WGhtQLkAc5XwJCsJebIWVjrvPTXhPj5FnN8X2QuIQokbITJaWCGc3hPNLS9hRzAaJRmV5bhreXQCNgy3mzplxDTpnrXD8KUV0WypCX0Kea6vvWX+Xp7QfOAlx3eczqLpW1eV+I1yUGkER2X6BVuyQwXcdtTof6U7VgGvGJNQwu3zw7A/0ElYf0ljryiZN+2IVuC/VuTzWkv9MZxMHK0j69gKdM/6I4D/BUdx/rHjxwkfrEFFZfAFa53w1niYS8qDqTRaPTBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CvmT9vMzNsQfRbaHvB5nvkNGI8Z3RVUQTxuIuekhPw=;
 b=QtMP/78XKb2xzZwTycg+KcaG+qK0mPo5QM31EsPYfCVl3C0PQbWBHHorLRaPQzq5x27Ix6U6T9ZHpBZHG1BoXdb1EG4tp0BRH7xDT4huvCe44HwKFG+DC2o8k9l1Z9Xs6RDE0OIcyt8r7sY7yoeCe90ea02XvMGTNq26nb2tFgmwWXn8UlnvhP0hW5K3tgPMRIl6sULYnDI+JGvNvZnHAuglxav7q7Uq1xFJVUG9RwZFpr9kJDXa5R6qcmu16lAFaWTlYBYZsWhNBRVSpA6udllF8MVR50JvJOQP1v4RrndQjX1cXOShWIS45JqwMPRUrpdtgAK08V0eLq7vrUtCdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by SJ0PR11MB6766.namprd11.prod.outlook.com (2603:10b6:a03:47c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Mon, 26 Jan
 2026 12:54:19 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0%7]) with mapi id 15.20.9542.015; Mon, 26 Jan 2026
 12:54:19 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>
Subject: [RFC PATCH] tools/meson: make per-tool dependencies instead of using
 global deps
Date: Mon, 26 Jan 2026 13:54:05 +0100
Message-ID: <25bd3840d618c26cd7d4a04501aae2794b283e3b.1769431463.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.51.2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::26) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|SJ0PR11MB6766:EE_
X-MS-Office365-Filtering-Correlation-Id: b95d6af8-6800-4050-01dd-08de5cda054a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2xHWVZ1R0FyN3Y1YmdnL0xQaE5lalNwMXAwV1l0WTFHTlo5YjF3eHhoYzJI?=
 =?utf-8?B?YmdQTVhrTEJxUWZtajVMUnBhdGNkc1hxMlJrWTVXSkVzVnAzdXNKWGFpbXho?=
 =?utf-8?B?UXhJM040WU54aC9nWXd0WXJlSXBLNWwrK3BKTDU2L0JBRm90MU80b0JFbTU0?=
 =?utf-8?B?Z0JpeGpYaXZGdXV0UTBycnRjWWJvOHR4MXdyTndaenFZUE1VdDRqQVoyZ0Nq?=
 =?utf-8?B?a1EyNXpkbGZsbko1N2NTOURCcklCTndub3JweFc3Uzh1SnR0WEMvRDQ2cCtW?=
 =?utf-8?B?WUZrQ21rcXp4VHJRZ2dJT2RpUWlDeXdZTzQzdTE3Z1FuUEtQOUVGaTZHSTkr?=
 =?utf-8?B?VmZNbmoxNVMyVzhJSUIydjZUNlJYamhkbEd6ckh4ZXo2TXBwTHVOVVpyRzRq?=
 =?utf-8?B?WmdpQmhtNTlaQ1k4NnFzMEpKN3BzSk0zc2VNTkhUa0plREY5RS9TYkwwT1Q4?=
 =?utf-8?B?WWpNMkgyV3VESTVmOStJVk1YdDBmTHN3NE9rTUdnVEluRU0zVGdtaGZiK2Fi?=
 =?utf-8?B?OHpNb2xENm5kVmJpNDBPS2VyZzNuMVdCM1BHWU11OU1SdC9yUmFJbGdCZUpT?=
 =?utf-8?B?V0s1dUdMTjk5eWJRSGRlYlZWZFc5ZGZGZHFVTnhrK05TYVFNajFJMnRaM1B2?=
 =?utf-8?B?ZElZWEpReVN2U2FWUEhIQ214WXk5VjhvUzYreEUvam9kaTZENVZNdVdoSTNx?=
 =?utf-8?B?V3gweXM1UHlmcGg5YkRHQ1FrQlNvOXNUa2FBelBYS3MvWUhobER4cjdLRXNr?=
 =?utf-8?B?UW5KOFhJUlpnVHN5MUhUT2w2UVVob1U4dHg4dk1SWUo4dDFUcjlTeThFQ0tP?=
 =?utf-8?B?aDAyNWRISVREeHBmTTBBVmZEOWlIcXNRb29DVys3d2VrZTIyandaWWh2V3Iy?=
 =?utf-8?B?eFBoMXp0aDhHemRnYlR4M2VaNkd5MW91MHlGQmZ6dTNnV2dZdzhiVm1GYUZS?=
 =?utf-8?B?S1VZcCtvNHg4OXplbk9VQVlQdTM0ekx4N1h2NW1yZjZUUjZYMll6QUdqUXE3?=
 =?utf-8?B?LzY2aEI1N3I1M1RSSDFQMzg4U0V4STd4RUNDWURxNzhlcXY0R0RSaUNEVEo2?=
 =?utf-8?B?U3FER3REdVMrSkVnYzc5Sm9BQkozZWNrY1RIZWswUXFqdWoyNGF5ZWpLcmU3?=
 =?utf-8?B?VkUrck1pak42QmZQYkZNa3VRTWNLdDczVldOS3pTc253a3d0dlAzM09KWmRv?=
 =?utf-8?B?d3BRUTlsNk0rd2F1eDRjWE14Snpxa3VJalRZdVo5M3hXblVzdFdzdnZUT0Nh?=
 =?utf-8?B?bEVLVUk1eVQycmdhajljUTZoVE50d1Y0WThpRWlVbmpnak8zSm9aZlpRVXlL?=
 =?utf-8?B?WGcybTNIeEZabmxpNFFkZlhVSzBFbU9xQzJpaVlqSmUvUnJVNm5weERZT0Fi?=
 =?utf-8?B?bWZiUUQzVGlnK0JuSk5HWU1VNEFlcm1IS2ptM3dBREgxN25NczRnQ1liK01G?=
 =?utf-8?B?REdySitzUW9hTDdwNnhURE1QbGlXaE5qdjZZQ3NUSHYxMnBJS0lQZnQ1ZTlI?=
 =?utf-8?B?NXQ4N0VjRkREb2cxS292MVFnMWFiN3BUVlNnTzV6bmdrRFlTM1FzZHZWODQ1?=
 =?utf-8?B?eVYzbFVCSTA0Z2F6SUYyMFZ5Q3k1RnRyb0RoNHUxdnl0NExMbDhqQ0VJQ3lJ?=
 =?utf-8?B?WjczVTdxV3JYZmFyZEVLdjZ4dWtadDk4RjFwY1dmTFlwM3NSN1VtNGRpU0p4?=
 =?utf-8?B?Nm9Ea1hKbkZsbmxEZkQyKzVOTWh6VEpCdUdpem4rdGd5YWZ3RVE2bzVlNy83?=
 =?utf-8?B?RWR6RFNLQ2JYL3ZnakFNOTNTdGYrcXowdjFRTmU3SnJ1TlNlSjlDMzZHdk5N?=
 =?utf-8?B?SitsVmZmbzZENUtuNUZsVWEzRjRQRUVlQ0RMWGhhazlRa1NzRlN5OStBSWhC?=
 =?utf-8?B?ZEFwdTNVYm92dzcxV3ZvbE5RQUxmZzdGK1l0Q2kvWGFlUVRSUG9oRVF1bHJ5?=
 =?utf-8?B?K0kweHdDUHFBSHFJSEhyckZGZ09aM3VwS29TSGNBUlo0aXIza2QrTGtZUnkv?=
 =?utf-8?B?QURSZ1FBNGpOOHoxYlozcXhDN25vNzUrVHY0SzdYdXYxL2RTRlJhbFU2dWFK?=
 =?utf-8?B?RzNjcWhNZzZ5ZEVKU3hmYlQ5akFPTHFRUk5hZ0xOZThXdW1US0UzVDJhRG1U?=
 =?utf-8?Q?Ufdk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjlRNjVJUzJIMklKZ0ZjNTdSNGR5MW5SQ0JvZkg4K0lWbXRvbHVkcUV4RTRF?=
 =?utf-8?B?bHd5RnBlOFNtRm54cVo2Zm1uNFBpYTZoblBqOHI0MnpoSkNMVHRwM3htaVJC?=
 =?utf-8?B?VndRWW9NTVpZc2tmV0ZhMHBleWFlbTRpejJPcS9XZE1VY09Vekx5d3RMQmZ6?=
 =?utf-8?B?TGU2VFd3ajRyR3RGY2N2d0kxSnJOMkNjYTZZYUd1bWIxcVdaTENra2x4bnhC?=
 =?utf-8?B?Z0pjd1FsVHBuMXBKUHdldzZLN2lTVXUreDAwU2tJMWVqdVZUQ0QyZHBiZ1JF?=
 =?utf-8?B?MHltaTBoMG9kZGxEQkc1Q2lya1ROdGR3NkJhK3dpZm4zdXd3VjdBQXVjZ296?=
 =?utf-8?B?YkYyaTNVY0dKZ2t0ZTVrYzNad2s1SGFReUtPYlMwTWpJMGcxU3dSckE4dXR4?=
 =?utf-8?B?djk4ZzFPblhOVi9SMVA3QjVmY1lsa1ltV0xEWmNJUjU2UkVETVZMYUlzL0pi?=
 =?utf-8?B?V1FNY2xzeGtjelhJV0J2WHovL3Mzc01kZk1ybXlJVGYwcDgwU0RYUHlpWUIr?=
 =?utf-8?B?UUF6UXlvcll5TE1IMnVJNTdXWnByOWVUYisvZGlacUE0ZW1GV25rWlNHYVFm?=
 =?utf-8?B?bW5kcGdDM29WZHlVRUY3czB3R3NxY0FCaVh3TVVNMzlCSFYwa0FKYUkvMXpM?=
 =?utf-8?B?alpjQ0Zvalp5RVBNTGs4bDlOZlVvOFdHL3U4d3pkU1NHYjZreDh6T21SS0Zz?=
 =?utf-8?B?bG1tVjcxVWltSU9oMjlMUUo0OWkrbXVJS29qL1lWSUluZGw3NW9zaTg1Uk84?=
 =?utf-8?B?NkdGaXRta2hnb3NNa0F4d0hoMDl2NlBUQXg0YngvQzRIWmU1c043QVA0eGR6?=
 =?utf-8?B?TTVaOEpKWnFMYlhKWTZ3TEptczdUOS9oa1ROWWhrcTh2Vnk1Y3B2WFFQczFa?=
 =?utf-8?B?THEvdWtlWWhwcWVtMUJ5WU16Rk1sN2NBeXZVTFgvMU0rQlVYd1MwaUVkbjB3?=
 =?utf-8?B?bWZQUlVlWWEwUng2eVNjaXorV2FqU2Z2Wml3ODBtSGs1QWFDVWVrK1NvOXhv?=
 =?utf-8?B?OXhxVml6UTRIZkxpUDZLK3p5VFpOWm1GNGJlMk5PS2RWU1k1K05vVmZmMW5F?=
 =?utf-8?B?VXVvVXhINDU1c01nQ1FFTHhaTzMwRTFqWlRlaEtoMWhMUHNtZWNDRit4MXpJ?=
 =?utf-8?B?UVlsR0U0VC8vWDBxalNjQ0tpVFZOWlJJWnlaY3gzbHdmdVFhZXVRRFZrOWhN?=
 =?utf-8?B?YllNdjBlNk14MDM1UHBhUWlzU3VLWDAvUWoxUTVSUWU2ZEdtdjVDblFnaksx?=
 =?utf-8?B?SG1Rb05sRS84cXh2RERrTkFYdFFySHk2bWNodXRhSXlRRDJYK004Z3pPNFht?=
 =?utf-8?B?bWoxcEtLN01NMitLRllsTjY3NjJHSVBYNGNIbmwxMG1tRGkrdmE4TU9NcTlh?=
 =?utf-8?B?K0RiTWtRbTVoVGE2RUVIdnZISzZTVENhTXZSam5RWlRnRS9VRGJqK1NyMVhB?=
 =?utf-8?B?S1JQZzlTc0trUlF3akJPTUplbEFHMFlBS0ZBd2ZRUnRaM0RiUkg4NEN3UnJp?=
 =?utf-8?B?VWFCQ0pGa1dQS1FCY1I2VkVXdXlvSnBIV3VJZERkVDB1VVBNTFExbnIxQk1M?=
 =?utf-8?B?UC9JbHJ0dTBvYUdudWZ0M3o0dWFXNGw0N3E0THhjTDlBcWgxV1ZTNllrVWQr?=
 =?utf-8?B?WmlDUFMwL0UxTW95ajUzMEU4ay9Ta2ZpYWFlTFQwb0UyeGFEWTVhcG43aFZ2?=
 =?utf-8?B?dDRlODJ2V2RiS0hqWnE1NkxZT2RsSERGMUJWRXA1Tzl4WnFlMjBGYlRKdEdp?=
 =?utf-8?B?c3diaUJ0UTZONnpoOVo2b1RKN0djRXRMUFByZDY1T041bG9Zd2JqTzhjRW5N?=
 =?utf-8?B?TmFOWStzak9VQUFTRVIzR3pheXVpeUo1c3F2bXJRdUFHaGJGd2FjclhPQkJl?=
 =?utf-8?B?Ym91ejBiRDFDbGczSTMzSmY3Qkx3SjI4bFQ5WVIvOHBMYU52UmNSWFF2TXZC?=
 =?utf-8?B?cmo5Vm9FYzcyU2NJc01ENzVJZ0NSSjNNd3czUmV0aVM3V2UvTlRNNVBXdjJB?=
 =?utf-8?B?bEE2Wjd5K1RGVk8rd1B0YTVrcTJKcCt3ZnEzMStRMnFDZ0NoZ1N4UEhxMlZl?=
 =?utf-8?B?ZDRLRm1HNEdrTGU2aGIwUnZDT0VUbnNIMGRubEM2WDdKWGJqZURDNnlXM1pz?=
 =?utf-8?B?eXliY29leW83RE5DdUZzV2xWUDZmNE1YckwxejJVSWk1VHFQMkNnWlNIcHR6?=
 =?utf-8?B?TWk4d2cyRzVHSmFacUVzSnBQSlRQL0tjaGQ1VkN3aHh6MG5IZjcwWW5COUdR?=
 =?utf-8?B?eSt4VEtvY1JWRktWTm1YMHJ5b3F0WUw4YlpjWEJGbGxFQ2NzcFdkbWc3Ri9n?=
 =?utf-8?B?Q0t0ZkxwMk5yMVozVGEwelpORmpxcDJEMGw2TkJtNk9ldXREYW1oblZzR2Np?=
 =?utf-8?Q?RhnAiEu+RfSWHLoY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b95d6af8-6800-4050-01dd-08de5cda054a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 12:54:19.7722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4C+QORTWU84V+FAP+R4aRbI8fkv1t2lnTanyWFrzyEWZp9ZYNDlnvHLkJYfqbnMzoBUApgAq/j9lbYIVLZUcXQ4X9vmdECrZUcyFGEqvwKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6766
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

This RFC updates tools/meson.build to stop linking all tools against the full igt_deps
set plus zlib. Most tools don’t actually need cairo, glib, udev, pciaccess, or
zlib, so the blanket dependency list pulls in far more libraries than necessary.

The patch replaces the flat tool list with a dictionary that assigns only the
required extra dependencies to each tool. A small common base (lib_igt, libdrm)
remains shared. Everything else is added per‑tool.

Tools that depended on global deps implicitly now declare their actual
requirements (intel_dp_compliance, msm_dp_compliance, intel_l3_parity, intel_reg,
amd_hdmi_compliance).

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/meson.build | 100 +++++++++++++++++++++++-----------------------
 1 file changed, 51 insertions(+), 49 deletions(-)

diff --git a/tools/meson.build b/tools/meson.build
index 8185ba160..acd394e23 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -11,51 +11,53 @@ foreach prog : tools_progs_noisnt
 			install : false)
 endforeach
 
-tools_progs = [
-	'igt_facts',
-	'igt_power',
-	'igt_stats',
-	'intel_audio_dump',
-	'intel_backlight',
-	'intel_bios_dumper',
-	'intel_display_bandwidth',
-	'intel_display_crc',
-	'intel_display_poller',
-	'intel_dump_decode',
-	'intel_error_decode',
-	'intel_forcewaked',
-	'intel_gpu_frequency',
-	'intel_firmware_decode',
-	'intel_framebuffer_dump',
-	'intel_gpu_time',
-	'intel_gtt',
-	'intel_guc_logger',
-	'intel_hdcp',
-	'intel_infoframes',
-	'intel_lid',
-	'intel_opregion_decode',
-	'intel_panel_fitter',
-	'intel_perf_counters',
-	'intel_pm_rpm',
-	'intel_reg_checker',
-	'intel_residency',
-	'intel_stepping',
-	'intel_tiling_detect',
-	'intel_vbt_decode',
-	'intel_watermark',
-	'intel_gem_info',
-	'intel_gvtg_test',
-	'dpcd_reg',
-	'lsgpu',
-]
-tool_deps = igt_deps
-tool_deps += zlib
+tools_progs = {
+	'igt_facts': [cairo],
+	'igt_power': [],
+	'igt_stats': [],
+	'intel_audio_dump': [],
+	'intel_backlight': [],
+	'intel_bios_dumper': [pciaccess],
+	'intel_display_bandwidth': [],
+	'intel_display_crc': [cairo],
+	'intel_display_poller': [],
+	'intel_dump_decode': [],
+	'intel_error_decode': [zlib],
+	'intel_forcewaked': [],
+	'intel_gpu_frequency': [],
+	'intel_firmware_decode': [],
+	'intel_framebuffer_dump': [cairo],
+	'intel_gpu_time': [],
+	'intel_gtt': [pciaccess],
+	'intel_guc_logger': [cairo],
+	'intel_hdcp': [cairo],
+	'intel_infoframes': [],
+	'intel_lid': [],
+	'intel_opregion_decode': [],
+	'intel_panel_fitter': [],
+	'intel_perf_counters': [],
+	'intel_pm_rpm': [glib, cairo],
+	'intel_reg_checker': [],
+	'intel_residency': [cairo],
+	'intel_stepping': [pciaccess],
+	'intel_tiling_detect': [cairo],
+	'intel_vbt_decode': [],
+	'intel_watermark': [],
+	'intel_gem_info': [cairo],
+	'intel_gvtg_test': [cairo],
+	'dpcd_reg': [],
+	'lsgpu': [libudev, glib, cairo],
+}
 
-foreach prog : tools_progs
-	executable(prog, prog + '.c',
-		   dependencies : tool_deps,
-		   install_rpath : bindir_rpathdir,
-		   install : true)
+tool_deps = [lib_igt, libdrm]
+
+foreach prog, deps : tools_progs
+	exe_deps = tool_deps + deps
+	executable( prog, prog + '.c',
+		    dependencies: exe_deps,
+		    install_rpath: bindir_rpathdir,
+		    install: true
+	)
 endforeach
 
 if libudev.found()
@@ -65,7 +67,7 @@ if libudev.found()
 		'igt_compliance_utils.c'
 	]
 	executable('intel_dp_compliance', sources : intel_dp_compliance_src,
-		   dependencies : [tool_deps, libudev],
+		   dependencies : [tool_deps, libudev, glib, cairo],
 		   install_rpath : bindir_rpathdir,
 		   install : true)
 endif
@@ -77,13 +79,13 @@ executable('gputop', 'gputop.c',
 
 intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
 executable('intel_l3_parity', sources : intel_l3_parity_src,
-	   dependencies : tool_deps,
+	   dependencies : [tool_deps, libudev],
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
 intel_reg_src = [ 'intel_reg.c', 'intel_reg_decode.c', 'intel_reg_spec.c' ]
 executable('intel_reg', sources : intel_reg_src,
-	   dependencies : tool_deps,
+	   dependencies : [tool_deps, pciaccess, cairo],
 	   install : true,
 	   install_rpath : bindir_rpathdir,
 	   c_args : [
@@ -100,7 +102,7 @@ executable('intel_gpu_top', 'intel_gpu_top.c',
 	   dependencies : [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,lib_igt_drm_fdinfo,math])
 
 executable('amd_hdmi_compliance', 'amd_hdmi_compliance.c',
-	   dependencies : [tool_deps],
+	   dependencies : [tool_deps, cairo],
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
@@ -111,7 +113,7 @@ if libudev.found()
 		'igt_compliance_utils.c'
 	]
 	executable('msm_dp_compliance', sources : msm_dp_compliance_src,
-			dependencies : [tool_deps, libudev],
+			dependencies : [tool_deps, libudev, glib, cairo],
 			install_rpath : bindir_rpathdir,
 			install : true)
 endif
-- 
2.51.2

