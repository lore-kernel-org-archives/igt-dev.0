Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6FEE7718A
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 17:10:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5437710E280;
	Thu, 19 Dec 2024 17:10:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mt9yKPhN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E237B10E280;
 Thu, 19 Dec 2024 17:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734628258; x=1766164258;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=B37Imlq5+QasyFPvmPS+s2uEqeHRTZts+UwglXIRobI=;
 b=mt9yKPhNf5tUK9A4ArPgZyN6QevN3pHT/S3y0FSNkhJMLPmVsNfg1dxN
 bo9+oq5IwpGPUCafjCJO0HxAEEpDQezs6YPsD+EMpY3TFHhyye7RJLzjG
 B7Bp0AF61mRexRCJMbbmWHNFgV0ljEAJ4lqgCrt258MOalNNz9uT1MZvq
 Ms+daDxDYuIZQH25ChBMbNszMOVnoXBI+8zFQ91orYomlmKJQyP3FIQEk
 O7WUUgD2YuirfdgaoT7XiIndIeFnRwBMCc5qb/xC4UCAGVo7lApv2xrw3
 tad716ctxIVz3en6Fm6Zje1Y7i+ob81n3NqeVe67SoWlZBAR+mk2/sZJa Q==;
X-CSE-ConnectionGUID: /abba8OyROOrw8JjpizrJg==
X-CSE-MsgGUID: VELNYMa9SduzH1O7Sky/cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35317531"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="35317531"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 09:10:58 -0800
X-CSE-ConnectionGUID: R61F/LswQDCbLhsIxS+iYQ==
X-CSE-MsgGUID: cNVkTE9AQcWe7uDVq/fd3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135583828"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2024 09:10:57 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 09:10:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 09:10:56 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 09:10:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQTvDy1cuLP+cMdVwsBKIjsNMnMSH59VFZYwY2n86qAzpbw8CWxsNNLeckwuTJvggkz2Mr9c7ndwyFPH1jBeKvxrqoTsiwOlllsom4oKWSUzBnrhNxa3f/drKBAcQ/JgucKo5V9+Na+mgivgkNIdKgR3QkIAFj0mL9X21i8HJ2khdMw2gFKhyZGXWabTZO3bcsnzxhaAoydjAjL9+fX0SYHE2q2GZQ/UbfTmYpS5d982ZBRBCUYa2CoQPE+s3Rp+c4euIEiWFFaGWjg4ltKSCU9Epw0BKwhhHvJAdsUIpxxwylHok2tckX9mB3MUYvP4Eda7b9EOjO7FGuzk+XGxoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/43A8RPibJSRDcLmUF1G7aInwCEEERjluH2kPWY9oIE=;
 b=fSm65dbW46ZmMt1jJhvBl2bDyLnQgpQkg0SRIpEdsOJH9yJFMr78hoPtoNDIkOmAwN3TlbBeIOQYUyDCzOh36HjcOEDxdfXQZ85btx0xBmV+IUQ6z1BmRnp2/JZSJ97v0VsKwml8wOi7kzkiubcYEroOCoPJidzUCcoJR8bQa1I9FJXvNccTjjyysxuCUY87RWlH6Z9l7fZRmUpB1pJZJnDSPTJtCZwykiQ95+JhXhg2E3fLhcqlDQp/fvI0UfnlKH1sFeEz9fQNPE0cwMWb8KxXur1Lwg603iZn01mCuoK1lAfCwtBjtx+Gzv8Q8uvOm5NWx/wHnUaKpaSK9ESoaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MW4PR11MB6839.namprd11.prod.outlook.com (2603:10b6:303:220::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 17:10:53 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0%6]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 17:10:53 +0000
Date: Thu, 19 Dec 2024 17:10:48 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <I915-ci-infra@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests=2Fi?=
 =?utf-8?Q?ntel=2Fgem=5Fexec=5Fbalancer?= =?utf-8?Q?=3A?= Decrease required
 load in `full` test
Message-ID: <lzrfml5jmyvua4kkj26gtdzqh24mm7wyfns7z2ear7iaxngtid@axlvwxgqhpeq>
References: <uupn5abwcptf6p4zdaz4ozl5utjcwij2sjlebrlgkqw3xupxma@nvacr67vd6tf>
 <173459519840.350813.12374231105564545373@b555e5b46a47>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <173459519840.350813.12374231105564545373@b555e5b46a47>
