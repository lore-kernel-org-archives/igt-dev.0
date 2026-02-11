Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935FCE9E2F9
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 12:11:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43EC210E072;
	Wed, 11 Feb 2026 12:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YBwfDUmQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E66E310E072
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 12:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770811862; x=1802347862;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9/if3TnAh+IdkQvBOs0f5/QeHcbN7i0WnVYUkWerflI=;
 b=YBwfDUmQe0UF8J7ORcM66PDFVv95iI+fuLz0Ias2oqTDCDgHo1h/+Zsc
 Z3ohKBuigzpLvZkrLi5nxeKnIhDzSas20AqbhOIAYjcZ2NlrIXnVWjLng
 u8uvC9VupWyL5tyCERvT7frVnJjuSx8EyTh5GBkM+SxdVUR34iE10cYne
 JxS8Ya292A+JQyD5eMkfGhe7HQlibk8tIi7ZLvzUuo/HJPJs+WDUNZzwb
 8FES2Y+rKGU7e29Ke9ia2PoGkXBZiadAAKxzcrHhAlpSyfNmodW7msWCW
 Uz+sq5xhjcuoq0CoQ/5rqc5/uFjV74736/1rcqhucXMtXwLkAWNu+bkNa g==;
X-CSE-ConnectionGUID: Fs0e5V6bSHGivkJTki0UqA==
X-CSE-MsgGUID: Xmb0oz36Rr+wzlGhovsZLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="70978920"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="70978920"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 04:11:02 -0800
X-CSE-ConnectionGUID: hGlXnaVeS2ed4TgCvaBNFQ==
X-CSE-MsgGUID: vF4loaumT3mAL9el1v+oJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="216515916"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 04:11:01 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 04:11:01 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 11 Feb 2026 04:11:01 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.3) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 04:10:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BjvYKF4nMvBdZPWB95boNwqf2qLh5sBcbbwa4/s3gtPItc89Na5KyOmgMFfhE/gSOGEQumC+1/vqLTRCuA1nmLKhBi4COF+/P/eI8yqr9A56zEb5IoVRyC0cewPdO6bZkO1Eqe6LFmKeZ+fQ9EKI2Wd073FSR95b320Uy2YdYdJ0EehIZ3FEE26jfzFeBSHLdP6uMqiWC7LqO6dQ396UXz8xKYKlcfug3M/3HR9LFbDjukgA19W+MkBYdMxF77tZvgHpbkvqcqoUJy7vGNzVbrYfnsfe5CLgpFCuVfhMQD1ieCRrEcX+oRjxYJ8WuVNr7KkRDco4YLSrI7t3K08oVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5C5vCu8GsnntSvqEPTRHkWpkTO/mTPBnbH1ieb3bNw=;
 b=LaDQ85v5eOCxlKVHEgvaaHUsuxLJ5eqE/eZivKyqIlPq7CSlqFJBHm58PcsMNVWfmSQXSeZ90ltQ4TX42MxAAeBxJz7WxL0qL6r0pGVEJH8se7m+LcyHSlsTpfDpV1jXHRL7BRpHYE54vIC2h/5KrPGwK6aBWEQsw773c77R0TNiJ+omLnJegen2ZVEjLwo429Nw0WJcrCPMpnVWF1a/vYrUAbmsIj7qj5tt+E5I6dy74QWWaGBo/JW0PJEsUqXNTx3u6nEDitR29QLHC+86bOSLFX8Q+ojdUoASSyHC+YEJIVkLHdlzzBFiJ5x6FI2gfa2x0m4NHWm55p7xkvoMVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by CO1PR11MB5172.namprd11.prod.outlook.com (2603:10b6:303:6c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 12:10:52 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9611.008; Wed, 11 Feb 2026
 12:10:52 +0000
Message-ID: <f455d43e-b24e-493c-8d94-745be7510020@intel.com>
Date: Wed, 11 Feb 2026 13:10:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 i-g-t 2/6] lib/igt_pci: Add generic PCI driver override
 and bind/unbind helpers
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20260211111834.1140287-1-marcin.bernatowicz@linux.intel.com>
 <20260211111834.1140287-3-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260211111834.1140287-3-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P189CA0031.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::44) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|CO1PR11MB5172:EE_
