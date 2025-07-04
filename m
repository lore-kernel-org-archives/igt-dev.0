Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB3AC83F03
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 08:02:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1286E10E975;
	Fri,  4 Jul 2025 08:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Et+v+ePV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA12B10E975
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jul 2025 08:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751616176; x=1783152176;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GYVfJymg014Go2UDR9a02e3vpWMJKGiswcWgvb2S2B4=;
 b=Et+v+ePVysyxU9ii1vxTpeUScP6msIZbd102n9Kv7jrGBrNmRMfyreVE
 7J/JWPBj8ADrf6N9vEszO0zsYBKT/HW+eaayrOQevQ6cACYKOps2UTsqP
 43H+Rmn3tnZVk2YqEr1GixfqY1BqHxaia+G+gyZ3KAJ3YtbujJkgr5Lgq
 pzEBcpwTYO/M63zOJN8PspDW5Io0RZUHIoAofwbf0zKSjkZhcgcR7gguZ
 LB/qs8dgYrhf0luKxxjLh+DXrCDFVqD3YKnTowEGFurAxhM0pxxB6D8g+
 9bTphOg4mkUReSW8F8qtNFB91UNbHt4V6yDSvLchwPDl3d8v3Ad/3CfDG A==;
X-CSE-ConnectionGUID: xHPF/Za4S0WEn6rRPwakTQ==
X-CSE-MsgGUID: MgcdPgbyQCiUm2+3nA5kaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="57723677"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="57723677"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 01:02:56 -0700
X-CSE-ConnectionGUID: ouD5JUO9R2SOQs0B4NErMQ==
X-CSE-MsgGUID: Q2JpxTx5QJ+X86YMZMhffQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="159136794"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 01:02:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 01:02:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 4 Jul 2025 01:02:55 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.82) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 01:02:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dBD1ZEESXwSF8K+VFL486RuUL58OuOnQC4UPC7d41KcmwVYhMKn8/2rImFLOmfXRw+DLnp1u6J4GcVqtdGVO/135dlFCTzBzam356w6/gzZfjlOuN8lAK7VhBiSANIRgPb3jb5QC7aSE8O6z4QQNP4Fj88gzyeQ2aGZ0uexLuQi73W4nLnYEeqjvoSedEE1aESmDslCoS9u0pvNRxH0KGheznT3kbowp4aOQnjcGR2uqDAT13QGEEL8fMyIX/TBpV3jcJWfpSxIQqd48Jj2WV5Y4G+nfg6KN2yFAmL0VUro2f0aMMnIFhJIqQMqPQiQ+gkc40lVQ/HOXxiLljZSPUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dd9naARk80mfiReMYPbc0fYOEGpvY3+jJFlAFf1Mx3w=;
 b=Qo+dqNgSLomoJP6rJZ6A/Z8c5FaqbAcpGGM26xy1Y8DjgBdUAdhigl5pHXtPrrsnjvwbvDnCIF4+/upJuK0L8YcKgKBtG4/LeFVU08hK3GQp3Wn2a5jX9VOLGg5kiVtW3JSaViJgS8Z820d8H8GlxBknPdHNiX6jJ881IvDLIgCfDUeyC8cJjrbqwkLJ9v0i0sb3i3JMkjWo0uEBACJ3pZtqxt9rjPgf7N67vMqLcavlafjrEkENZusqKPah0rokHEdBQDGCh1nzDebAEJqvkeqneTlcE44IGbb+uAClSB+juaf6cfIT410uToSWBwOHDjAhVoZX39Dea3Z1YMdxsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DS0PR11MB6543.namprd11.prod.outlook.com (2603:10b6:8:d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Fri, 4 Jul
 2025 08:02:24 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%3]) with mapi id 15.20.8880.021; Fri, 4 Jul 2025
 08:02:24 +0000
Date: Fri, 4 Jul 2025 10:02:20 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 3/3] lib/intel_compute: use post-sync write to
 detect command level preemption
