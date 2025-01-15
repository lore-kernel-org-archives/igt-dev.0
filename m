Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00266C02180
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jan 2025 15:56:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4EC10E744;
	Wed, 15 Jan 2025 15:56:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q3wK/8Q7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFFA10E744
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jan 2025 15:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736956569; x=1768492569;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=FEzS+UyQs6g1OxAwwi/IAy8lOhaEyETaXyc6xRdMfwU=;
 b=Q3wK/8Q7/TegsGT5Gx7l+J8tzfPk+4YKj27le6d2SsBJzY3IeLSiJY3H
 E8TS0zYwp5R2qxLCYRuoMABhMDQJSbZhrkJDWbdrkFZNev9zqvYlWObHB
 vEt9JR+vR9PQ2tiGqb1QahA7O2/wZ4u4RHCoCUR27/zyQPH+2Jebuy7l8
 +FJmXRV4GKdzqP3a0Z3saNVu5/tiHdVgEZ4mePFk2mV6qYTxV6HbW2wVr
 FzbsvK2I7VX/8OJLt4M+x0EbqaLfKQZwK/6yErygravGIFZdOHh+w+iE7
 tkFYCm03trtcXKef23VtNu+p5UkJjaZcccbGEm6NrZP6QHZG9j+ESjZ9q Q==;
X-CSE-ConnectionGUID: QdeHuU5tRtO/6+fqwaty0Q==
X-CSE-MsgGUID: J8/QRewlTDiA7fSZGeiq3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="41233851"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208,217";a="41233851"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 07:56:09 -0800
X-CSE-ConnectionGUID: AvuMhTXkR4Ss2aq5GJQojA==
X-CSE-MsgGUID: mJPC4DHKTC6QN4n7Aw0/Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; 
 d="scan'208,217";a="105123721"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2025 07:56:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 07:56:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 07:56:04 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 07:56:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HoQ04VhrB8vYk2YUzyaCgdli9M5z45IuHiYmao+oQnyUwz+A74ueWmXqckr7N5bgLmosq/ryaVNvq84uyuGqg/wv7j7IJqAx0xnOIWa7HzW0R+sbzf/Mx3QNyZ//N+pOAyBAQDSo8ZcvpZ3FmJs1zXXxmlXEh5xcDWeOL6Lc7nRGiEslCiPwMO1gl3XhuNyeWIn85OvhOZiLXn5B+WcfJiwXSxZ8Qj7nUDchlwZAKU0kZ4WTPjo4WsVTwncic9t4pDagffiOSToY5X0oFqH4+103TK16z7YGcto+6hhClEF2TykSZHCEYrUStr1ny8iqUNte13C0LNLVoOKEZYrXhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9OhkabNDwInc5KXGej15DxUlYnKXdLeyrOMVTnEJYA=;
 b=lji8LQRyqoRF0tObjt7q5oEP5z9XY90aGmZ7Zb5ZsYrxVRI8jKhf+sGxHSMjlzSRPJtPl3Vk8Rtk8IAvVjK6cj6OcgANjUPGYjfGENAMtS3/nneWljHsqv1Pl4FtH5Iw4mKxXlwJ4kecR5zodxF8z+qbldKjQkkMharlnqoPKrXCzKHJck8tonOPQdQ5wvzX2OFsNBf/lX9mtjsaTyMgx8cBWz/WsJq8Z8v/+Qkt7PmxPr7CJ5347vqd/6Vv6kDNu5Y55Mb3nowIXHV6OnB0VXyOVD+mcMCvADI8gMz5CVXrXW9Ungx5BIkn253HBtvyhLL/3ZOiqt1bCVzXu3cPdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by SA1PR11MB8794.namprd11.prod.outlook.com (2603:10b6:806:46a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 15:56:01 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%4]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 15:55:59 +0000
Content-Type: multipart/alternative;
 boundary="------------v4q9mnVYImAHaiFeC01d5Ias"
Message-ID: <90a12c2a-0ee5-4270-aac0-afdae2530f4e@intel.com>
Date: Wed, 15 Jan 2025 16:55:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t 2/7] lib/xe/xe_sriov_debugfs: Add validation for
 provisioned ranges
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>, Tomasz Lis
 <tomasz.lis@intel.com>