X-MS-Office365-Filtering-Correlation-Id: 45e83cb6-a2db-4215-0f7f-08de696699d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGFXYm9jVThWVEhXQzNOSngwZzc3ZjZJemJ2UUJETVdERmxuL2svaUtUNzFh?=
 =?utf-8?B?eU40S2VaN1hoZTc4cm9sRnZzSnV6WXBpZ1hTWW5LKy83MlRkbk1ic2FxeFhC?=
 =?utf-8?B?MFZISHRFeWV0TVdVb09wSUZWV1VpOWV5YUxsRzMvdWVRWmlRVjZmV0hVOVlK?=
 =?utf-8?B?c1lWUzlSZVBFajZhY3UxbXl5d0RnVWIxS0lGOWZQTUIyQWN2dEVuU2ExWGlR?=
 =?utf-8?B?RFNrOTRkc0lyeU5peW05TWY1TEQ0dnA1LytHamQzekVjSTJ4RklWVzVUTzAz?=
 =?utf-8?B?c2xiRlEwR0ZobERWdmpOOVVJdVRad2pObzYxVzJQaWNKL280U0Rqb2tGelh1?=
 =?utf-8?B?N09mOUdXcFhZVDF5L0xnck10RTFaM3doQ3B4aHlYdCs4alFvTU1UK3F6WDdv?=
 =?utf-8?B?aXRaNUM1ZDhRTXRLYlJKc3JBdUZ4Kyt4OWNTTUZvT3pvRWVTQWgvVEtpeFNz?=
 =?utf-8?B?ak8rQm93eTBMNHA2TVdrbGN6WVhDWkF4OE1wNUpnQUdxdXNMck90MHZnY1k4?=
 =?utf-8?B?d3dqbWl2MVdVMWhvRGFod1dOejZ4b3p0M29hL2dOU1pydllhYXZ3aXcvVjQ1?=
 =?utf-8?B?YW5HUFFscUNLakxiTHhaTTQ0YTdPTXlhMHp4RzNBN3B6V2grTU52dHRseXJl?=
 =?utf-8?B?UHkzZGRYMWVPSzZFa3BnNklvNHJsRXRsbFpWSzl4eVF5ZlFra0lCbkFDelBH?=
 =?utf-8?B?alZhdUREWFpZNldMd09WellZV080Z0xwTUM1a2tBbSsrM08vaXF2c2tHL0h2?=
 =?utf-8?B?YmNtcm1iaG0wYVIra0lzR3JhaHpYK1pWOVQ1bEthcWszRzBtMkZHQzVlMk9C?=
 =?utf-8?B?aldXZzVMcXF1MTJVcVVNMytCRkQ4YW5MQ2lZY1QrU3grV0xvakIrWSszRDM3?=
 =?utf-8?B?YVdzeUdSaWlYdEtGNGt2cytSc3p4WmZhV3JZUzZrODFBencyWWo3am1kK1hP?=
 =?utf-8?B?K2hHQmp6YURER3hyVjBGemdtS05KS0NLQXQyYlUwcUZLc0VNbExXa3FsQzE5?=
 =?utf-8?B?SWhBOWt0ZjJJUHlsNTY4ZHNZNU1wY0p2UWVHRXllMWlmb0dYelZQWVZtREJh?=
 =?utf-8?B?dFJTSm1LU2J1YitmS2xQaVpVK2VYSEt5eHBYRXJwR2FzVnJQSXd1a1JDS2pu?=
 =?utf-8?B?c2ppa0xOSE9DQU1seEtLVmFiR0tSL1NuUHRsbnpLS21idjZFbitBVWo1K3d4?=
 =?utf-8?B?T3pwZFFMUWc2N1NIeDdqaHVIakR1WDVCRzlKbkZaK1YvMm5lKzRGR29FeStL?=
 =?utf-8?B?eGI1eEhGbWl1dUJ6K1E0RUEvVW04RDBJcjZIb3g4Zy9RZFZ5MmVvaFdZR21N?=
 =?utf-8?B?dlFpWE5jUUxCc3EzMnd0SmRaN0FXSE5wL2plbVplZFJLMi93eXhHT0luZWtv?=
 =?utf-8?B?VnU4UEt3YkMrUlNiTXpoYmQ0SHRVb0ZWbmk2b09icjV1cGxOcWNGUUtJTU5C?=
 =?utf-8?B?bGlqVkgrbjRNbzR6NS9UL2VsYy9VbjJaa1RSMHJpYjR1RlIzK3c0YkttTm5V?=
 =?utf-8?B?R2E4dmxkNy9rc1VlVzFEcmU4c1gyUEYvN0RhODVrSkhGL25lMzlMQjlRQ201?=
 =?utf-8?B?L2o5dG5zcTU0RFA0S2t0OEFyMUZkVDFJMTlrSXpHeVUyY2xXMmM2UFIwUEx5?=
 =?utf-8?B?cDFXbm5rSWpDRmc1OWd0Y20wZm4zZmZ6YzJadk5KeTBBcUlwM0NDT2JRb2Z3?=
 =?utf-8?B?LzNnWGd0bXNoN3lNeGh4cFVMT0RlcC90WEZ3OWl6KzNvSkIvVHVzVnpzRHdr?=
 =?utf-8?B?dEVObnBqalVZV1VnbnhRZzNHbFF1dG1NSnZ4Ry9DbWQvbkdpekFJRWU4WGZP?=
 =?utf-8?B?WElvMUFrTm4yekNXa080QWhUM1dZSktTVkNlbGZ1SkkrdFJqbkZsMW1UUCtk?=
 =?utf-8?B?RURuQW9YdnQ1ME1VTUhpcW83ZktRSjZsaTVmUWw4UW9JUlJXdW1lejliVVRm?=
 =?utf-8?B?dlhqN09KcVdQZWVOSmcrektqbEFEMlBJY1J2Qmk3L29KV0ZyUDg3dzU4eWZQ?=
 =?utf-8?B?c29aSmp1ZndiREFyMnNtNVc2d2dXTEhQN0s2Y1ZKQWMrME90cGhSOVVhODJP?=
 =?utf-8?B?N3BHcEZnWHlldHUvd2ZvS0tQbEM3RVB5SUdkUW9IRW5FYzNWcGNzdHR2dkpx?=
 =?utf-8?Q?7eZw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1pjb2tjSXpRajl1MzlzMGwvNVpIbVdXVUoreWZLZTFIQTU0U1h3Ympjdm5S?=
 =?utf-8?B?OHRnNThLL1U2UVNFMnN0WkthUDlGVXBvcFhaeGw0UkR3YU1SYjgwWGI0NnlY?=
 =?utf-8?B?bVFwRytndGtHS1FXTkN4TWczcGU2a2tkN1l4Q00rZURPSlhOazVoWnRMSEwy?=
 =?utf-8?B?MlBkOGRDdFdKdkhuN291OWpjS1dlMHdTK2o3K3BySTVhdVZFbWdTRkg4VG9P?=
 =?utf-8?B?NCtUekdhQjUrbENFWGdLRkNCbTFvK211WERGVnl1bUl2eEE4RnNuL1A3UmI3?=
 =?utf-8?B?bzVxeFdwOUFUcFpnL1ptcjNMOU1rT0RVeEp6ekNrRVZsMDE1L0ZrazNRR3Bq?=
 =?utf-8?B?U1FrNUJUbTJaSjB1ajkvaXk4cllRUGdQOXVSTWZVTXo0NDV4a3czVDEzZ3dq?=
 =?utf-8?B?OWZLaFJUcDB3My96dXVrY2tCazR4V0pVUmFMeTdjV2dwaThjYkhVU3lYRFJZ?=
 =?utf-8?B?TSt2aXJTd1dHaTFCc0dCa3phZWRLWUJxN1B0TzBFUWpHVGxtWEtFMkpZVEdN?=
 =?utf-8?B?djV5bmFULzBMYjk5V1ZvcGhXaFJvZlF6ZDRXcit1WHorZG9MRGVkWFpCR3NI?=
 =?utf-8?B?azU4bHZQODFiMFRsQ2c5K3JqQmhjZjVGeXdVOHZLR2ZEUmZIaXQ3bmI2aHBI?=
 =?utf-8?B?cGdia1hhV3dqVEpJM2FNZXVjS2N2cWVJbjlPMlF3dXgzZ2VCdzNaL3lxeUJH?=
 =?utf-8?B?ZjhhbSs1dFF3emVDL1VXc1VsaWV2dkg0dHZUbnd3WnVCZ2h0cnRhR3NjOFdq?=
 =?utf-8?B?aTlKY3hVUkFCWkJ4T3U4SXlHU3l6M2tGL2Q1Tk1wTUtseEVKalpObmp6V3Ro?=
 =?utf-8?B?WUZaMmZoamFhWk1pZVdMOTlUL0VTTWY3U0JPMDhxeXZSZGFzejdNSHVOYzZo?=
 =?utf-8?B?K3U0WVJhOW1vbUpuRmdqc092bmNTdGx1S3VpMGtRSTZqUlhZL29xT1JZL1NT?=
 =?utf-8?B?dkkzYWJmbkczM1kwMGsveDBWTmpCVHg3MkFCS1hSRkVxZGszclJpM3E2ZVFq?=
 =?utf-8?B?MmUzMFBmYXRmajBWSWhlUlJwVlhrV0d2RDl4REFyMGNZaWxLNVVmd1RySzRu?=
 =?utf-8?B?ZFZsRndXYUJBcDl0NWhTN0FBUUh6TmI0TkV5RWNxdllPZCtILzJLdkFuYkk5?=
 =?utf-8?B?cERqUWZnTFpIS2gzTnV1aUkxSEdEbkNlZnhGWkJyRnI1RTVTNWcvWDQvTUNW?=
 =?utf-8?B?UWZHZzdMbms3M3paSEtRY0U2SHpsck9STi9QMTREUVJLRXovMFJ4NzNoL0lR?=
 =?utf-8?B?dlJUTS9iVUJpS0xWUnRTbnlBYWhPektwSEZmSHlVTmFKVG5YY2lnWCt0VkhF?=
 =?utf-8?B?eEdmTHZYQUo1YWRsSEdWWStObS9Ed1kzb1ZoZjVLai9DZGVWdVZWWU9OV1Ey?=
 =?utf-8?B?Slk1WnZjWFgzS3VqaGp3UFk1UjNDVGRDVlJEd2lpVlhkd3M2RGo2bGsrM0or?=
 =?utf-8?B?cUprMis2Y0o1Uk11VnhvSUxaS25RaHJzcmVVVjRaK3lHTmpQMVlxK2ZDNnk0?=
 =?utf-8?B?d1luSklyc0lML2NwWlR4amRyeVplUkVsWVNkV1p2NE10Q0QxOEZ3anN0cGNU?=
 =?utf-8?B?TERIMUZiMzV4cTBNbHJWZmUzVUticXZoZjI5SXhSdTB5Vll3emhFOWRacDF2?=
 =?utf-8?B?RzJ6L2tWcmJESDhRLzRPVWZzbGkrR2dmL2o1dFcxU1RiLzhaMTBacWc0SjQ3?=
 =?utf-8?B?UnlBV3ZRaUhhMnlvdm4rMnAyUTBJUmI4b2R5Y3VXeGNPenFqcTRxQ3pBKzhU?=
 =?utf-8?B?eUN4NkNzZnIzL0M5aTBYdE5aUTF0eGRuM05VY2hpNHUrY3J2aVBqNWNhVXJP?=
 =?utf-8?B?bWp6eFRiUTgrZEFreGtxWnZLUEI1ZHNPcGgydjFYZS9ITVNac1B3eGQzV3Nu?=
 =?utf-8?B?dXloaGF2SkpnRjY2djJrc3FmUjJTT2NxdHdIN1BKcE8yN0t0a1hIOGFHa24z?=
 =?utf-8?B?T0FBQzEwUTFxWHhnQVlOSXA0UVpuTU5Ncy8wOFFkamh3aDV4Z1NQSmlEZWl1?=
 =?utf-8?B?aTJ4OEEyZXh3TDZJbXI4R2trWmRObHBtMlpJTkc3Mzd5OU5GYVNGcXVqTEc2?=
 =?utf-8?B?OFZ4UHR1VytmV1lURGhYWDVPdGVOby82b1hvS3NuaTRVREJWR3FZM2pjWVJP?=
 =?utf-8?B?d0FiMFBYUzVUVWdyYURDM3Z1NWhOSndHb2YzUnZ0dERzdVM1UlU4dHl2RnhL?=
 =?utf-8?B?Yk9hOVFTc1hmNDMyd0Z0aHhkbWNZNmZwV2U2aVJ5VUdmV3gyNFJ3M3FmN3I2?=
 =?utf-8?B?RFJYS0ZveC9Fc1pPcFFUSGdTT0NIQnZwWFpGUDBvZy9oVmVBamQvejg4UVhI?=
 =?utf-8?B?Wi9oS0pHamV6YjhWU0JsNHBTR1l1OE5TR1dsRnlKM2lxeVltTDFaUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45e83cb6-a2db-4215-0f7f-08de696699d0
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 12:10:52.2909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WTkAjkq+NF+nDh7BNrJGTXM1fz3MYIGXi8ONCeROX796YZCTFwx0gELSOHehXHIMZJmqBHcbXoJm4zjF2MDXBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5172
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