Message-ID: <aGeKjDZeLvwxOTFA@fdugast-desk>
References: <20250703063032.553963-5-zbigniew.kempczynski@intel.com>
 <20250703063032.553963-8-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250703063032.553963-8-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2P250CA0027.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::32) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DS0PR11MB6543:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f8efcc4-3575-4eb9-d112-08ddbad11be0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWEvSy9WRXN3UWlSTS9sWFg2UU1yaVpzVnJ1YVVGRXdKOGI2ZVArUTFnRmdX?=
 =?utf-8?B?R2VLQWZRUTlHWGZqUmhBTmsxVUh1NDBoc3orWTZWdjdxNDNTYWl1OWNHb1A1?=
 =?utf-8?B?NE1XclNKQWpoZ3NoNTJYNWJNdjRrZk9OcGRkMytjV2xDQkM1MWgxU0k1WnRU?=
 =?utf-8?B?algzeEFJSngrczhCalY1c3BNQ1pLZ0J4MmFjZCtIMlZjS1ZLVTNYQUpvT3gy?=
 =?utf-8?B?c29RVXJFY0VSRTFmV21WcXZMeVhaYmdJUDNYeVdjb0daWnlxOFdyN2p5L1Jy?=
 =?utf-8?B?cm9uVkhzTlc1Mk11blU5bEZ4N2JkclM1SmZqOUFSL3gvM1JEWVdTM3E0T1dS?=
 =?utf-8?B?NmZibHZyY1NlR0Fhc2REbEhpVTBpTlArYThkeGZiTXdWTFJ1cERWTmhTM2Jv?=
 =?utf-8?B?Y1FBZlN6Z2VRZGZDUjlGbCtrNHdzS1Y5enlXSU95SDR6UlRmL3lOMWhQY0RU?=
 =?utf-8?B?YkVyR0VyZDZYOWtzOGc4SzZackt6d1QyWklRWE5HcmVJQ1cra05CcXhsWkJq?=
 =?utf-8?B?dEdjeGtib3JCcEU0TitUeXNMOFZWdDhVaE1EYW1PRTR2NHlBMlRUS1JTWXVP?=
 =?utf-8?B?MzJSYkIra0lzKzkrU0FnODI4cnlCUVc1K0V6MDBBYStGdzJDazMzbGhxd3Zy?=
 =?utf-8?B?L3NJWGNwTXpqY080U2NoVnoxbytxcXljcFB1SGdsTnVRd1VyRDdnbkJpcFRL?=
 =?utf-8?B?Y25rTjFMYnc4SzRpUkVsL0NoUXhLbWFWZmlJeUxUZlR6NEplTUUyQUZnRC9M?=
 =?utf-8?B?c3lFZVhqLy94WmhEalpyNGxuMURPSVBLMVlhS3pNWHdZMUplWCtXS21xWEtN?=
 =?utf-8?B?OXZuRVVZYktaYmhqSXlVMGJEeUgyaGE2eGwwTldYZ3U1ZnJCdnRrRzIxTXlv?=
 =?utf-8?B?M1g1RGhuK1hiL2dpY3VrdVNldHlwenBOKzN1ZlNZN3F4MzBhM3FIazRjRnlx?=
 =?utf-8?B?Y0tvWnpRSDNHU05BRUxCTE5mSzcxRmlmL2lweVovUGFGV21udWpnUHFJWjgz?=
 =?utf-8?B?d01FV01TNFI5TUNwb0VNYmdtWHc1NDR1bEIrbzVWNzE2WUdyWVRQbVZKN0Ri?=
 =?utf-8?B?UGJtMFZyMDhtZEdVa25FSERvMkhKTFFuZ1BZUXRnVm1HMWdsMkQrZzBtOWx0?=
 =?utf-8?B?bk85b05sUGdOSFRZTVhuVEV2UEZlYm83Rmh2WHphMlVCMHR0TlQwdnpFa3NG?=
 =?utf-8?B?UExndi9uWkZXMW9iNTkrOEJzbGxiU0VWdFVkRnNBa1ZBWUhMSGFXY0Q2TVh2?=
 =?utf-8?B?ZURTREtzdmVSR1BMNWRZVjJqQ0MycE1pRkdlNHh0b3JpbDNNMmJWcWU3bWtI?=
 =?utf-8?B?RWFJbFBVR2Z4cHNNaEZaOFNlT3dIeDI0YzFiVCttS01TMVF2NlNER0RYVnV4?=
 =?utf-8?B?MmtFVmVlUmwvMGtCTjZNeW9tN3hyeUtURlNFZmRSa3hyN2YvVkFHL2g4U1hV?=
 =?utf-8?B?NEptQ2tISWZRS3grMjVqVzdqVFZyYjVNSGJZeEdOd0JYcTNBS1dTUjFMdzQ1?=
 =?utf-8?B?ejk0QlFtTlZzZFc2V3dvNWh2MVRvbTNvUlRmdkNhM2xtdDlNa3ErSmk1bHp3?=
 =?utf-8?B?ODg3VlI5MmM4WjUxeWZ2cEEwZDJPQkdHbzEvNy85VG5VRUtzZ1F6Y1ZrTm16?=
 =?utf-8?B?QUJTNEJBUXJRbGJmV05oRWYzS3NsODVVbE1TVnZ5N0ZOT0NvUlQ3MC81RXIv?=
 =?utf-8?B?VVJHbjhUZW4xdkxSeWtGWFp0eDhhMk9tRnNaWDlGMDEvZTF0a1VQc0tTSzR2?=
 =?utf-8?B?NENWaUEvTnZUNm1VblVuYjdIZXViRGJKQTN6am5MRWhITUcrLzhlMWRBMDkw?=
 =?utf-8?B?dnp0TVZHczB4UUZWbGZDYml1OG5FdlZrRDFLMVYzVEtCZEl1cGU3WHNoaFMr?=
 =?utf-8?B?R3M0eWUrTFhMSEpaa0U3eG5ubUgyb2FnanVDUktVcm9nL016czNFQUYxdlY3?=
 =?utf-8?Q?WV7IKrKofmo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXoxRXN6RTFpTUJaYWpiUkRrZFpWOGVFVjB0ZDhFMW9lcFZacVQ3NmFKSzlp?=
 =?utf-8?B?Mkd2cHFFT2tJQk5Pd3hLK29xOXB5bmFQL0F3VkE2ZWpHN3gxZ2QrUXVZODhG?=
 =?utf-8?B?OFU2ZC9GellwTS9UclE4L3llUGs4M1gyNnAwalJ3UDB6allVRUI2Zk9pcno3?=
 =?utf-8?B?VFUwWlQ0b1k5QlZmU0VkYllKQ3Y5alRFSjkzWTZuTTNXaFF3TXVPK2pEQXJl?=
 =?utf-8?B?WVVqMHJuNW51UnFvVVFOZVNhMGRCR2MrQXRFWHpDTjdVZXlKZHE5S3hnMGl1?=
 =?utf-8?B?QTNnUjEwR3FPZXZNcGUxWDdsTk5DZG9NUFd4MUEwdk9Fbks2SDhSRzZsQnBC?=
 =?utf-8?B?eWdPTGdueElYS2xhZWlFOExkQ0x2Nk5DN1J4V3NITVBtWlMzbWVhSDFhd3FB?=
 =?utf-8?B?NG5zNDJ1eHdUeWl3M01EVDZ1VEZKd2dad3kvaW9tTm5vajRRVXl5ZVUvZ0pB?=
 =?utf-8?B?VXkveitlWnF5YlFxMkdyU1V2Wm12MC9VSXdtRTU5TkV3TlFPWmhoMEt0MHRT?=
 =?utf-8?B?eENnbmNpcTVTN1ZjTFFZRHZ3bCtpTlhhSk5hZkIyMXRwbTdQMXk5dXFMVWI2?=
 =?utf-8?B?dUs2dHJXa1d5ZEtGRThEOFlkakx2QytVM3FsZmJWekFNSFBhTmhVMVVxWkdM?=
 =?utf-8?B?bUVObVdFWHYwTUo0aHQzcDlSd2dZSUZ6bk51WHFhYWJtZDJ4N0RoZTR1aXFp?=
 =?utf-8?B?d1REbVptZURBdVZhc1RycUV5K3cwT0lHdkcwaTNmL0QwUmxIV1ZybmE3NUxQ?=
 =?utf-8?B?NWJOYzRUell4NFk4ekE3N2EvTFkwdFNWK2F0T0t4bUlNbnNRNWNId0N4Nlpl?=
 =?utf-8?B?RDFoV3Y4Zllnem0xWVdzd1pvV3dSU2FkMjNRczJjS1lSSUtUZmljSmdMdFpq?=
 =?utf-8?B?Tkd1TDJpUHJOYmxwdTBBZlU2eGpBaFNIY1Jockh5dG0vUUtMUkw5NmZEWjlv?=
 =?utf-8?B?VnBoVHhyZ295SnNFVHptbmlSaUgrVCtta3RINzJ1VEw3b2pmUUpYSnJkT0h0?=
 =?utf-8?B?QkFUNUlWT3ErTTl2RTRzZC9EYldETUFiZDRJWEZJK0hNWVZnNEMzd1BDOGFI?=
 =?utf-8?B?RXQ5bmE3V1dkb1ZxY1Zxdjg5Z3BiZSs5Sk9nejN0eGNHVDdVZnRFMHIxT2Fk?=
 =?utf-8?B?d2hlbzRkbkh4NmVEMmNvWXgyQVNQbXY1Ym1SN2RSU3ljcEo1T2tSemNpaWNa?=
 =?utf-8?B?UTJUWXE1UWlXUjBtRTI0S1BqR1ZwVUpkTUp0ckNaTU5xY2pBMXlOTVRUOGxW?=
 =?utf-8?B?Nmd5bGVLVjNib3dGWTB6ZitjSlVnb0pJVnBZTVdRRkVKeDczaVVKODBJcDh5?=
 =?utf-8?B?N2llaFN5OGNWTTdLS0pvQVhpcmhMZnYyZnZ5VGh1UVFNeEVvQTZndFNiTmFU?=
 =?utf-8?B?b3loVllGYjlZY2ROMjRrc1Q3ZUM3QXZaUEhIZ1B6bzlUeTZ6bTNwdHVuUkFt?=
 =?utf-8?B?RWpkVGIyNVlDd0JabnJqM1l5aVk0cm01N0UvSzV3cE1na0Fkc1NHYzB6SXZt?=
 =?utf-8?B?c1lzUmVQeTNOWUNyc1FBWDRzL1JsWUs0TXFtMjY4b1Q0dEczemRLYlNjL3Ni?=
 =?utf-8?B?UjA5ZllmMjhzaGZITVQxeGRTVTJPb09DT1VwYWtEZU5Kd0oxRzFJWVRsSHVa?=
 =?utf-8?B?cDBmcVVXTUp6dmlRMUU3MWs0R3c5OVA0RTY5OVlFVWJKenB5RDMydnZ0VDVM?=
 =?utf-8?B?K3JWWnhFMlNyU21ua2ZYVmR6cU8vU2NFcHhVcUpzS3hCc0RDVmpyY1UwVjZZ?=
 =?utf-8?B?Z3hPNWs0cVpIdE5lUVZWenNkWGlIdkl4ejU1SjZ3RHBHRDMrdnROMFIrNjEw?=
 =?utf-8?B?dnBVNnBtQ1I2Mmw2UUI1R2JQNHZHZWZCbVhKdkl5cU5oeUVwK0hubUFqalpU?=
 =?utf-8?B?SVg1K0l6WFByRStRVkw4eG1sWkpIemRaNlhieW9IUUVJWFpEdWxIUXQ0b1lr?=
 =?utf-8?B?SWlsK3JZN3QrdStIMXlkM1JidnlSUnIrRzErYkJuQ1ZLSDNWWU5xSUFNWTNs?=
 =?utf-8?B?eWk0SG10bVE0WlE4YmFyS090VUNwZDN5Y25nYUgyZ2NhWjhDYm9UdmRlbzBl?=
 =?utf-8?B?UnFURzB6bm8zWmQzQ3VVOUl2OUZLckI3ejFMWlRVMlpGSmtIM3htZzFsN3l3?=
 =?utf-8?B?ZTR5Q2Z6TGpWRTRVQ3Q3bERtVmxFR25BK1dKWThvN1dSWGtIL1E1QVV3NWln?=
 =?utf-8?B?MlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f8efcc4-3575-4eb9-d112-08ddbad11be0
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 08:02:24.0070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zquJ4Yi4/Fekgp0Z1AtEaUwyKsMsRGsRsQUJXowcTWV7Nkvkv7pIhU3BwRFHV82Lo0j1U3d6gTyRxsjk4mWxn+orCddYADrEA4MNeKXQ5Sg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6543
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