References: <20250114150848.332708-1-marcin.bernatowicz@linux.intel.com>
 <20250114150848.332708-3-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20250114150848.332708-3-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: VI1PR0102CA0069.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::46) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|SA1PR11MB8794:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c27d25c-7724-4de4-9212-08dd357d1aff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|8096899003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWdJVFl1KzRRazliRXI2bXdJb2hScGJGbmkxWUtTelZEcWMrbCtBNmNUcDlM?=
 =?utf-8?B?em9PTm90RUJJYU1Ea0V0Q2hIVWs1V2pRN1BLZzZJMWEyeDZEVU4rdGVtemk1?=
 =?utf-8?B?YnRvdUNwNnk5REdtNm11d1MyeHdzRTk1ZlhvdFFPMkp5Y0o1TG9vemxSYlh2?=
 =?utf-8?B?cXZNTXJtSHIwNzl3M3lWMFlKcTlNem9VaVNPM0YwNCs2elRmenlOaytVQkRa?=
 =?utf-8?B?eDI1clZLL0x6OG00ZFVqYTdtNnBCRERyRWdXZDg0Y0hGTm90WFFPRS9ObnFz?=
 =?utf-8?B?YUpjTWRLVlI5cnRIbGF4bHdCb2oxbnNYcTRaYTFRTjBWa2V1ZXlXZVJ3YUJ6?=
 =?utf-8?B?TEY4RkhSNTRWenM3Z2FDSFNuK2tKclIyN3JoU2YwdjhNSFJueUFidENIRm1K?=
 =?utf-8?B?MFBzZzF2OXBDcjVWdGVHeGoyZld6djJSZGRVekxnYm1VL1VuS2ZiNHN6VWhy?=
 =?utf-8?B?SmtLZ29wZWFlaGNYSGR1dloyRHhTQ1hoeThEaXNLc1lSQ3N5alNxQlZGUko0?=
 =?utf-8?B?NVNiRTUzeGNBdkU4VTlCczdnRTl6NHhWMzFnSkZkMjRNNExIT1I5OW9JekJ0?=
 =?utf-8?B?KzZxS2ZTbERqUUdieWhwWERtMVBMWkNUNzltVmNCRmtTQVZQY0JxbkpscWQy?=
 =?utf-8?B?ZHZ3b21ydllqOXRLOCs5djJuTTBHVDFGWVBCcUZqSVE0RVJaenhoMzZmUk1Z?=
 =?utf-8?B?TVB2UzE3QlhsU2pjWjk0LzJPc3htcUFYSjl0bzdyRmZqcFQ2aXBmanB5QW5l?=
 =?utf-8?B?L0FtMGdzRlFhdkZobmhIN2VVUmk4WEU2THRCVjE1aEVENEpqdDlSSG5CdUZi?=
 =?utf-8?B?L1BMeTFPd01uSEQ2cmdYQ3hjTmpoeWpqc25sSmpGaWpQNUh2bHFyY2VpMllm?=
 =?utf-8?B?VnRtV2h3ODRVNEJjUFd6WitUNGcrV0Y1OHRPTUxpcnpMRDB1NURvK2NjYlh6?=
 =?utf-8?B?YzcvcFJqWUFLOHJyQXBLTGJsM3czcUJNT0RhLzNXY2dGdC80MnFWcVZQdXpa?=
 =?utf-8?B?WUFocTNVZWxRQ3N2UHVpbmZCR3hyWTRxUmFNU0puSmFjWlhtSGZaQkVxVENk?=
 =?utf-8?B?VWVNSXFEQm5zd1l1SmpoQWc3NzU4akhGM2FsN3IxVWdKcm1kUzVFVXpvK085?=
 =?utf-8?B?M0Nxa0QxeTFlNE5PcU9HZ2IvRnVtekprT0phOTR1Ymt5K2dobUl6MXBQNEhS?=
 =?utf-8?B?amZrblBZOHVlT1FPUHBTVytGMGJVQUo1ajVxckNXTTNHWEFPeGZ1MzJvZVZq?=
 =?utf-8?B?N3hDTnpIa0JjTU9VVkdYVkdtbmVyUWIwMVZBdEMwd2x5dEFrMi9RNEZkbzFk?=
 =?utf-8?B?QjVRTGNYQTByUng0bW45alBJMDNRTlI5U0lQd3ZEclE5bGNwY1lPRkxveG1a?=
 =?utf-8?B?Y1RWcGNTUHpQTXRCTkRrUTFCZ04yd2xyTHlaS1pnZTVTK0o3Q2xwdTRneEkx?=
 =?utf-8?B?RTY3OFc4ZjBKODlKUmVMUGpXTUR2a2xKT0tsbGg5VnVpLzdhZE9hQjM0elJD?=
 =?utf-8?B?b014YmY4bUtzSEtGVkxGOXFvSW1kN3pQTnVHaUZKa2ZxSitQMTFFK200UVRt?=
 =?utf-8?B?T3REVCs2YmJoY2p0YzQ3Z0dxU2lqbGpQdE9TK01WSGZWZktHcnc3cVJGQnZH?=
 =?utf-8?B?ZlF4cFVrMmptV1hYcU13aTh0VmZHd21QOGdPcTludldRSUUwby9lSkV3cWQ5?=
 =?utf-8?B?Z0p6aXV4dzBsM2lYNE5yRXE5by9naDZkRkhaU1ZNa1ZRNTIvWkdCRDBMbW5s?=
 =?utf-8?B?TFh4a1d0YUZGYUZuV3pSMUNvOHExRGJ3eGVuOXR6QXZscW9odXU3U0Ura3FC?=
 =?utf-8?B?WEdGc3M4Z053aS82b29xbDFENjJkQUZZVUVqcGVRRnVvYWNINHBIRnFJVHlE?=
 =?utf-8?Q?MA7qSAr2kkduJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QytORGFBNmcwQmJlTFNFWGlFM3JuUXZlc0xoakZIdkd3VnZxeXNIakkvSHpo?=
 =?utf-8?B?MG1lYmdZdXNMVXZ4Y2JxWXlWYmlpM1poamNJY2VQcnpaUHB4c29nM2Y2dkdC?=
 =?utf-8?B?Nm8rWWw5V0RtbzljbVdCbytyYldXOFJZek9ITENlbVRycE1lNHhYWXVSNjBV?=
 =?utf-8?B?cks5Szg1Y3JvRzZRUERERE1xUlJWckFBeXdEc2k0NFl5Y2tBeElGbU5IQUl4?=
 =?utf-8?B?MVVpRXpJR2gyUUwrLzB0ZkVGRmF4azlTWWYwbW1pMDNVS2Fsb1E2eVlLMjRS?=
 =?utf-8?B?R1lzWWpQdy9iRmFid2RVUnRSRlQ5WTRqZkpUeW1LMThBUG8rd1BlcS8xYTZ4?=
 =?utf-8?B?VUdDUUJKREVjZzNqY1ZSTjdmSXBKeVdMQUZJbVAyclZhSkZOZ29yMHZSUGdR?=
 =?utf-8?B?LzVWOGxORVlJei9BaElUNmNOb3VhSk4zcGYwUWpiSGIzZVFWbW9UYkl0S09B?=
 =?utf-8?B?YWxyaTJlUXc3WU03VHZ6V01TREVsRDVPU0hXZ0Z4dEprOGoySk1MR1VhMFo2?=
 =?utf-8?B?VU81OHhseWZVSis5dlZFOURDL3NCTFBnMVNVVEJsVnVJVmptMVR6aGR0ckQv?=
 =?utf-8?B?WU51Z1U1VTdXOXRJMkg1Q0dyaHdvYUxUVm9KbXVLdUVvNGNMRmJKUHQ3dFFF?=
 =?utf-8?B?NWJZbHR3VjYzREZkTzd4KzBWN2krOVBoL1FnSUhQMTRUaWFQdHh1N3JzWTF4?=
 =?utf-8?B?OXFTRW5uTmJJTlZ4T0VIOXI0eVNCTGhhNnRGTFpwRFR3MWxIZXI5SDh0Qm0v?=
 =?utf-8?B?ejdsU25GR011NE9Dc2xrQWVlQ2liUmR1aHVZTzBPZnlHQzU2UEpCbEdIeE5p?=
 =?utf-8?B?d0xSMGdyeUJhUGZTdW1lMVkzSmt2NTJBNTBWa21iYWZEMXVMcFdDUDZsOG9B?=
 =?utf-8?B?YWRUb1hwRXF3Zko4R3orVUpnTndyd3RIMmM5RFhMajBGQ2Z1bUdWMG5zemNK?=
 =?utf-8?B?eEE0c2pFSVFEQkkyZnBKTTYrQXVPYjBCTkRsMWdUZ2t0ME41QWZiSzFwR0Zx?=
 =?utf-8?B?NHdrZ0pFcWhkVUx0NjZEcGhPanNUVnE1L0xydStackd2MndWb21rNTh0cjI5?=
 =?utf-8?B?UTN1TGlXaTVwN2tjbEo2eGVwbWNDd3BQWWErOExVM0VwamRGVlJvMFk3WTBl?=
 =?utf-8?B?ak1aejZjME1aU01rUmtSQzlOM1UxSGdNaTdjYzJFbE9uZ2RPUmFjNzZ4ZkFR?=
 =?utf-8?B?ZVdEdGJvS0ZjSXA4anVUTVhKQ3I2aHAvK2lDY0JBMzFNZWxkN2p3NnFvQVJa?=
 =?utf-8?B?VFBXRmRqdVliYm80b1IzNTBUMlBuSWdFNW5CUitaQ3ZYeUVCREVmVFdUR1Q5?=
 =?utf-8?B?RWhLZW43ckRGd2NoaVNVdDJLWmVQMUFhOUhvSk5uR0VmYVhXZjg2NE5QcWdz?=
 =?utf-8?B?QU5sMjdvbHFBVDRNdFhsT2FIZEhSN3g0aDhJelA4ZmZVNE4vQ3k4WHhweENm?=
 =?utf-8?B?VkcwcFBYaXNlcFBsQW5tbVZvUmN0bktKc1BnTVRoaVJqR080NmVYN05YNlV3?=
 =?utf-8?B?UlZtUVFLaExYZzc5OUdmcHpkU3kyMitTS1RJZEJiZm9qRXpIOWdOdTlpVGJO?=
 =?utf-8?B?Smw2VjN2clB0MXpSd2RuMm5wUU94bytYaVFtMHA1endsRld2WEpXQWhhbVpT?=
 =?utf-8?B?M2xuZWNFUGpjcnh0SGlVRHVEZG5nN3lkN09XYkMrbGl4N2E1OXRxUXhMd2Ru?=
 =?utf-8?B?N0h6V0JjNEdxOEFRRkhaa3dKeHM1U2ppTXY3NkIwVkRHNXlBTTVneVEyTkRT?=
 =?utf-8?B?cUl4YjRsQStpcStuR0VBVlpSWUJOVW51YUFabjY5bW5CQWRNN2VwQ0JWVUQ5?=
 =?utf-8?B?eDhrelVtUUZWc2FRSTZxYnovNG1NRzhsbm9Fc2lqS1V6K2Zmc1Jqd2ErQXVQ?=
 =?utf-8?B?UHFQWHc5VHF2MVhkZmRLWGVmNmxoYis2OHR6ekVRcHowalloOFM1Y0hXQ0FS?=
 =?utf-8?B?OHNiMGp6M0ZKeU10THNySUR1WHlqZ0F2U2dVc1NFNEFiM0F5dE9SWllQM1Fo?=
 =?utf-8?B?ditVMkE5Q3hCZTN6aUdsMVIwQkc1eE5hVE42NVNpNE5XWnN2bW1lbmhvYkcz?=
 =?utf-8?B?QzQvTW12a29zcmRQdHV1bThSUVl5NTQ1K004cEQwVEpCZ2pDSW9WcmNNSTVx?=
 =?utf-8?Q?hlgkomVKx1GjCzWql8uwT++WK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c27d25c-7724-4de4-9212-08dd357d1aff
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 15:55:59.8965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rBF8VcVjXeucPL65HEy/6bAItokgidLZ0XgrOErsv4tsNCRbALkxMslJmwtQMxojWxFr0Wmc5YXPUJ5gQPmOfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8794
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