On 2/11/2026 12:18, Marcin Bernatowicz wrote:
> Add generic helpers for controlling PCI driver binding via sysfs.
>
> The new APIs provide driver- and device-centric primitives for:
>    - setting and clearing driver_override
>    - triggering PCI driver reprobe
>    - binding and unbinding devices to a specific PCI driver
>    - query the currently bound PCI driver
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
> v3:
> - clarify igt_pci_get_bound_driver_name() doc that driver/driver_len
>    are optional (NULL/0 valid when only checking bound/unbound) (Lukasz)
>
> v2:
> - Add igt_pci_get_bound_driver_name() to query the currently bound PCI
>    driver via the /sys/bus/pci/devices/<BDF>/driver symlink.
> - Extend igt_pci_bind_driver_override() and
>    igt_pci_unbind_driver_override()
>    with a timeout_ms parameter so callers can wait for bind/unbind to
>    actually complete, instead of relying on drivers_probe write success.
>
> ---
>   lib/igt_pci.c | 354 ++++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_pci.h |  13 +-
>   2 files changed, 366 insertions(+), 1 deletion(-)
>
> diff --git a/lib/igt_pci.c b/lib/igt_pci.c
> index 61aaf939d..b63550b39 100644
> --- a/lib/igt_pci.c
> +++ b/lib/igt_pci.c
> @@ -3,9 +3,18 @@
>    * Copyright © 2022 Intel Corporation
>    */
>   
> +#include <ctype.h>
> +#include <dirent.h>
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <limits.h>
> +#include <string.h>
> +#include <unistd.h>
>   #include <pciaccess.h>
> +#include "igt_aux.h"
>   #include "igt_core.h"
>   #include "igt_pci.h"
> +#include "igt_sysfs.h"
>   
>   static int find_pci_cap_offset_at(struct pci_device *dev, enum pci_cap_id cap_id,
>   				  int start_offset)
> @@ -51,3 +60,348 @@ int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id cap_id)
>   {
>   	return find_pci_cap_offset_at(dev, cap_id, PCI_CAPS_START);
>   }
> +
> +static int open_pci_driver_dir(const char *driver)
> +{
> +	char path[PATH_MAX];
> +
> +	snprintf(path, sizeof(path), "/sys/bus/pci/drivers/%s", driver);
> +	return open(path, O_RDONLY | O_CLOEXEC);
> +}
> +
> +/**
> + * igt_pci_device_unbind:
> + * @pci_slot: BDF like "0000:01:00.0"
> + *
> + * Unbind @pci_slot from its currently bound driver, if any.
> + * Returns 0 on success, or a negative errno-like value.
> + */
> +int igt_pci_device_unbind(const char *pci_slot)
> +{
> +	char path[PATH_MAX];
> +	int dirfd;
> +	int ret;
> +
> +	snprintf(path, sizeof(path), "/sys/bus/pci/devices/%s/driver", pci_slot);
> +	dirfd = open(path, O_RDONLY | O_CLOEXEC);
> +	if (dirfd < 0)
> +		return 0; /* already unbound */
> +
> +	ret = igt_sysfs_set(dirfd, "unbind", pci_slot) ? 0 : -errno;
> +	close(dirfd);
> +
> +	return ret;
> +}
> +
> +/**
> + * igt_pci_driver_bind:
> + * @driver: PCI driver name under /sys/bus/pci/drivers/<driver>
> + * @pci_slot: device to bind
> + *
> + * Bind @pci_slot to @driver. Driver must be present/loaded.
> + * Returns 0 on success, or a negative errno-like value.
> + */
> +int igt_pci_driver_bind(const char *driver, const char *pci_slot)
> +{
> +	int dirfd, ret;
> +
> +	dirfd = open_pci_driver_dir(driver);
> +	if (dirfd < 0)
> +		return -errno;
> +
> +	ret = igt_sysfs_set(dirfd, "bind", pci_slot) ? 0 : -errno;
> +	close(dirfd);
> +
> +	return ret;
> +}
> +
> +/**
> + * igt_pci_driver_unbind:
> + * @driver: PCI driver name
> + * @pci_slot: device to unbind
> + *
> + * Unbind @pci_slot from @driver.
> + * Returns 0 on success, or a negative errno-like value.
> + */
> +int igt_pci_driver_unbind(const char *driver, const char *pci_slot)
> +{
> +	int dirfd, ret;
> +
> +	dirfd = open_pci_driver_dir(driver);
> +	if (dirfd < 0)
> +		return -errno;
> +
> +	ret = igt_sysfs_set(dirfd, "unbind", pci_slot) ? 0 : -errno;
> +	close(dirfd);
> +
> +	return ret;
> +}
> +
> +/**
> + * igt_pci_driver_unbind_all:
> + * @driver: PCI driver name
> + *
> + * Unbind all devices currently bound to @driver.
> + * Returns 0 on success, or a negative errno-like value.
> + */
> +int igt_pci_driver_unbind_all(const char *driver)
> +{
> +	char path[PATH_MAX];
> +	DIR *dir;
> +	struct dirent *de;
> +	int driver_fd;
> +
> +	snprintf(path, sizeof(path), "/sys/bus/pci/drivers/%s", driver);
> +	dir = opendir(path);
> +	if (!dir)
> +		return -errno;
> +
> +	driver_fd = dirfd(dir);
> +
> +	while ((de = readdir(dir))) {
> +		bool ok;
> +
> +		/* BDF symlinks are like "0000:01:00.0" and start with digit */
> +		if (de->d_type != DT_LNK || !isdigit(de->d_name[0]))
> +			continue;
> +
> +		ok = igt_sysfs_set(driver_fd, "unbind", de->d_name);
> +		if (!ok) {
> +			int err = -errno;
> +
> +			closedir(dir);
> +			return err;
> +		}
> +	}
> +
> +	closedir(dir);
> +	return 0;
> +}
> +
> +/**
> + * igt_pci_set_driver_override:
> + * @pci_slot: PCI device BDF (e.g. "0000:01:00.0")
> + * @driver: PCI driver name to force-bind (e.g. "xe-vfio-pci"), or
> + *          NULL / empty string to clear an existing override
> + *
> + * Set or clear the PCI driver_override for @pci_slot via sysfs.
> + *
> + * This does not trigger driver reprobe by itself. Call
> + * igt_pci_probe_drivers() afterwards to apply the override.
> + *
> + * Returns: 0 on success, negative errno on failure.
> + */
> +int igt_pci_set_driver_override(const char *pci_slot, const char *driver)
> +{
> +	char devpath[PATH_MAX];
> +	int dev;
> +	bool ok;
> +
> +	snprintf(devpath, sizeof(devpath), "/sys/bus/pci/devices/%s", pci_slot);
> +	dev = open(devpath, O_DIRECTORY | O_RDONLY);
> +	if (dev < 0)
> +		return -errno;
> +
> +	ok = igt_sysfs_set(dev, "driver_override", driver ? driver : "");
> +	close(dev);
> +
> +	return ok ? 0 : -errno;
> +}
> +
> +/**
> + * igt_pci_probe_drivers:
> + * @pci_slot: PCI device BDF (e.g. "0000:01:00.0")
> + *
> + * Trigger PCI driver reprobe for @pci_slot by writing to
> + * /sys/bus/pci/drivers_probe.
> + *
> + * This causes the kernel to attempt binding the device, honoring any
> + * driver_override previously set.
> + *
> + * Note: a successful write only means the reprobe request was accepted.
> + * It does not guarantee that a driver actually bound to the device.
> + *
> + * Returns: 0 on success, negative errno on failure.
> + */
> +int igt_pci_probe_drivers(const char *pci_slot)
> +{
> +	int pci;
> +	bool ok;
> +
> +	pci = open("/sys/bus/pci", O_DIRECTORY | O_RDONLY);
> +	if (pci < 0)
> +		return -errno;
> +
> +	ok = igt_sysfs_set(pci, "drivers_probe", pci_slot);
> +	close(pci);
> +
> +	return ok ? 0 : -errno;
> +}
> +
> +/**
> + * igt_pci_get_bound_driver_name:
> + * @pci_slot: PCI device BDF (e.g. "0000:01:00.0")
> + * @driver: destination buffer for the bound driver name
> + * @driver_len: size of @driver in bytes (may be 0 if @driver is NULL)
> + *
> + * Read the currently bound PCI driver name for @pci_slot by inspecting the
> + * /sys/bus/pci/devices/<BDF>/driver symlink.
> + *
> + * @driver/@driver_len are optional. Callers may pass NULL and/or 0 when they
> + * only need the bound/unbound status and do not care about the driver name.
> + *
> + * Return values:
> + *  1: device is bound and @driver contains the driver name
> + *  0: device is unbound (no driver symlink)
> + * <0: negative errno-like value on error
> + */
> +int igt_pci_get_bound_driver_name(const char *pci_slot, char *driver, size_t driver_len)
> +{
> +	char path[PATH_MAX];
> +	char link[PATH_MAX];
> +	const char *base;
> +	ssize_t len;
> +
> +	if (driver && driver_len)
> +		driver[0] = '\0';
> +
> +	snprintf(path, sizeof(path), "/sys/bus/pci/devices/%s/driver", pci_slot);
> +	len = readlink(path, link, sizeof(link) - 1);
> +	if (len < 0) {
> +		if (errno == ENOENT)
> +			return 0; /* unbound */
> +
> +		return -errno;
> +	}
> +
> +	link[len] = '\0';
> +	base = strrchr(link, '/');
> +	base = base ? base + 1 : link;
> +
> +	if (driver && driver_len)
> +		snprintf(driver, driver_len, "%s", base);
> +
> +	return 1;
> +}
> +
> +/**
> + * igt_pci_bind_driver_override:
> + * @pci_slot: PCI device BDF (e.g. "0000:01:00.0")
> + * @driver: PCI driver name to bind (must not be NULL or empty)
> + * @timeout_ms: how long to wait for the device to become bound.
> + *              If 0, don't wait (best-effort immediate check only).
> + *
> + * Bind @pci_slot to @driver using the driver_override mechanism.
> + *
> + * This helper sets driver_override and immediately triggers driver
> + * reprobe so that the device is bound to the requested driver.
> + *
> + * Returns: 0 on success, negative errno-like value on failure.
> + * A reprobe request can be accepted by sysfs while the driver probe
> + * fails later; this helper verifies the device ended up bound.
> + *
> + * On bind failure, returns a negative error and the failure reason may
> + * also be logged to dmesg by the kernel driver.
> + */
> +int igt_pci_bind_driver_override(const char *pci_slot, const char *driver,
> +				 unsigned int timeout_ms)
> +{
> +	int ret;
> +	char bound[64];
> +	int bound_ret;
> +	bool bound_ok;
> +
> +	if (!driver || !driver[0])
> +		return -EINVAL;
> +
> +	ret = igt_pci_set_driver_override(pci_slot, driver);
> +	if (ret)
> +		return ret;
> +
> +	ret = igt_pci_probe_drivers(pci_slot);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Writing to drivers_probe only tells us the kernel accepted the request.
> +	 * The actual driver probe may still fail (and only be reported via dmesg).
> +	 * Verify that the device ended up bound to the requested driver.
> +	 */
> +	bound_ret = igt_pci_get_bound_driver_name(pci_slot, bound, sizeof(bound));
> +	if (bound_ret < 0)
> +		return bound_ret;
> +
> +	if (timeout_ms == 0) {
> +		/*
> +		 * No waiting requested. If the device is already bound, validate
> +		 * it is bound to the expected driver; otherwise treat as
> +		 * best-effort request-only success.
> +		 */
> +		if (bound_ret > 0 && strcmp(bound, driver))
> +			return -EBUSY;
> +
> +		return 0;
> +	}
> +
> +	bound_ok = igt_wait((bound_ret =
> +			     igt_pci_get_bound_driver_name(pci_slot, bound, sizeof(bound))) != 0,
> +			    timeout_ms, 1);
> +	if (!bound_ok)
> +		return -EIO;
> +
> +	if (bound_ret < 0)
> +		return bound_ret;
> +
> +	if (strcmp(bound, driver))
> +		return -EBUSY;
> +
> +	return 0;
> +}
> +
> +/**
> + * igt_pci_unbind_driver_override:
> + * @pci_slot: PCI device BDF (e.g. "0000:01:00.0")
> + * @timeout_ms: how long to wait for the device to become unbound.
> + *              If 0, don't wait (best-effort immediate check only).
> + *
> + * Unbind @pci_slot from its currently bound driver (if any) and clear
> + * any driver_override setting.
> + *
> + * This is the inverse operation of igt_pci_bind_driver_override().
> + *
> + * Returns: 0 on success, negative errno on failure.
> + */
> +int igt_pci_unbind_driver_override(const char *pci_slot, unsigned int timeout_ms)
> +{
> +	int ret;
> +	int bound_ret;
> +	char bound[64];
> +	bool unbound_ok;
> +
> +	ret = igt_pci_device_unbind(pci_slot);
> +	if (ret)
> +		return ret;
> +
> +	ret = igt_pci_set_driver_override(pci_slot, "");
> +	if (ret)
> +		return ret;
> +
> +	bound_ret = igt_pci_get_bound_driver_name(pci_slot, bound, sizeof(bound));
> +	if (bound_ret < 0)
> +		return bound_ret;
> +
> +	if (timeout_ms == 0)
> +		return 0;
> +
> +	/* Verify the device actually ends up unbound (driver symlink removed). */
> +	unbound_ok = igt_wait((bound_ret =
> +			       igt_pci_get_bound_driver_name(pci_slot, bound, sizeof(bound))) == 0,
> +			      timeout_ms, 1);
> +	if (!unbound_ok)
> +		return -EBUSY;
> +
> +	if (bound_ret < 0)
> +		return bound_ret;
> +
> +	return 0;
> +}
> diff --git a/lib/igt_pci.h b/lib/igt_pci.h
> index 84355e9dd..509345b2d 100644
> --- a/lib/igt_pci.h
> +++ b/lib/igt_pci.h
> @@ -6,8 +6,9 @@
>   #ifndef __IGT_PCI_H__
>   #define __IGT_PCI_H__
>   
> -#include <stdint.h>
>   #include <endian.h>
> +#include <stddef.h>
> +#include <stdint.h>
>   
>   /* forward declaration */
>   struct pci_device;
> @@ -26,5 +27,15 @@ enum pci_cap_id {
>   #define  PCI_SLOT_PWR_CTRL_PRESENT (1 << 1)
>   
>   int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id cap_id);
> +int igt_pci_device_unbind(const char *pci_slot);
> +int igt_pci_driver_bind(const char *driver, const char *pci_slot);
> +int igt_pci_driver_unbind(const char *driver, const char *pci_slot);
> +int igt_pci_driver_unbind_all(const char *driver);
> +int igt_pci_set_driver_override(const char *pci_slot, const char *driver);
> +int igt_pci_probe_drivers(const char *pci_slot);
> +int igt_pci_get_bound_driver_name(const char *pci_slot, char *driver, size_t driver_len);
> +int igt_pci_bind_driver_override(const char *pci_slot, const char *driver,
> +				 unsigned int timeout_ms);
> +int igt_pci_unbind_driver_override(const char *pci_slot, unsigned int timeout_ms);
>   
>   #endif