On Thu, Jul 03, 2025 at 08:30:36AM +0200, Zbigniew Kempczyński wrote:
> At command level when long job compute walker is finished we might
> be immediately switched to short job. This defers signalling of long
> job user-fence giving false impression this job is still ongoing.
> 
> Add post-sync write to compute walker to allow detect this situation
> and fail if command level preemption occurred instead TG preemption.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  lib/intel_compute.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 9549b58fdf..6126bdb3f7 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -53,6 +53,7 @@
>  #define OFFSET_STATE_SIP			0xFFFF0000
>  
>  #define USER_FENCE_VALUE			0xdeadbeefdeadbeefull
> +#define POST_SYNC_VALUE			0xabcdabcdcdefcdefull
>  #define MAGIC_LOOP_STOP			0x12341234
>  
>  #define THREADS_PER_GROUP		32
> @@ -63,6 +64,7 @@
>  #define ENQUEUED_LOCAL_SIZE_Z		1
>  #define DP_SS_CACHE_FLUSH		(1 << 12)
>  #define DP_PIPELINE_FLUSH		(1 << 2)
> +#define WRITE_IMM_DATA			(1 << 0)
>  #define WRITE_TIMESTAMP		(3 << 0)
>  
>  /*
> @@ -1557,7 +1559,7 @@ static void xe2lpg_compute_exec_compute(int fd,
>  					bool	 threadgroup_preemption,
>  					uint32_t work_size)
>  {
> -	uint8_t wb_mocs = intel_get_wb_mocs_index(fd);
> +	uint8_t uc_mocs = intel_get_uc_mocs_index(fd);
>  	int b = 0;
>  
>  	igt_debug("general   state base: %"PRIx64"\n", addr_general_state_base);
> @@ -1617,7 +1619,7 @@ static void xe2lpg_compute_exec_compute(int fd,
>  	addr_bo_buffer_batch[b++] = addr_surface_state_base >> 32;
>  	addr_bo_buffer_batch[b++] = 0x001ff000;
>  
> -	if (sip_start_pointer) {
> +	if (sip_start_pointer && !threadgroup_preemption) {
>  		addr_bo_buffer_batch[b++] = XE2_STATE_SIP | 0x1;
>  		addr_bo_buffer_batch[b++] = sip_start_pointer;
>  		addr_bo_buffer_batch[b++] = 0x00000000;
> @@ -1665,12 +1667,12 @@ static void xe2lpg_compute_exec_compute(int fd,
>  	addr_bo_buffer_batch[b++] = 0x0c000000 | THREADS_PER_GROUP;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = DP_SS_CACHE_FLUSH | wb_mocs << 4 |
> -				    DP_PIPELINE_FLUSH | WRITE_TIMESTAMP;
> +	addr_bo_buffer_batch[b++] = DP_SS_CACHE_FLUSH | uc_mocs << 4 |
> +				    DP_PIPELINE_FLUSH | WRITE_IMM_DATA;
>  	addr_bo_buffer_batch[b++] = ADDR_BATCH;
>  	addr_bo_buffer_batch[b++] = ADDR_BATCH >> 32;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = (uint32_t) POST_SYNC_VALUE;
> +	addr_bo_buffer_batch[b++] = (uint32_t) (POST_SYNC_VALUE >> 32);
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> @@ -2117,6 +2119,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  	struct bo_dict_entry bo_dict_short[ARRAY_SIZE(bo_dict_long)];
>  	struct bo_execenv execenv_short, execenv_long;
>  	float *input_short, *output_short, *input_long;
> +	uint64_t *post_data;
>  	unsigned int long_kernel_loop_count = 0;
>  	int64_t timeout_one_ns = 1;
>  	bool use_loop_kernel = loop_kernel && !threadgroup_preemption;
> @@ -2165,6 +2168,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  	input_long = (float *) bo_dict_long[4].data;
>  	input_short = (float *) bo_dict_short[4].data;
>  	output_short = (float *) bo_dict_short[5].data;
> +	post_data = (uint64_t *) bo_dict_long[8].data;
>  
>  	bo_randomize(input_short, SIZE_DATA);
>  
> @@ -2195,6 +2199,12 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  	bo_execenv_exec(&execenv_short, ADDR_BATCH);
>  	bo_check_square(input_short, output_short, SIZE_DATA);
>  
> +	/*
> +	 * Catch command level preemption instead TG preemption. For TG and WMTP
> +	 * post sync can't be visible at this point yet.
> +	 */
> +	igt_assert_neq_u64(POST_SYNC_VALUE, *post_data);
> +
>  	/* Check that the long kernel has not completed yet */
>  	igt_assert_neq(0, __xe_wait_ufence(fd, &execenv_long.bo_sync->sync, USER_FENCE_VALUE,
>  					   execenv_long.exec_queue, &timeout_one_ns));
> @@ -2205,6 +2215,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  	((int *)input_long)[0] = MAGIC_LOOP_STOP;
>  
>  	bo_execenv_sync(&execenv_long);
> +	igt_assert_eq_u64(POST_SYNC_VALUE, *post_data);
>  
>  	bo_execenv_unbind(&execenv_short, bo_dict_short, entries);
>  	bo_execenv_unbind(&execenv_long, bo_dict_long, entries);
> -- 
> 2.43.0
> 