X-ClientProxiedBy: DUZPR01CA0188.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::27) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|MW4PR11MB6839:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ecf0ff7-4f16-4bce-1652-08dd2050180d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|27256017;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZjBQVkcxZ3hmZk5CNmdSWk1LQ29GbHZiOXlTYnhDK2hTWFloN0lESnNVenNT?=
 =?utf-8?B?VlVoaGw4MW5VOTNUWEhqbzN1OGpOU08vR1Npeml4ZnFhQVJnRHhmaDh6d1VD?=
 =?utf-8?B?VHRzY2dLVFhJb2FraHRtTWpERWpyNC9Qazcyc2FGVjJueThwR09TdGo5RllG?=
 =?utf-8?B?VjB6My95U3R1WCtOdHdSZ3hxckVPb0k5N3hHOCtidktzTDd4L25zWGM2RTdq?=
 =?utf-8?B?RVpXME9PNlV1TGJVTk5WWUd0QldSa2FzTUJSM0VKVFRTK1d3MGhtV0JJYnRi?=
 =?utf-8?B?VC9GK25NRGZZUTB1Z25BL0V6K2t1VDc1aXlQYjU5Mjh3VGlxM0k1d05FZkhI?=
 =?utf-8?B?OVRuUm05THlMVzNhN3RlVzU2MjE3aEZEUlpUYTAvcnBKV2duZWx3RlFVU3c3?=
 =?utf-8?B?RTZKRGFRejZjaFZBUlI0OFI1ZUVTWDVVbXE5R0t2Szg5RkNqV01RSnlzZkNs?=
 =?utf-8?B?d0owcEpubFhLSjdxMHM1ejFkaWFkVFRFWjJjV2hyM3pWTGZtdHRvTWFHVUha?=
 =?utf-8?B?ek9LaDNSdEFNSVNodTFsdFdjUWg2TGFabTdHb2x6dkM5R09KKzFnamJQY0Fo?=
 =?utf-8?B?ZHNNSjlRNkhuNlBFMndpV0RVVnc3TlRKNTJQVVc0TkJRenIyc0YxSUNXL0I5?=
 =?utf-8?B?VFFLM1A2eDhINFpsSFRnS1BHQ2FCaHJZZXFxQzdWM1pTZDNJdko4cUdoejF2?=
 =?utf-8?B?ZUs1WUlGWEZqQmRJdFpwaE1vbldMY3g0ekpianRsdGd6ZzlGeTBtMjZqMzl6?=
 =?utf-8?B?alNGUGVDNmYreUhrZ25IL3B6WkhVMmkrS3pzbUVwbFBZNGtmNys0NjJqd2RQ?=
 =?utf-8?B?TTZsWHBwUTI4VlVKZjB1RHl4ZGNVZndQZ2l4WmFkUmJWYnErS1FkVFNCd0VK?=
 =?utf-8?B?b0ZGYzk1UUJlRkJhSnJSc05zTktrdDZKcGlBdTcxUHFJVlUwUjFxRDBlcnYy?=
 =?utf-8?B?V1EyMXhZSGZLUklxWWt6dFFNbDBMSHBsTUo1MCt2a25VNzNrMGVPbHV3MnJW?=
 =?utf-8?B?eXA4TjNod2pmZE5BQ2NhSER2VWNlamJDd1JhcnZjTzYrNnNtS01LUkhpcVBF?=
 =?utf-8?B?QzkvNkdBM3hHM296ZC9QS0s4b3B0VWxLc3RLQkpqVFBTWm10aFNHSEQ1cGlo?=
 =?utf-8?B?bDNkN1RZd0NhZ1d1Wlg4cFBCTzNITjBINjRVdTFoNnhVQzF3S3JFY1dNaHZJ?=
 =?utf-8?B?bTRiblZyZGkybVlxRHp0YitTaWtucWZqeXg1RDlSNnVFbGw3S3ozU2xJRmF0?=
 =?utf-8?B?N0IwOEJzVytvTXhCR2Y2SXB2bWN6dkh2VDRPaEp5YzJ3cDRMNGRSUHZ6ZUZl?=
 =?utf-8?B?cmRSOWZ6Mnp5ZCs4L2dPSnFBNUVGMFcxdm45N1NFVkJuVFppYWdsYTljU1BR?=
 =?utf-8?B?ekJUc2p2Z2FTcUlCR1FKZzkvRFhQU1V1ajk4Rm54RHJkQ291T0Q3YUN3ZXBR?=
 =?utf-8?B?YkZUTW9VT2ovaml5V0llZjZFcGxQQ05XTnh4NTg0VnZ4aUJzWE1Xa2dQZzlI?=
 =?utf-8?B?WDZyR0Y5b0dzTnozeHpvVnphSzBFS292VnF5bTRTQTN2MG16TE1Vd1pobFh1?=
 =?utf-8?B?QzcxSndoYkhGTXB3N3Zxdm4wb0lmTnRLeHVNemJxeTdqaGxxSWZKRUx6Y0pD?=
 =?utf-8?B?U08rRXlGTnNhbmdwZktPS1IxM3E1WjBuWlJVMk5yeERWVTlCaGVnV1o1dzRS?=
 =?utf-8?B?V0xWd3RuQkNxdUZWVTcrT0hzMjkySU1KZHBmZEZwYVFXcnBIZ3VReUFmUktk?=
 =?utf-8?B?eE1oUjRBSmQ1MC9WTjBHcjJNd3VBd3dNK0FJNFBSNVBwS2hZeGRpbFFFUWI4?=
 =?utf-8?B?RXRrS2o2Wlo2eXJ0QXk1SktJMXY2cWRkTjZ5bjNJelRyWmtaSjA3b1U2eGhB?=
 =?utf-8?B?cUZHNlpuQi92WFFBZzlZUUVYcmRZUS91SmxjNzBDZHAvZlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0xaZDdHNHdNUUZwSHRmalhYR2xFRnlZUXNvS1VJdjJnUTlnb0FLQy9XZmQ5?=
 =?utf-8?B?YmRaUEU0SG9Ea2RTbmxya2JzMktJVnNtU1RwSDdnMElhb0QxL0VnRWVWMmdS?=
 =?utf-8?B?MDB6ZmNpTDJpYmZXUStmd1Jaa25hd0pqSFkwdXFFVE5kYWhKbmswSmxLYVdn?=
 =?utf-8?B?Nkd4T1NmSDhTaG8vMEhvS3lLamJnYjhMc3BSZGpoZThNWXF4ZGhrMkY1THk0?=
 =?utf-8?B?UFhsd095a3dtWWQ2Nm1jZVVSVGswMUkvTGplY3RBV3hTM0lNbWsyNTZyQzkr?=
 =?utf-8?B?RXQyNUFLdmJXSmZSNWtQemZiUy9LTkxaVy9yUzI5QzBZcHkvcEpVVmU0UmR1?=
 =?utf-8?B?aGNPeDhaclNhOGduYXdxblJIUy9jbWtXdGI2bVIvU1lpTG5GTjNwNmpxM1pO?=
 =?utf-8?B?eDMzNXgybk1Jc0l2d3Boc3JMVnpuZkJxMzE4eHcxV1BibmVxNzB0TVF0R1RL?=
 =?utf-8?B?Q0R5WEwzRWRVbFBRcTc4M29aQ1BBekU4dDVzRGNiNUlOTjJJc2hkKzVsSDR1?=
 =?utf-8?B?VGNobzVjZlhUMG95dzR3UFhTdGhuSWdDalNkQy9jT1dvSWpiaUJUdFhsYTFU?=
 =?utf-8?B?cnJHb25abzdOTHJmUjQvMUFsQUd0di9ZM2ZvWjFDZDVJblQ0TEl4T0VJSCtv?=
 =?utf-8?B?Q2FZd3JQSWdqSlk1K3FHeGt6OTA4WWhBODI1bHNVZW5NaDBSbjY2TGtLUHlQ?=
 =?utf-8?B?eXhHaTBiTXhsUnBrRGFlWXh5RzV5NjJqbFU1L0k5c2ZkUks4YW1sK3UyRHNY?=
 =?utf-8?B?R3VBcTJnZU9uaGdCWi9LL0lIR052TWZOQlFNQ3k0SG9zVjFyZ3VMdHAwQWNo?=
 =?utf-8?B?blFkSHJIb2dQeFBjZVI2aFJUYXhabnJZZ00xZUxMZ2Q4WkxHbFM0ckpwNm1z?=
 =?utf-8?B?MHpUeWJOQ1NuZ09ZOGlla1JQOGQ4bUJiMEMwbGkwQ2EyQ1VZcFF6dE9jN0s3?=
 =?utf-8?B?SXJyRHkyeFRsQlRYVEczWC9kMVNRNXozajlMQ3lRWDBUR1ZpYXYvbEphZ2Rw?=
 =?utf-8?B?UVZoNi9tM2dTYit6eWR3ZGRzMjgwSzVQSHRQRUJMa3pka2lyc21EaGlKM0g1?=
 =?utf-8?B?R0cvazgwUWVDZE5RdnZtYnIzbWZ3OTNDd3R0VTFmWGVsMzEvbUVKejhFRnlR?=
 =?utf-8?B?dGQ4ODRIemxkUHorRHhwYkRXVmVYQmVqVEEwZmlqTThWTGxJbFllekJ4RUpM?=
 =?utf-8?B?NGxvMjQxQmFnQUhId0EwL0JxaWtvWGxTeVcrMGhnN29kV0RObjBVSTlYOTZW?=
 =?utf-8?B?Zjh3d09hUGVRRjY5R2NFb2lPWkYxaFJITzZPWG55dSt3bUtxZm1ORlpyM281?=
 =?utf-8?B?S1d0bThEWVdpdm9mNDBqZE9vVmZYTEd4SE1PT00wWDRmdVFlb1VZVm5HWWNj?=
 =?utf-8?B?SHVrSXJIQytnbU03WEtYS2crQTNvS0haVDErTEN0OVpPN3RNc1pFZ1YxZlo1?=
 =?utf-8?B?M3RyaDg2clpQTnQzRkp4cVdnOGN2b1lNZThyek5DL091WDlwQ2pPL3pkM0Y0?=
 =?utf-8?B?TkN2aG1wZGJISkR0RmFveStwTitGT1V0aUd3a1VCWGhBYWNoUFhKRXRaNGN2?=
 =?utf-8?B?bVZ2UGpYT1UxWXo4d0wvUVphcnlBTG02VCtqQTQ2aEZFRGpWSHNyZW1wcjNr?=
 =?utf-8?B?RThmTzFkVUh2UTFNVzkwbUtZTmtFSXgwNzExckQwTjhVcVZEckl4d2pTTWRV?=
 =?utf-8?B?Wk14ZUpEUjVYMWFlZDZQUHJSZS9td25yRTBoNzVkSWJ1amRFb2dyN2N0OHdY?=
 =?utf-8?B?cis0NDc2MVZMSms1V2FFa0tscWZqVlBnaUhUVDBEdTZIdmltVHloai9zNnFD?=
 =?utf-8?B?ekhtbHFZVXZ1UDAxa01ualkrN1ExVGlPNWN3aWpBTU90bjQ1WEp1RnZwUDho?=
 =?utf-8?B?NGRyRmZEYXVqS2M0cmtRTkU4SStUZ0loaSszUkdvbFJmVFBJVEdwN2lsVVRH?=
 =?utf-8?B?NFNJQTQ2eGJWUGlUY1MxMnJ1RUZSZGY3MDA5bmQ1dVdIaFlSTTEzMkxqKzQ4?=
 =?utf-8?B?cE5kQmZNanBhZmZ6QXAranBIbmRKd3dsMzFlakFNcHV1Ly9CR0craHlsbWxZ?=
 =?utf-8?B?Q0VwNXhBaTdYTlFja1BIbk1SN3V4a1ZTejJTVU5HeDViK2hzYzNoOW9BdDEz?=
 =?utf-8?B?bkY5eUMyWXpHZlFNSUNZV21OK1l1UW5QeGFqMVlZdmh3VWhkY3JadFhHdWVR?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ecf0ff7-4f16-4bce-1652-08dd2050180d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 17:10:53.2122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aX1brijrmXkVVaMxq3Xr5up52iwxIFon9f7Z7/A/m+mhZhw61noL4COGT93bb/hpWWcTbzcI0HOtkkTUw5uEEHMGXoNK9n+gorkCC2uDVt4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6839
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

