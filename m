Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE5CC28B28
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 03:27:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B250010E1AC;
	Thu, 13 Mar 2025 03:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D+waJ6C8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5925610E1AC
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 03:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741836428; x=1773372428;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=h00joPHkMmupAWvzTR3qyYLhX0Z8m6F/iXnZvZmB2i4=;
 b=D+waJ6C8rLO1rHMfCYBHGPIwnpHWcxgmq1P+qt1ZR48RNVML/XsjBcDT
 ZbPlhycRR+wC43tJAh5ZGq8sORPdGMBudZTxDBsbzIZYjqQ/DPVHMW6Uh
 Cimu2Ph2L1h2YJVQ5z66vU0imvKWXnD5dQW+xTGpwW/oZ3b9kmsmhYzu2
 67XiU/p7W5ivgtiXIcg5F+V9xaM3kagimzYk/ybjV0dpdA9uWy83RwSB5
 M5hBNgvTwAbRbaLvtmIXMPoUohmR5AcM54co7IjAGHuhhpYR2MaYM+sQ3
 y7bku9NBfjxbqbYImaSA2P66YK+Q91hJYXGkEc0gOh9diCzkvuFp97tVd g==;
X-CSE-ConnectionGUID: VxnUnhEQTzOOhk2JeQxBQw==
X-CSE-MsgGUID: oVwcrqVuT72jbUI5Fwejiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="46718813"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="46718813"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 20:27:08 -0700
X-CSE-ConnectionGUID: 6MoPz0UIS2eE3geyt7fABw==
X-CSE-MsgGUID: sRZsaQECQk6bvtB8/xyyXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="157993266"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 20:27:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 12 Mar 2025 20:27:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Mar 2025 20:27:07 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 20:27:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XzSyBOPHpmjHQSbX77tpdRH9RtHoYQvmqBCEWucci942mmCdoPkkkjdTk10lvqSxrE5Mc5YE/V7IThRM54tE2aA/tWVdh5ygxaTwK1Sg30T72+NhzUmMGZiG4YMayJMS4SIfGStJRhVq7/Am01jMnadaPiUT0IsDRdhemicBcAt1ZgNCCEW0ilyniKZ0NZiAsI/xoQdxjD/PRDKhjDSTc2gfQucreJ+39unO5A7UdORl4EMA3FxKwS47pdULZTL2cdTPni431n0D9K0aqq8ZK/F/Z5s/MM3jhIYJGU2gSD1f17IzHwetL1TPYctOsK7pJXwGsuEoL6ZP/5Halh7i0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6u39d08dLzs+YkTc/G0NoOhNXl6vJafFp3onBVfKCKo=;
 b=b6rda40DyymXEN+tQmOY9eij4qvr4c5av+wI7FmNwoZtPWxEXMwY5P22enDG3OznMoPLDpD7mF9xW39VUpXbJvOmYn/4rseDqevuNDbL8Wvp//Nl9q+YjP5xMtsVoDZfTFPU36xj75RdV5c234qfpLtHKml5Hs1iKoIbwBqktKcj9Vlz9I42w4GRb3eiPhgAdJkZMlYVEtHqwbNUpabHIObfAbWhwT02YFMWrRXOwIqJK8/3K+WMRGZKzvTxj98iHP7kd9UvtHh2F1h3QoE6rX0N2LWEomZqnGbOf1Ti8xmOyskr+oK8iwC5ho0BrjEaMDrk1kELopSlCf1QD8/wKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by LV8PR11MB8464.namprd11.prod.outlook.com (2603:10b6:408:1e7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 03:27:05 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%7]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 03:27:05 +0000
Date: Wed, 12 Mar 2025 22:27:00 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <igt-dev@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH i-g-t v3 2/6] tests/intel/xe_fault_injection: Make
 setup_injection_fault() programmable.
Message-ID: <2yevgrfwc4lil4yf7l3cyyinjp37vickclfcsiexezg4u55dsl@plus277q6kme>
References: <20250306101041.26827-1-satyanarayana.k.v.p@intel.com>
 <20250306101041.26827-3-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250306101041.26827-3-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW3PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:303:2b::21) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|LV8PR11MB8464:EE_
