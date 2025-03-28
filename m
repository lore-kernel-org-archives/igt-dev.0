Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D980C28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 11:57:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF71810E9F3;
	Fri, 28 Mar 2025 11:57:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l9bKT61+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2861B10E9F3
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 11:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743163024; x=1774699024;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jIZ5Eqd5RXwyQTeSmYZY3ESAy3aKU24SLVXbzaBDHXU=;
 b=l9bKT61+kCTz6Mhhzod0Qir086GnAqbgkx0UAG2JJi0OtmUkYdehVawe
 saWyXysrXNVSO6k9366FdogjFDZT2Ax2gRHNmZT0lzqpkvt+S2yJ0eCio
 OCcWeCnAP3w+BA5IhHL9WQXHili3kCRq81g8PfUiqdrb0H3ymVIR9lMrH
 wuaSKM+4S9I51tj/ykw/oQahgU3eiaQBzdnfpPhCSPure8zexfnqgYYyE
 omyb+z7MsuM0YOtefylHoIKqcHowyrDOfb0W2vRgf/kOwWNDI2FU58Aa8
 HTGN3YCxSIL2jmecLToSxPzU7ap3mWh+axjVO7pZiLDeNyW7oK+rwoqZP w==;
X-CSE-ConnectionGUID: 2rN9+NvmQpKLREcdBF0Y5g==
X-CSE-MsgGUID: huhQkWycSba8Du1nfaB4Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43676164"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="43676164"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 04:57:04 -0700
X-CSE-ConnectionGUID: lxUf5ZNRTnes2p4RfXH7zg==
X-CSE-MsgGUID: N8pGzBoHRYyx64lFfSm0FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="125193713"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 04:57:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 28 Mar 2025 04:57:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Mar 2025 04:57:03 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 04:57:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+VfDhJjmnDfvtF3QngxiUPXDT+8mpnLtGjjb/MaJZOe9WSwcO+r33y29JpF5lwtfSgYh+l/lAnZQ5jXXUIBoikj6wW7rkqQmhOwZ/rLVtFH1DOjbWvv17FD7SXBcSYN4bZirNQAo1+Gn5VVZzU0Njj0zptqegQEVGyQT/ZguFEcJ3q8xlK1SoPRgFOod9/UTqTrhqUMc4g9N0KaHlbGPW0es3VpYUZxRnEIFRd1x/xfi1WiKvqcw6nrZifFt650SgmCvU+W2P5hEuma8749SiM5uNkFjgB2JEC/x7CKXD6r8UXr18t1c7aaH1zXXDdkYW/bXQBCQJ+Z5+GhxrcXOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Bc9clLBvCb92mipR8N+LYhBwZz1EbFd/izdgWw65BM=;
 b=xQGv5QXfWBukZ69PvIjQsC82PCocOp+SMFqZUUlRBRf67PIwzYl4OhS1vBM+4+/m+PFocrl82XRZoRO/9vFWPXqI0CIipdlygPmYCDGmHIXyIkQ1ylljuZU12uHcXz54auSYzhMLVkckrkGgsWR58VV0lzZ81kmPYQl2EnOuqynfbDbSF7frnbqX9zfPLbSeaTTgmUIu/2Lw/+QteDxKuHQZnNUe0Zd13W4NVkDbD9YeG2xONmO2eYSpDOO6Ag8j1G1DvoACojh+rSYV2p/XgpAQQ4khQ24hr6TZtttywrAdJcRieAOyQSBm7oHDQS7L8ItqjrMk38DQXGgH72l6lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by SA0PR11MB4560.namprd11.prod.outlook.com (2603:10b6:806:93::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 11:56:47 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 11:56:47 +0000
Message-ID: <cccc6bc2-6a7b-48af-af35-bcd7c39f955a@intel.com>
Date: Fri, 28 Mar 2025 12:56:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] intel-ci/meson.build: Add missing
 xe-sriov-vm.blocklist.txt
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20250327170925.705874-1-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20250327170925.705874-1-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::26) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|SA0PR11MB4560:EE_
X-MS-Office365-Filtering-Correlation-Id: 26e98de4-b61f-447e-fa34-08dd6def9e06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEJKb2RVbTRVdWtxOGdtVXEwajhMY09yOHBlMEpYOVovWWxPMDAzN3UxZzBR?=
 =?utf-8?B?YU9rMkdwbGF5YVpjcmdTUzFKZ3NZOTJpM0t2VmVoak41bDBZS3dhcVRHR29s?=
 =?utf-8?B?Z0N4dENUZCtldFFYcHlFbXhzWTdHSDJ3VkxrVldXWXc5d3liODRqd1FTaVhW?=
 =?utf-8?B?WXNzejA5dmQ4V3E4ZkJmQXFnNVRqT0pUTmZXZTJVWmwwUDNSMUUzeVMyQjBO?=
 =?utf-8?B?WGJBekpYdXlnU1BaUzJwTlVWalYzTEtUNk9VK25oVk03aHp4NUIya0k1cWhO?=
 =?utf-8?B?SjdIZWJOOXd4aWRPSjhhRzkzMzhmclliKzRBaUhlTkZHZTdlWmx3WjE0WFZh?=
 =?utf-8?B?RlRMUGNoYlpUcEtOK28yb2RVNFo5UmRob2NOb1pXekVHMlQybU5oblB3YmN0?=
 =?utf-8?B?akRTZkN3ZlJwbVZvbi9CbzZXSkk3aVcyVEhsMjl1ZTJ5QVZNQkdONjExTktj?=
 =?utf-8?B?VFI2OVV5WERUZWI5N0tCaVZQRHVUbWIrODd6eHZrYW43OC9pTmlsSWF3Wk03?=
 =?utf-8?B?akl6L3hTZVVteXpIV2xqVllKYmdTWlVURXpVN1Q2QW1TcE5VN0xoYXpxdzdM?=
 =?utf-8?B?b2pvMy8wTkYxaXdZRlZoMm1Ta1J4Wk9qL1VhQ3cwV0VHUmdveVVIb3UzM2dP?=
 =?utf-8?B?bXFacmJldHlPRzE4akhSQUpwb28zaElaQXdad1pCcHFoNmZIckNXbDNuTFl4?=
 =?utf-8?B?RG5NSDN3Z1pPN0FNYytlblZGNWJqNEJRazI4Z29VTGlqSjFJQzdrY1FqNEJI?=
 =?utf-8?B?SHJPM1dKNUF2eE9Jc0JFUnpqT2RnWjl5cHgrVEtoNXR5aEJxR3dYbDdCdFNa?=
 =?utf-8?B?ZW9RNms1V2I0SzVzY0N5QjJGbVNmbzVQZXRjU0NBb1BodUdFdUZRWEtKbWgv?=
 =?utf-8?B?a09nSEVWeWoveTRQNlBzbzB6eFJpSkpEWVQ0QUt0Nm1vK1Mrc3dKMnhGZ1JI?=
 =?utf-8?B?TW9NY0VYeU8zVjYvVVJtaUplNmJ0RFMwNG9CRmZ5aDI1a3Nib1BDekY4MDVl?=
 =?utf-8?B?TjlGeG9WTEZUcVdaaklLZnI1U2MreC9qL3lGRGJLZnMzVzFzdzloOFdVRGxo?=
 =?utf-8?B?U3ozcm53ckxTV0ZRQzFySmNrVnNweUNkYVNrajgveUc0cStkNkNmMFkzYitm?=
 =?utf-8?B?N0ZBZnY2UnF6ZmF3RkJHZHlwWjFLQ0Y1T2c2SllQQ05CeU9lK0NQYnhQc2FS?=
 =?utf-8?B?UHQxYXB0RklKR1JBckhyZ0JxTW82d1A4b3p5T2VlZGpzdmFsWDV3UGRxRGM4?=
 =?utf-8?B?N2pFRlhrVExwMmsvKzlGalNHNmJtTktpa0VMQlVEc0VWQTk4R2RYaXFNMDVi?=
 =?utf-8?B?ZUExbGFHNzk1L2Q0RGorNXozbUE2R3JIeWkzV2FhZCtBelBaTERmZ2hHNUpR?=
 =?utf-8?B?RUV3WEt4WjJFMWtzdVNReUVtYW4zTkhrOC9iNkN2S2lrYTBKNFNJOVFtWStX?=
 =?utf-8?B?ejdoOWE4UklYOFJ3eFVmOWt4blBrVkNxZTNuQXdad1REUkl3UzJZRlQ2anlU?=
 =?utf-8?B?M0xLMTlxamlLY0VXYVhKT1FweUdVVWQwTm9naDhkYzZXN3ZVa21CYTJVTnBW?=
 =?utf-8?B?bk5odTE4M2ZRenNtOVMwUGNJaEVldjA5SVB3Tk5KVFA4eitrclN2VlhLNEJu?=
 =?utf-8?B?SmI1QzBhWE00Q1hTbTlGMVVjYU1jd2tHTk5leHJxY3l6VjA3NFlFanUzU05H?=
 =?utf-8?B?VklQRmlOTzZoQ3BHTXVZWDRKRWN6bEsrOXN4bTBzQlF5eGlZbXpUWndyZGho?=
 =?utf-8?B?d3FlVTE3T1hGSGtMVnFzVmdMbkxpdTl3c3Q5b1hJQjdVbEpGZ2FhSHpPT09j?=
 =?utf-8?B?S3hRUWZWTFc1eHpzdU10by9ZNVhBcWlGVGZaTWFHV2hud0g0dXNDRUI0NXVa?=
 =?utf-8?Q?VW0J4tYobzohJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkpoR2pVSDBDYlRlWGgxY0E0bkk4OGJJalpBTkhpRXlpcEdRQzBsR0ZNZEhk?=
 =?utf-8?B?V2RyOTQvYlJkekhiMG1HdVA3cWN4a280VG5pWHI4QU5xQ2pDVy9UVVRqcWJy?=
 =?utf-8?B?ZGlEUTRwcjluSDh0YU9BampobjFKSXVEU3Y3T282alArMjdQUXBDTlltRkZp?=
 =?utf-8?B?WDY2N2ZDOWtLdGgxUXpPeTNhQ3llU25qbmN6QVhBZDlqQ3B3djFBZUV4UHdU?=
 =?utf-8?B?cWFIMTliVGFHK3FqeFllQzVRZzJYV3BLeVZaNXBWcFJkSG9jRnhyT0pmM3Zp?=
 =?utf-8?B?K2lpMWFaRWN6cHljamZwQnc5ZU9yZkZIdXhuOE9RZFlpZTFldnJiRkNDV0hS?=
 =?utf-8?B?UTNqQjFIU2FJTWdTZHhEdFIyalAzODlJaUpZUVcybElTanBxYUVSWWF0T0xG?=
 =?utf-8?B?VHFrN2lJdVNDbFR4cEwxaklNd1FyTVNZS29vVEFJOUpTdkhpalBKUXB3ajNQ?=
 =?utf-8?B?dVYxZUF5VWhqVEdUemQ1Y2ZFaG8rYXhYeDR6dkEvUjVseTVYN21VcXRneVo1?=
 =?utf-8?B?VDJGRklJbDlqeDJFVVQrQUVSMGh5c0Zaa0d1bURpNjFDQUpqeEpJK1NiZDFh?=
 =?utf-8?B?T3l6TU1NTXN0RytEMUJmNUFlaXlKSWhKUXJDdXhaZVRObXl4aUx4MmdLY3Fh?=
 =?utf-8?B?MVFMUmJLOUdzNUZ2ZUJ5YkgyRWVpUldRNGNiZmVtdXJaZ3Jlc1N5emc2a205?=
 =?utf-8?B?RTQrTWlac0NCRWhVSndoajArTm53QlhBTS9VU3lRUi9rcFJTcTdwMVFJRlNF?=
 =?utf-8?B?WVRxZ0NTZVNDU1BZNDBOVEhhRTN2a0JRb1owRTFLUzhteUozQU9raHNpVWJU?=
 =?utf-8?B?QkthYURhQmpSVnROdmZJYzlQUVVwdDZ5RGlHODIvbjZtUHlLbUN5c2pWQTVa?=
 =?utf-8?B?Mk85UkpPZ1JKN25KVDRzV201VjJKY1V4N09DSU1oekt0ZkNkQWk4UzEzODB5?=
 =?utf-8?B?Z09hWjBqdWNXa2djd28zWDQ0RmljcGhVWEMzMFpjcjRXNDZ0NXNJZkgwd1hG?=
 =?utf-8?B?T250OEJlQlc3Z3ZtNXYyVktiRzlvVHZaeHZYY216UzJuVzlZVG9aNVlldGov?=
 =?utf-8?B?SzlQTEowUzQzK1duaitLNFY2NXR6dG8xblZkTUZkaWVzQkZOM0FHU1c0WE5x?=
 =?utf-8?B?cy95OEpnOG9VZ293YjNYTXB3bnBKVDhtMFdlUkNpZWFnYUpTbkFnMWVTR1Fj?=
 =?utf-8?B?K0hlc01ZbXRBcjQ1bU1ZaUJ4dGdzbThSdWVHQzI3bDRsYldVKzdYR0IvS1Z1?=
 =?utf-8?B?K3pEUmJ4K3ZibjBjb3hSeGdiWmJCQTRubm1PNjZHTEE5VWo4NXpEc3BYeEVC?=
 =?utf-8?B?TDN5K3d2b2ZJWGZ1cTErTjBpQmpXMkNURlE3OVpBYVBSQ2ZZdnVFSW55Y3Fq?=
 =?utf-8?B?WlVUWEpuTkdEaUtOOFBscngrVnQ2SU5rYWs2dnl0TTFrQlBsa2VkdjByUDMw?=
 =?utf-8?B?emg3ZVBzRWd5ckNjMGNtQ05FNjlRTFJPV011ZHljL0I5N1RxV1hrL0Nub0da?=
 =?utf-8?B?c00yenh4MXNNSXE5K2VNcHAzSXRjVEhuVGExMmZ1Y2pEK3craTNmQnE5UGNm?=
 =?utf-8?B?ZkZPeUVuL3luVU5WOEtBbUpqNzY2UDd5d2xDQnJYNklSWkpRVVNUSWNldkJB?=
 =?utf-8?B?RUlMdlFESWdLSExkdFBITUcrVFQrZmg3dWk4QjN2WFNiT25RczE0M283WEN4?=
 =?utf-8?B?RitYV0hDVDJ0QjFjVDU5MHRDbW5OSkZkUFMzbnB1SVUxS2FtdlpQcThqY25Y?=
 =?utf-8?B?bGdDaVFqeFd1S2ZFdTdwekYrRWI4YXo2QThELzF4VG5yM1luSWlVN3dBZ0xZ?=
 =?utf-8?B?SmZJV1VPL1A2Tkc2OEUvV0s2U2t3SEZNektRMXZubnpGRHNKZmcyeGpld0tm?=
 =?utf-8?B?SGZ1U2xLR2tveTlPbGYvTWhKNDZUWjBvVEtiMmFaeWtjelJaNXdNV1lTTHlT?=
 =?utf-8?B?alVkQkJqdC9Oay9xM05KaHdoVVFObzBKWFFrZytscHhwekJpemNjbkdDZ0g2?=
 =?utf-8?B?U1ZsM2JRMy9ncmVIUDJvdGYxbVAzMTdYVGwxWDh2eXJaN2ZPQUY4TThZL0x6?=
 =?utf-8?B?MzB1UU9nM2syVEpCTm5wMDZFZHhaY1U2TTR5OTBMb2d6N2V2NEV2UUVwVGM2?=
 =?utf-8?B?UGxnSnNmYzA4VGFDVmh1R3dRNGwrU1lNci9jMEVMd05LUEdsaUxKa0pldXpV?=
 =?utf-8?B?MEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e98de4-b61f-447e-fa34-08dd6def9e06
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 11:56:47.5029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p5aqJk4zIwOkTfq/at01Ihl3SYdUOJ4RnOVKAp1Sani/YLwWuUzs8A5L4ZDlEPmMElbLr3eTotZBL8j7oaAWjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4560
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

On 3/27/2025 18:09, Marcin Bernatowicz wrote:
> Add the missing blocklist file so it can be used in CI.
>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   tests/intel-ci/meson.build | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> index 59323eda9..b6f1357cb 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -12,6 +12,7 @@ intelci_files = [
>     'xe-fast-feedback.testlist',
>     'xe-fast-feedback-chamelium-only.testlist',
>     'xe-sriov-vf.blocklist.txt',
> +  'xe-sriov-vm.blocklist.txt',

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

>   ]
>   
>   install_data(sources : intelci_files, install_dir : datadir)