On 2024-12-19 at 07:59:58 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/gem_exec_balancer: Decrease required load in `full` test
> URL   : https://patchwork.freedesktop.org/series/142734/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15865_full -> IGTPW_12338_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12338_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12338_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12338/index.html
> 
> Participating hosts (11 -> 11)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12338_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_eio@in-flight-suspend:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12338/shard-glk2/igt@gem_eio@in-flight-suspend.html
> 
>   * igt@gem_exec_balancer@full-late:
>     - shard-dg2:          [PASS][2] -> [FAIL][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-1/igt@gem_exec_balancer@full-late.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12338/shard-dg2-6/igt@gem_exec_balancer@full-late.html
>     - shard-dg1:          [PASS][4] -> [FAIL][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-17/igt@gem_exec_balancer@full-late.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12338/shard-dg1-17/igt@gem_exec_balancer@full-late.html
> 
>   * igt@gem_exec_schedule@wide:
>     - shard-tglu:         [PASS][6] -> [INCOMPLETE][7] +1 other test incomplete
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-tglu-4/igt@gem_exec_schedule@wide.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12338/shard-tglu-2/igt@gem_exec_schedule@wide.html
> 
>   * igt@gem_tiled_swapping@non-threaded:
>     - shard-tglu:         NOTRUN -> [FAIL][8]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12338/shard-tglu-3/igt@gem_tiled_swapping@non-threaded.html
> 
>   * igt@i915_pm_rpm@debugfs-forcewake-user:
>     - shard-rkl:          NOTRUN -> [SKIP][9] +1 other test skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12338/shard-rkl-4/igt@i915_pm_rpm@debugfs-forcewake-user.html
> 
>   
> Known issues

-- 
Best regards,
Sebastian Brzezinka