X-MS-Office365-Filtering-Correlation-Id: 373424ed-f230-4c60-f76e-08dd61deed54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bC9YdCs1K3ZKSW56VkNnUkt1aUVic1l1Ukd2VnFJeFd2dUdua1FCczdFOUhO?=
 =?utf-8?B?TkNWYmpEc3ZxL2kvdzh3Q1lpOFIzV2lQYVNvY3dzZ1ZFQTJpV2Y3U2V6VWFw?=
 =?utf-8?B?YlEzSitJVTJnbzNYckFvUzlwUm9ITEZweG81NDMzQXE3VFNHb1pFTHBNUjZ6?=
 =?utf-8?B?TEQwL1Z4eERPNitZRmNmblBTLzd6TklCQS9lOXB4UHVWekd6clZDNmtXaFQx?=
 =?utf-8?B?bUEwOE10ak0yVUw3N0g4bDMrR0RzVjhybHNOWWtFUGxMV2x1T29wVlBvajRL?=
 =?utf-8?B?MTZyQ2o1R2xEWEo1akp4UjllelB1RktaME5udlFFbVRobTJ5WUJRN2dpRVdP?=
 =?utf-8?B?cVFJK0JSSHJHMG1NTkhJRFEzSjhNOXd5T2plSlJ4MXhoa1Z1SnZjT05ENk9M?=
 =?utf-8?B?WXM3dlpwOEdqZWVyK3JpSTNxRTFGVk9kVkp4ZkF6elRjSkljenM5QWliOUdo?=
 =?utf-8?B?Nmtja1IzQzNnQ0cwazdoYUk1bkRxMktCSGNNd0NVZVZRbGI4OFZ2d0ZnVzZZ?=
 =?utf-8?B?UXZCbWlBMFhENDhtZzJjb0h3a0M5SWRTczZQV3BnWU5DOCsvcWY1NFo1TXJp?=
 =?utf-8?B?aC9BQytnS213aFFKTEVsUEI1NWg1VEZ4aFVnWmxXTUV4bE9NMDJCK0psaE52?=
 =?utf-8?B?YU4wektyU0NHbHZBcFpvaFlqL3ZaRWkzUzlqYmRiS3ZxVGxJZkVZUUV3U0JE?=
 =?utf-8?B?MmZqY2tqWW1XcENvT3N0QS9HWVR3QmZsYzc5Q0Q5SkVCakVuOVpaY1B4UVdK?=
 =?utf-8?B?NXZ6RWZkY05mM0V6ZUlHT0RvSXY5Q0RsenpYdlZnbzRtVWN3ODF1MU41Wk9M?=
 =?utf-8?B?ZFErM3l3dUVHNUN5cmg0TnFnZUZXMThJNGppb3VjN3g0TVA3QzVMbDdRSTJC?=
 =?utf-8?B?b1lWcGFwYStZWGxWc0d2RGwwM1l1TkdZUVpVM2EvZ2RVVTBzOVA2dW1yMEV1?=
 =?utf-8?B?cXp1bTRSbTRFSTBlN0EwQ296M3hLbHZETWJtZFZIQUs2Wm1weGt2TW8rTmFp?=
 =?utf-8?B?YVRQYUtRV2dsZDd5a0hMdnRmcGt4V21zSlltdysrV2xLaHhUZ1NNMEJxNGdQ?=
 =?utf-8?B?amFmQzBGWFhkRDA5TmVZZE5uNXdvMm1OdFkvYWQyM0NoL2plSGgzekFXTEx4?=
 =?utf-8?B?NzZlUDNWQ0VZZTNEbFI4dWp6a3o1aWJDVzR5eE1rSE53ZVVZYUx0elJUZlNo?=
 =?utf-8?B?a0g2ekc5UDBiQm0zRWwvb2RLRkc2ZVFpVEY4UUs4bExqSzNQYlZKMjhjOEpZ?=
 =?utf-8?B?NWNZOFM5QmgxRXV2R3BQbDFOOFRWeEVXTFFFdytycjVVZGRxaEZCOVZjKzZy?=
 =?utf-8?B?cTAwWEIwRmdnTE90U1RaOWx2L1o2S2JYNVN4QjkxNHAybVR2Smt6MVdVMjli?=
 =?utf-8?B?WTJUdGowTGJ1M0JkSEpzZHFNRy85bFE0UC9PYk1ySG9JeGdQTUxFSWRteFEx?=
 =?utf-8?B?TnhENnNOemFUcTh2cXpwUzF3NndiY04yeGxOdm9uR2NLMFhLSjRNY2RhM3Vl?=
 =?utf-8?B?WnFnL2tTdlZvWVZUSDFpVC9IZ210ZnpieUVZN0puSFNERkZXU21aZnkzYTdO?=
 =?utf-8?B?SmdveHBaRjlIVjJZVXBTODI2aUhJVnA3elBLYTl3KzF3UENob2ZtbUpTNS9r?=
 =?utf-8?B?SzJKNXRrdDFZRldZanc4YU1naEpmUW91VjhGQnJoM1RIQ09EdEladGxKcTMw?=
 =?utf-8?B?Mk5Xako0SEVOSEtNRG0wNGpZZGlXN3EwMlVoMk9ReHphbExXVVFqRXkzZlBy?=
 =?utf-8?B?dG5IeVNFNDVTcW5oaDhKRmYxV0tPOTVCZ29rY2E3YnZLaWRHSXdBM0JoRnBD?=
 =?utf-8?B?MjczS3ZHdGxhekhYQzMxamMwNk9tMGhySXF3V1BKVVdKMmhST1lBNkhpNVZU?=
 =?utf-8?Q?KStTDCrKGkbBg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkJxMHhBaE1KVzd5ZlJjVGNhSkdJSDQ2M0gycndKUHYyQVdLQjg0RnB1TVgv?=
 =?utf-8?B?OFdpYWFjY2hZK3ZHL1VGR0J1L3F2b1J2WUJJOFhMdk9zcjB0REJ6M25RMXZM?=
 =?utf-8?B?elNxWXAwZDNPSDhzS0RZbk9wVGdOYURTT0dYZ29CeGEyMVd2NitxZzkyWFRM?=
 =?utf-8?B?Tit5aTlKQ1pyY2dheXdzeXZUUDhuMU1UY2VnM1ZjVnhhSDVzcjc3ZHA1M2k2?=
 =?utf-8?B?YThlc25kYXlicklhdGlSSWE5aDZqYlZjSkg5OVJScGlyNlA1WHJ1bE1rMytO?=
 =?utf-8?B?YWFBRTl6MzNWQnZZQjR1d3NySEIwd25abTAvVUNJUFdNVGQ3anp6Ym0wamRo?=
 =?utf-8?B?eG9uYkhOVkc3RDY2b3l2ZHlSSG55SXhMcjFGanFsQnFKUmZQemR0aDkrSzBT?=
 =?utf-8?B?RHdiSU1nNWpuRHZrTDlZZzdSWjZnNE5mUldqcWw3RElYY1p1RHZVWlpRelUz?=
 =?utf-8?B?RUc5SFo2UFdOL2FSZzRRbml4NThxMnBPREVJY0NBTEpIaUwyOWMzUFYyclVm?=
 =?utf-8?B?ZmZFUFYyVHhtYlUramhISlp0MWMzSllGZS9FU3IyZEZUQzY5TGxoRDQrQVhl?=
 =?utf-8?B?WEs4STB4dWl0bTRCTW1CdldERDd4dkZzaWdnd202QzVZYWo4NmtpSmZ3N1Zq?=
 =?utf-8?B?ODErN0pkdDQ0bjVyZ1VaME16Q3RLUGl2aGRzd2s2Vy9oZFV5MEthUUN1OEhC?=
 =?utf-8?B?dlZrZFRRZzVHVksxWHQwaS8vdjF2TzJSeElqaVNVQVBLdGtPK0JjNkR0ak91?=
 =?utf-8?B?SGxNTlAraWxoRG0zdGpNaDd4QVpIMkt5U3cxUVNhQTNPVHk3Q3NONHBCVm1B?=
 =?utf-8?B?ek8rMTRHb2c0ZnM5TlZRUkVGWlQ0dnMwRHNEbFRDVzlNZndEeExFRmI1cS9r?=
 =?utf-8?B?MTIrck4veHA0a0lvd3c0SDZGZHI5NWhCVGVPUmJwMzdQZlpwZi83S3ZneHJs?=
 =?utf-8?B?K3dveUp0SmprYmxlRnRJVnE1dVJPYlkzamlzaUlqVGhvTWFlbFFRbDNNUkNL?=
 =?utf-8?B?VG9Na1N4N0tqRVJVTnp2a0VqYmxUMDZOOXlLZmF5LzJZNE0ycnN5bmlsZzRO?=
 =?utf-8?B?WVJidy9rNHBqWXVHend5ZTFOVXZEbGY2WHAvZDhobkxqMGpEYWY0ZDlGcjVw?=
 =?utf-8?B?a2t4T3hIWTVqY2FHa0lKblBYRjR6TFRmcHNzeEdGMWJmOHZLa1p3R1dDdE9j?=
 =?utf-8?B?emZYRjdjNlA0aEtlM1pON05TZnhtekt3QUNKSWhVVHF1dUkxUDFkbUxJbEpx?=
 =?utf-8?B?a2xBajdrSElUb2ppdW5PM2xTdGk3ZFdQL1FucUF1aUtZOHR6OCtzdElDamZn?=
 =?utf-8?B?TGdhd2ZuZ0lhZHM5bmNuNGhzZkp6TFFVUDNQNE5oSHZub1EwcWVMNUQvOVRx?=
 =?utf-8?B?ODVSbXZnbURnSHhGQ3dtNklLMlRranVXaGhNMkJUREJVUU1yaXRmbVRscnlV?=
 =?utf-8?B?S0VRSHo1NGtnelJZbGZhV28xbWVNNDl2bWFMMUFTN2p4TS9OZXNtb3I2Ym1Y?=
 =?utf-8?B?U3JvQUZoWXIvYjdzeWxURzhRZm5sVnNEdFhBY0drQUo2ZXMxVzdaMHZWQzNO?=
 =?utf-8?B?LzJkRkVXZmlDbDdNS1UyQmJqNUd2Vi9FVGphaWpWUTRtWHZtajg3c0s5RTh2?=
 =?utf-8?B?N2IzOXpmNWFXYllZTU0rVmVBVm5HTFN0Y2V3ZVV6VUxSWkRud1V2S0RCbDJY?=
 =?utf-8?B?dlJuUithd3lrU2ozM3dRa3pmQnpUelJPd1lyL29COE1UQ2F1Y09wWlJzYnh6?=
 =?utf-8?B?NGZQVnpMTWNWc2NGM05PZCtPeFRIa3VxUDVuQ3ZMMmtkVW1aQUFrU2U1WnVN?=
 =?utf-8?B?U1B1Y2RDZ20wYVppNFpJTktxSHhvU3RmM213aHR0N1I5N0w4TU1hR05DNFE3?=
 =?utf-8?B?TFJCSFpadFJzUXQ1UDhmN1lNU2paQzl2VVliTjdkTmR4cnlGS0IvZjJBdDQ4?=
 =?utf-8?B?MXJTeTJ4YjR4bm5vSHRUMW1aaC9lTEZOM25MRGR0L0RYSjRIZXJGcEhOM3Jp?=
 =?utf-8?B?SzJka29EdFdwT1I4THFvYnhKWTA5UGpNeXZZNDZHT1hOeXIxVkdMd1NqRWRC?=
 =?utf-8?B?a0xwZmNiVjA2WGVPNDJjYlhmOGkxWG1PejZYZ3dWem42enFEenlRUkZIQlhk?=
 =?utf-8?B?UTFMaG0zSk1vNmd5VWxaQURjRURkclRBb2tWMzhjb1U1ZktxSm5yL1Q4eGpo?=
 =?utf-8?B?bUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 373424ed-f230-4c60-f76e-08dd61deed54
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 03:27:05.0146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZyKz+33WZxg6uFIkAjlZliiSpyj85kI2cTTPFemhyoCu+P3Px23P4Ws6aJl4NSHQVtfw/0QQFXmh0lyHCPYfwRL4i3R1IOMup8blBYrB4ho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8464
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