--------------v4q9mnVYImAHaiFeC01d5Ias
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 1/14/2025 16:08, Marcin Bernatowicz wrote:
> Introduce `xe_sriov_pf_debugfs_read_check_ranges`, adding a validation
> step on top of `xe_sriov_pf_debugfs_read_provisioned_ranges`.
>
> Enforce checks for:
> - Ranges when no VFs are expected.
> - Duplicate, missing, or out-of-range VF IDs.
>
> The function ensures the returned ranges are sorted by VF ID.
>
> Signed-off-by: Marcin Bernatowicz<marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak<adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski<jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna<lukasz.laguna@intel.com>
> Cc: Michał Wajdeczko<michal.wajdeczko@intel.com>
> Cc: Michał Winiarski<michal.winiarski@intel.com>
> Cc: Narasimha C V<narasimha.c.v@intel.com>
> Cc: Piotr Piórkowski<piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P<satyanarayana.k.v.p@intel.com>
> Cc: Tomasz Lis<tomasz.lis@intel.com>
> ---
>   lib/xe/xe_sriov_debugfs.c | 116 ++++++++++++++++++++++++++++++++++++++
>   lib/xe/xe_sriov_debugfs.h |   4 ++
>   2 files changed, 120 insertions(+)
>
> diff --git a/lib/xe/xe_sriov_debugfs.c b/lib/xe/xe_sriov_debugfs.c
> index 92a477764..abb1bf7d5 100644
> --- a/lib/xe/xe_sriov_debugfs.c
> +++ b/lib/xe/xe_sriov_debugfs.c
> @@ -206,6 +206,122 @@ cleanup:
>   	return ret;
>   }
>   
> +static int compare_ranges_by_vf_id(const void *a, const void *b)
> +{
> +	const struct xe_sriov_provisioned_range *range_a = a;
> +	const struct xe_sriov_provisioned_range *range_b = b;
> +
> +	return (range_a->vf_id - range_b->vf_id);
> +}
> +
> +#define MAX_DEBUG_ENTRIES 70U
> +
> +static int validate_vf_ids(enum xe_sriov_shared_res res,
> +			   struct xe_sriov_provisioned_range *ranges,
> +			   unsigned int nr_ranges, unsigned int expected_num_vfs)
> +{
> +	unsigned int current_vf_id = 0;
> +
> +	/* If no VFs are expected, ensure no ranges are provided */
> +	if (expected_num_vfs == 0) {
> +		if (nr_ranges > 0) {
> +			unsigned int limit = min(nr_ranges, MAX_DEBUG_ENTRIES);
> +
> +			igt_debug("%s: Unexpected %u ranges when expected num_vfs == 0\n",
> +				  xe_sriov_debugfs_provisioned_attr_name(res),
> +				  nr_ranges);
> +			for (unsigned int i = 0; i < limit; i++) {
> +				igt_debug((res == XE_SRIOV_SHARED_RES_GGTT) ?
> +						  "%s:VF%u: %lx-%lx\n" :
> +						  "%s:VF%u: %lu-%lu\n",
> +					  xe_sriov_shared_res_to_string(res),
> +					  ranges[i].vf_id, ranges[i].start, ranges[i].end);
> +			}
> +			igt_debug_on_f(nr_ranges > MAX_DEBUG_ENTRIES,
> +				       "%s: Output truncated to first %u ranges out of %u\n",
> +				       xe_sriov_debugfs_provisioned_attr_name(res),
> +				       MAX_DEBUG_ENTRIES, nr_ranges);
> +
> +			return -ERANGE;
> +		}
> +		return 0; /* Valid case: no VFs, no ranges */
> +	}
> +
> +	if (igt_debug_on_f(nr_ranges == 0,
> +			   "%s: No VF ranges\n",
> +			   xe_sriov_debugfs_provisioned_attr_name(res)))
> +		return -ENOENT;
> +
> +	igt_assert(ranges);
> +	qsort(ranges, nr_ranges, sizeof(ranges[0]), compare_ranges_by_vf_id);
> +
> +	for (unsigned int i = 0; i < nr_ranges; i++) {
> +		unsigned int vf_id = ranges[i].vf_id;
> +
> +		if (igt_debug_on_f(vf_id == current_vf_id,
> +				   "%s: Duplicate VF%u entry found\n",
> +				   xe_sriov_debugfs_provisioned_attr_name(res), vf_id))
> +			return -EEXIST;
> +
> +		if (igt_debug_on_f(vf_id < 1 || vf_id > expected_num_vfs,
> +				   "%s: Out of range VF%u\n",
> +				   xe_sriov_debugfs_provisioned_attr_name(res), vf_id))
> +			return -ERANGE;
> +
> +		if (igt_debug_on_f(vf_id > current_vf_id + 1,
> +				   "%s: Missing VF%u\n",
> +				   xe_sriov_debugfs_provisioned_attr_name(res),
> +				   current_vf_id + 1))
> +			return -ESRCH;
> +
> +		current_vf_id = vf_id;
> +	}
> +
> +	if (igt_debug_on_f(current_vf_id != expected_num_vfs,
> +			   "%s: Missing VF%u\n",
> +			   xe_sriov_debugfs_provisioned_attr_name(res), expected_num_vfs))
> +		return -ESRCH;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sriov_pf_debugfs_read_check_ranges:
> + * @pf_fd: PF device file descriptor
> + * @res: resource
> + * @gt_id: GT number
> + * @ranges: pointer to array of provisioned ranges
> + * @expected_num_vfs: expected number of provisioned VFs
> + *
> + * Reads and validates provisioned ranges of shared resources.
> + * If successfully validated, returns num_vfs allocated ranges
> + * sorted by VF id.
> + * The caller should free the allocated space.
> + *
> + * Return: 0 if successful in reading valid ranges, otherwise negative error code.
> + */
> +int xe_sriov_pf_debugfs_read_check_ranges(int pf_fd, enum xe_sriov_shared_res res,
> +					  unsigned int gt_id,
> +					  struct xe_sriov_provisioned_range **ranges,
> +					  unsigned int expected_num_vfs)
> +{
> +	unsigned int nr_ranges;
> +	int ret;
> +
> +	ret = xe_sriov_pf_debugfs_read_provisioned_ranges(pf_fd, res, gt_id,
> +							  ranges, &nr_ranges);
> +	if (ret)
> +		return ret;
> +
> +	ret = validate_vf_ids(res, *ranges, nr_ranges, expected_num_vfs);
> +	if (ret) {
> +		free(*ranges);
> +		*ranges = NULL;
> +	}
> +
> +	return ret;
> +}
> +
>   static int xe_sriov_pf_debugfs_path_open(int pf, unsigned int vf_num,
>   					 unsigned int gt_num)
>   {
> diff --git a/lib/xe/xe_sriov_debugfs.h b/lib/xe/xe_sriov_debugfs.h
> index 2db965f9b..cd5f932be 100644
> --- a/lib/xe/xe_sriov_debugfs.h
> +++ b/lib/xe/xe_sriov_debugfs.h
> @@ -16,6 +16,10 @@ int xe_sriov_pf_debugfs_read_provisioned_ranges(int pf_fd, enum xe_sriov_shared_
>   						unsigned int gt_id,
>   						struct xe_sriov_provisioned_range **ranges,
>   						unsigned int *nr_ranges);
> +int xe_sriov_pf_debugfs_read_check_ranges(int pf_fd, enum xe_sriov_shared_res res,
> +					  unsigned int gt_id,
> +					  struct xe_sriov_provisioned_range **ranges,
> +					  unsigned int expected_num_vfs);
>   int __xe_sriov_pf_debugfs_get_u32(int pf, unsigned int vf_num,
>   				  unsigned int gt_num, const char *attr,
>   				  uint32_t *value);

LGTM,
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

--------------v4q9mnVYImAHaiFeC01d5Ias
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/14/2025 16:08, Marcin Bernatowicz
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250114150848.332708-3-marcin.bernatowicz@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">Introduce `xe_sriov_pf_debugfs_read_check_ranges`, adding a validation
step on top of `xe_sriov_pf_debugfs_read_provisioned_ranges`.

Enforce checks for:
- Ranges when no VFs are expected.
- Duplicate, missing, or out-of-range VF IDs.

The function ensures the returned ranges are sorted by VF ID.

Signed-off-by: Marcin Bernatowicz <a class="moz-txt-link-rfc2396E" href="mailto:marcin.bernatowicz@linux.intel.com">&lt;marcin.bernatowicz@linux.intel.com&gt;</a>
Cc: Adam Miszczak <a class="moz-txt-link-rfc2396E" href="mailto:adam.miszczak@linux.intel.com">&lt;adam.miszczak@linux.intel.com&gt;</a>
Cc: Jakub Kolakowski <a class="moz-txt-link-rfc2396E" href="mailto:jakub1.kolakowski@intel.com">&lt;jakub1.kolakowski@intel.com&gt;</a>
Cc: Lukasz Laguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a>
Cc: Michał Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Michał Winiarski <a class="moz-txt-link-rfc2396E" href="mailto:michal.winiarski@intel.com">&lt;michal.winiarski@intel.com&gt;</a>
Cc: Narasimha C V <a class="moz-txt-link-rfc2396E" href="mailto:narasimha.c.v@intel.com">&lt;narasimha.c.v@intel.com&gt;</a>
Cc: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>
Cc: Satyanarayana K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a>
Cc: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
---
 lib/xe/xe_sriov_debugfs.c | 116 ++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_sriov_debugfs.h |   4 ++
 2 files changed, 120 insertions(+)

diff --git a/lib/xe/xe_sriov_debugfs.c b/lib/xe/xe_sriov_debugfs.c
index 92a477764..abb1bf7d5 100644
--- a/lib/xe/xe_sriov_debugfs.c
+++ b/lib/xe/xe_sriov_debugfs.c
@@ -206,6 +206,122 @@ cleanup:
 	return ret;
 }
 
+static int compare_ranges_by_vf_id(const void *a, const void *b)
+{
+	const struct xe_sriov_provisioned_range *range_a = a;
+	const struct xe_sriov_provisioned_range *range_b = b;
+
+	return (range_a-&gt;vf_id - range_b-&gt;vf_id);
+}
+
+#define MAX_DEBUG_ENTRIES 70U
+
+static int validate_vf_ids(enum xe_sriov_shared_res res,
+			   struct xe_sriov_provisioned_range *ranges,
+			   unsigned int nr_ranges, unsigned int expected_num_vfs)
+{
+	unsigned int current_vf_id = 0;
+
+	/* If no VFs are expected, ensure no ranges are provided */
+	if (expected_num_vfs == 0) {
+		if (nr_ranges &gt; 0) {
+			unsigned int limit = min(nr_ranges, MAX_DEBUG_ENTRIES);
+
+			igt_debug(&quot;%s: Unexpected %u ranges when expected num_vfs == 0\n&quot;,
+				  xe_sriov_debugfs_provisioned_attr_name(res),
+				  nr_ranges);
+			for (unsigned int i = 0; i &lt; limit; i++) {
+				igt_debug((res == XE_SRIOV_SHARED_RES_GGTT) ?
+						  &quot;%s:VF%u: %lx-%lx\n&quot; :
+						  &quot;%s:VF%u: %lu-%lu\n&quot;,
+					  xe_sriov_shared_res_to_string(res),
+					  ranges[i].vf_id, ranges[i].start, ranges[i].end);
+			}
+			igt_debug_on_f(nr_ranges &gt; MAX_DEBUG_ENTRIES,
+				       &quot;%s: Output truncated to first %u ranges out of %u\n&quot;,
+				       xe_sriov_debugfs_provisioned_attr_name(res),
+				       MAX_DEBUG_ENTRIES, nr_ranges);
+
+			return -ERANGE;
+		}
+		return 0; /* Valid case: no VFs, no ranges */
+	}
+
+	if (igt_debug_on_f(nr_ranges == 0,
+			   &quot;%s: No VF ranges\n&quot;,
+			   xe_sriov_debugfs_provisioned_attr_name(res)))
+		return -ENOENT;
+
+	igt_assert(ranges);
+	qsort(ranges, nr_ranges, sizeof(ranges[0]), compare_ranges_by_vf_id);
+
+	for (unsigned int i = 0; i &lt; nr_ranges; i++) {
+		unsigned int vf_id = ranges[i].vf_id;
+
+		if (igt_debug_on_f(vf_id == current_vf_id,
+				   &quot;%s: Duplicate VF%u entry found\n&quot;,
+				   xe_sriov_debugfs_provisioned_attr_name(res), vf_id))
+			return -EEXIST;
+
+		if (igt_debug_on_f(vf_id &lt; 1 || vf_id &gt; expected_num_vfs,
+				   &quot;%s: Out of range VF%u\n&quot;,
+				   xe_sriov_debugfs_provisioned_attr_name(res), vf_id))
+			return -ERANGE;
+
+		if (igt_debug_on_f(vf_id &gt; current_vf_id + 1,
+				   &quot;%s: Missing VF%u\n&quot;,
+				   xe_sriov_debugfs_provisioned_attr_name(res),
+				   current_vf_id + 1))
+			return -ESRCH;
+
+		current_vf_id = vf_id;
+	}
+
+	if (igt_debug_on_f(current_vf_id != expected_num_vfs,
+			   &quot;%s: Missing VF%u\n&quot;,
+			   xe_sriov_debugfs_provisioned_attr_name(res), expected_num_vfs))
+		return -ESRCH;
+
+	return 0;
+}
+
+/**
+ * xe_sriov_pf_debugfs_read_check_ranges:
+ * @pf_fd: PF device file descriptor
+ * @res: resource
+ * @gt_id: GT number
+ * @ranges: pointer to array of provisioned ranges
+ * @expected_num_vfs: expected number of provisioned VFs
+ *
+ * Reads and validates provisioned ranges of shared resources.
+ * If successfully validated, returns num_vfs allocated ranges
+ * sorted by VF id.
+ * The caller should free the allocated space.
+ *
+ * Return: 0 if successful in reading valid ranges, otherwise negative error code.
+ */
+int xe_sriov_pf_debugfs_read_check_ranges(int pf_fd, enum xe_sriov_shared_res res,
+					  unsigned int gt_id,
+					  struct xe_sriov_provisioned_range **ranges,
+					  unsigned int expected_num_vfs)
+{
+	unsigned int nr_ranges;
+	int ret;
+
+	ret = xe_sriov_pf_debugfs_read_provisioned_ranges(pf_fd, res, gt_id,
+							  ranges, &amp;nr_ranges);
+	if (ret)
+		return ret;
+
+	ret = validate_vf_ids(res, *ranges, nr_ranges, expected_num_vfs);
+	if (ret) {
+		free(*ranges);
+		*ranges = NULL;
+	}
+
+	return ret;
+}
+
 static int xe_sriov_pf_debugfs_path_open(int pf, unsigned int vf_num,
 					 unsigned int gt_num)
 {
diff --git a/lib/xe/xe_sriov_debugfs.h b/lib/xe/xe_sriov_debugfs.h
index 2db965f9b..cd5f932be 100644
--- a/lib/xe/xe_sriov_debugfs.h
+++ b/lib/xe/xe_sriov_debugfs.h
@@ -16,6 +16,10 @@ int xe_sriov_pf_debugfs_read_provisioned_ranges(int pf_fd, enum xe_sriov_shared_
 						unsigned int gt_id,
 						struct xe_sriov_provisioned_range **ranges,
 						unsigned int *nr_ranges);
+int xe_sriov_pf_debugfs_read_check_ranges(int pf_fd, enum xe_sriov_shared_res res,
+					  unsigned int gt_id,
+					  struct xe_sriov_provisioned_range **ranges,
+					  unsigned int expected_num_vfs);
 int __xe_sriov_pf_debugfs_get_u32(int pf, unsigned int vf_num,
 				  unsigned int gt_num, const char *attr,
 				  uint32_t *value);</pre>
    </blockquote>
    <br>
    LGTM,<br>
    Reviewed-by: Lukasz Laguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a><br>
    <br>
    <span style="white-space: pre-wrap">
</span>
  </body>
</html>

--------------v4q9mnVYImAHaiFeC01d5Ias--