On Thu, Mar 06, 2025 at 03:40:37PM +0530, Satyanarayana K V P wrote:
>The current setup_injection_fault() is always programming fixed fault
>injection parameters. Update this function to accept fault injection
>parameters for better injection capabilities.
>
>Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Francois Dugast <francois.dugast@intel.com>
>Reviewed-by: Francois Dugast <francois.dugast@intel.com>
>---
> tests/intel/xe_fault_injection.c | 42 +++++++++++++++++++++++++++-----
> 1 file changed, 36 insertions(+), 6 deletions(-)
>
>diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
>index 3631128b2..019ddfb7f 100644
>--- a/tests/intel/xe_fault_injection.c
>+++ b/tests/intel/xe_fault_injection.c
>@@ -31,6 +31,17 @@ enum injection_list_action {
> 	INJECTION_LIST_REMOVE,
> };
>
>+struct fault_injection_params {
>+	/* @probability: Likelihood of failure injection, in percent. */
>+	uint32_t probability;
>+	/* @interval: Specifies the interval between failures */
>+	uint32_t interval;
>+	/* @times: Specifies how many times failures may happen at most */
>+	int32_t times;
>+	/* @space: Specifies an initial resource "budget", decremented by "size" */
>+	uint32_t space;
>+};
>+
> static int fail_function_open(void)
> {
> 	int debugfs_fail_function_dir_fd;
>@@ -117,21 +128,40 @@ static void injection_list_do(enum injection_list_action action, const char func
> 	close(dir);
> }
>
>+/**
>+ * Default fault injection parameters which injects fault on first call to the
>+ * configured fail_function.
>+ */
>+static const struct fault_injection_params default_fault_params = {
>+	.probability = 100,
>+	.interval = 0,
>+	.times = -1,
>+	.space = 0
>+};
>+
> /*
>  * See https://docs.kernel.org/fault-injection/fault-injection.html#application-examples
>  */
>-static void setup_injection_fault(void)
>+static void setup_injection_fault(const struct fault_injection_params *fault_params)
> {
> 	int dir;
>
>+	igt_assert(fault_params);

remove assert and do something like this?

	if (!fault_params)
		fault_params = &&default_fault_params;

?

Lucas De Marchi

>+	igt_assert(fault_params->probability >= 0);
>+	igt_assert(fault_params->probability <= 100);
>+
> 	dir = fail_function_open();
> 	igt_assert_lte(0, dir);
>
>+	igt_debug("probability = %d, interval = %d, times = %d, space = %u\n",
>+			fault_params->probability, fault_params->interval,
>+			fault_params->times, fault_params->space);
>+
> 	igt_assert_lte(0, igt_sysfs_printf(dir, "task-filter", "N"));
>-	igt_sysfs_set_u32(dir, "probability", 100);
>-	igt_sysfs_set_u32(dir, "interval", 0);
>-	igt_sysfs_set_s32(dir, "times", -1);
>-	igt_sysfs_set_u32(dir, "space", 0);
>+	igt_sysfs_set_u32(dir, "probability", fault_params->probability);
>+	igt_sysfs_set_u32(dir, "interval", fault_params->interval);
>+	igt_sysfs_set_s32(dir, "times", fault_params->times);
>+	igt_sysfs_set_u32(dir, "space", fault_params->space);
> 	igt_sysfs_set_u32(dir, "verbose", 1);
>
> 	close(dir);
>@@ -326,7 +356,7 @@ igt_main
> 		igt_require(fail_function_injection_enabled());
> 		fd = drm_open_driver(DRIVER_XE);
> 		igt_device_get_pci_slot_name(fd, pci_slot);
>-		setup_injection_fault();
>+		setup_injection_fault(&default_fault_params);
> 	}
>
> 	for (const struct section *s = vm_create_fail_functions; s->name; s++)
>-- 
>2.35.3
>
