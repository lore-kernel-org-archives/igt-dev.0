Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4557D0EE0C
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 16:50:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7DF10E53F;
	Tue, 25 Nov 2025 16:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cm32FRXo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D1710E53E
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 16:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764089449; x=1795625449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=vyqqkYAwjRF+HXP4+aX7C4A/6odanaCfx1CcRegtF9w=;
 b=Cm32FRXoj5HvghA1VgLTJUc2z6G8QBuU9+4sYsdh8Wlvdeu9ZhDpclR9
 ddEJ7C8U0YMV7I+5Ryy8gBT7/FRDU6i+ftGVXldog6yQj3ElPpiXmQZ0L
 jeS0JolB3063sLY6OVp44N4z4licDzVE0ZbSgYgrRsd/OdgGTKSgrnVlC
 jv0UtiqQehX+LOzofSdbhND7TOi3CVAJU4L1Pt5DZrhf89moUBVEf6DrP
 FMZdBIssHIF2oW5IWVJIIbKGJ/FV0EvWhKVPNFjOdGl6dt/7Icw5WC9n5
 6kFKZ28S4Jx9Mb6s+FAzahBYtDk9GiqtHpZgMgV/gcwkREd+mlcjQI/j7 Q==;
X-CSE-ConnectionGUID: ZA+8kjDFQOusswqQ5X/21A==
X-CSE-MsgGUID: 7Xn0dY0oRxOwcxX77ervsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66002506"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="66002506"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 08:50:48 -0800
X-CSE-ConnectionGUID: OR+UhJ1ZRR6qvHEsCPk4aQ==
X-CSE-MsgGUID: zuFijGTERsW9iEMj+dPJkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="223657855"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 08:50:48 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 08:50:47 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 08:50:47 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 08:50:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R1d0hHPGjPKIpNJ0QWvfgV1kY2KQT6PWEYmqtLzEC8uEBRy+JDPD6b001dfoW6NxCzao7AHmVG8dTLz8IBdt6GOMVQviMlJSPVfZRmmOFGTFnv/C0K+//yHiU5BAFWVyirWQm4jPlxqJeBeYFwYtijKgr/Rd1tpZrA7/iVtvBFPWYWVPcWZF7lYHQtPtcXMiMaqlY9WtZVrj8jyAY0962/Y2OIFM9dh25a4mDGHKWruEyBjAVLRz0v99t3pLeK+pDVbX8ZNIbD8XU9cKLsfz151K7u8bXxiI1af2Guf/nziiJKuabiKBm6Mp727OBDfF+HBuAfnn9EykHixlDCW0mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lf9rtJ+uUbg4WYYfTVeUSijIKaUlKU5YLgyrgZMUu8k=;
 b=zLEwV9S7ZZhn/ciIbW44bWEQUqmVm/TGCkNEKi28n5J0DfJqQC2OfXoCWz5JvgiucxZ8aqe5qIUS8eUW0GnP0XXVPxVVQmyCtaOaoezrRD2efPuqIEdtQJEYmfhSc+FfVajSR87JblwEgVCjC2WtBP8I/J1JWy2Z4lXrg2tCYAMi9xIyhR/a6mFZMPYdTUVS0mAY2mdtsB/zLE5oiTLQ01clJ6xWnPzpd8Jw9Vwzc4xwXiG2atTGzb0cMDgnAnOOLD4T5fHBF5s9AJ9MAES6AlbYxeWmjW5yjeMl9QZDM54kCX8vzlmStgHYjtx9TYaRY6GXUinzvVZNNP8UzMP4ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB7470.namprd11.prod.outlook.com (2603:10b6:510:288::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 16:50:45 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 16:50:45 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Peter
 Senna Tschudin" <peter.senna@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 1/5] lib/igt_dir: Allow scanning only the current directory
Date: Tue, 25 Nov 2025 17:50:24 +0100
Message-ID: <20251125165028.36533-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125165028.36533-1-piotr.piorkowski@intel.com>
References: <20251125165028.36533-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB8PR06CA0065.eurprd06.prod.outlook.com
 (2603:10a6:10:120::39) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB7470:EE_
X-MS-Office365-Filtering-Correlation-Id: df5949b7-992f-42e3-c9a6-08de2c42c704
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3A3VlpwUllZYVdxazJUK201NFJSdHc5RXJvVXJVZ0tkM250M01Hc0xkS25V?=
 =?utf-8?B?NVZmNEpnRTFOZWhtbmkzR1c0V1VUNkFZWEdZYURDN0c0NDV2RloxOXQwSVdS?=
 =?utf-8?B?VkNMNTA5ZThMMHYyckU2SEwwaVViejhQWXNnZDhXdmZIYVZYS0dJSURZT2Zz?=
 =?utf-8?B?Y251dXVXUHFudGFOeDU4N2h5NCt5R2tmUm5WY2p0elBDVThmUUU0WWIyV3Np?=
 =?utf-8?B?dzlsbVpRU29zT2UrRXhLL0NUaWhPWlR3aUwvR3J3OTZqdHhJdkhtcEI5NkVv?=
 =?utf-8?B?Qi9MbmZYdXY0eDFXS2h2K0gzYTZheWNvWU4wYktHRVNUWFZmbmgwRHhwSUN5?=
 =?utf-8?B?TnRxbFMybDB0KzQ4UGxyZzRxUVZXanFzenM0a2NEb1Q5Vm8rU0Y0TzFIVW8x?=
 =?utf-8?B?c2JCaDBjRExMbHJxMVBLVVN2S3haRkZQck9LZG1ZNEsrN2p4Z256VHJXUk1o?=
 =?utf-8?B?UGtLcmJvYzV4VVpscjBnVEhoM3RMODNJdGxmYklWVFBGUmF0T0NaZWRkUFJ4?=
 =?utf-8?B?RitaUE9iMG1KQkhtY1FhSEtjaklaRG95a21UMUxlZm1sZ1U2N2drOXhCdE1y?=
 =?utf-8?B?cGcybERsU3ZqNTR1TVR1WlJrOGx1Y2NwbG9GQ0o1T2xwNVlsOTl2TXJRZDRl?=
 =?utf-8?B?MVlVOFlXT0FwVXZIMFgrbzh6bVliWE5QaG5jeTVabGUzN0NFbDY1OU5HNkF2?=
 =?utf-8?B?MHVBbmg5emlGTmJsMHdmdU9FYXVEOHo5UzVXankvdGFqMGFvblVnR2tHRHVh?=
 =?utf-8?B?bHp2d002WkswR3BHMWZsQ1N5cGdmR24xUld6bTZrT0hqcHZNYmFiNm83cHF5?=
 =?utf-8?B?cC9GbEpXTGtNTnl0TVhJQ3lNejVNRHVzN0M0UDl5NE9Pbmh1MGhKUTNWSWFJ?=
 =?utf-8?B?WjFKbkJsYXlCVVRmaFF2eFBZVXNJSElvdW1VeTlieFRKYTEyYU1vTXRpVXox?=
 =?utf-8?B?VzdyOEVxRjFVejBCajZFaUVnL2d3OWs2UHR0djBNcUJkSHl2VmIxL3gzclRt?=
 =?utf-8?B?T20xSHkyOVZoN083dTVpY0ZZalpYYzFxMUFwZktUem1pZDRNMkowRzRDS2NQ?=
 =?utf-8?B?OFhJL00zMHhtbGJaS2lTT1lDeTZkU2dpOUlaU1ljSDVUTXNpUmlWSk5qUzBY?=
 =?utf-8?B?Wko0bndhM3R2cTNQbFhzL2VWb0laUjFyMXBxRVdHNjNyTVBZclNYQ01QaUdh?=
 =?utf-8?B?bTUvSmo4V0JqdFBZRmFyQ3pTSTM1dE9jQjltamFjRkt3UDVudzh2Vlh6UkQ0?=
 =?utf-8?B?KzV3T3pOanRKRXN3UmxwbGtYR0Z5RSs0bC9VcmNxUzhHMHBMQ2EwbEpkWjUx?=
 =?utf-8?B?Vm1DT3VtL21wN1pzSlVTZzI4Y2ZTc1NXUUg3cmJ3YkF5eVZoanRXejRBVVJv?=
 =?utf-8?B?MDdhWjJTeEYvRU9ESXJxOEwzTzBTUmpUVEJGWk9SdFR2dFF5UFV6dTFaZHVh?=
 =?utf-8?B?VmZvYnpDZGlGNDlTdkFMTDI2V0FoQVFzS2NyZTJzMW9QZE9CaHdSMWwyMFRO?=
 =?utf-8?B?T29MQ0dhZTFDOVBHdi90enh6VFZ1SmNTYVJVeVIySU1aWVE5S1NTZnl1b2NZ?=
 =?utf-8?B?RHlYM2xmcTZoeG9EYXFJWTFBc3hONStpdFgxUE1wdysram55a3kyNUUxOWx3?=
 =?utf-8?B?TzlKdjFDT0IrUjBxdFhyaWpUbExBQkV0L3VXUWpCVE45TGFYa0YyZVU0SkIz?=
 =?utf-8?B?UUlNZWdMSTY0N05BZ200Tm11dlR2dENkNGxpM1MxQ1E3NVUxUlNnZFh5cHBv?=
 =?utf-8?B?eDZhVVQ3eFVTQWs1Y1k1ZWJTZTM1dVhXL1Y4UjJpczNkNTNMTXJaNTBrcE9M?=
 =?utf-8?B?QTh6VFRRZzFHenplZnpLMjFOTno0dzhtNXhOYS9Bem5aQzNCTUZESTM3Nitx?=
 =?utf-8?B?NTVNS2ZtcGVqMWdablh0QXk1d3g4YlpQbFU1T3RLeHFjWWNjUXBZeHpFQ0g4?=
 =?utf-8?Q?hhs2bAETr541Z/VHy1EJfwlzVDQQUk/P?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDVUUmRDM0wyeVBjcDhodlVYSlNlRExnNzVPZDJpeFhLVHNIaEJWWTZHeTRQ?=
 =?utf-8?B?Rzk5Ris3aFVHTkZHVG93MHEyY1RFcGhsdFROWmhxNk1UV3NtNFJIdXlGa1c3?=
 =?utf-8?B?UHlRVlhibkJpM2E1aGMzSmtRVGN2dlBXa0FKbWxUMzJVWlFwNDFtMmxrTTJw?=
 =?utf-8?B?TVFZYlVIVmx3ZWNIWDZuU2dnSGhRQ2J1WTd0NWUzV1RDUnJQZlROWlRyT3ho?=
 =?utf-8?B?Y3kweUNXVnNJdy9FcWhzZXlYdDV2STV6b1Q1UXV6RUFXT2Q1WmtzR005cHpF?=
 =?utf-8?B?U2xuS1VMZ2xCa1RucWlDcXYrTkd6M3hSbis3REY3RDk0YzBNUlR3cWZrUUtH?=
 =?utf-8?B?czYrbzByelNiU0IwYmxIcFFUOHN6U092NzZvMmdOTXUraXJiVFBjRkFadkgz?=
 =?utf-8?B?dWtJRVpzczFYekRJTFpZczV0YktkRFhmL3NEZXpzT0lWOWRFTTdZeDF6N0JY?=
 =?utf-8?B?YXFPOTB1S2I2NUo5cWhMV0EzN1Y5YTNVaEZialNyVWVNWTVvbGNrVm5tZGNv?=
 =?utf-8?B?bE9Zb3NmVGIydHJ2NU1nd2UxdW53cS81ejR3M0JNbUlDNHdXenlVclhnNkMw?=
 =?utf-8?B?NEdFbmZNQkgvUGQ1R3p5LzZSYUFrTUlKWUJKZkdIajVWWWVES0h0SkdFSlpt?=
 =?utf-8?B?S1NoWlV3bUdCUHVBaVVVSUZNbDc3K0YxWnVoUDRJd2lDbDgwR0R5L0RMc1Iw?=
 =?utf-8?B?K0xXbkV0MENpaUxRVllxSHljajQ1dnA2aDdwZ1JOSklZRHcrdnloQjJMaDkv?=
 =?utf-8?B?UmlNb0lOaThBSTZ5MEMwdGdCR1VYYnVJT1h0eUtyamZqSW5XMFdoOWhPMFZ4?=
 =?utf-8?B?SkZtMThCUkROU01IWlcrOFlCTjBwOFp0QmowbjZTNWtVcUx4cW5IT3RaZHZx?=
 =?utf-8?B?MmxmYjM1ckNuenpHa2M5MXRFZVd6RldhdXZsOU1Rc2FvZU1Yak9LMkJUb3Rv?=
 =?utf-8?B?TjJLd0FtUWJiZFpBRHFtZDUxeEhJcHNlU3ZQM2ZZR3NrV0VKN1pmbVBsdVNs?=
 =?utf-8?B?aE1QUDRobHBtaFU0YXZUZ3k1OVVqcnpBWVVjZk1MaXUzWktiVnRNWWdFdnRX?=
 =?utf-8?B?YTBPSGdYK2c0YVZsdFBua3d5elRIa21FVUozN2hYbE4zVnNGZzllL2ZKd1h2?=
 =?utf-8?B?NXdjV215dS9RWkJqTFZVYUhTbXpEZFN3dDRmYVVjcUJLRGowYkU4VUpGYmdK?=
 =?utf-8?B?UGk4aHp2Y2JXQ3JxMDFraTVuM2JHVmFBNG1SVzRlRW92Zk42S3R4RGpGakVH?=
 =?utf-8?B?RnFqTDljVzJmMktERW1tYy9NTjVtYVp1cmtjUWdFUzZxVDA0T3o0QU04M2wz?=
 =?utf-8?B?TEEwaWZNZjU3dFR6Zk5xZk90K3IwaUF0N0NtRXhpcnRTTHRzdWZwcHdNMndH?=
 =?utf-8?B?MHVOdkV6bkdjUGJHUUI3TlpkQ0txMFJ6eFVLMWx0MDZPcmVPMVVoRGV2ZTdE?=
 =?utf-8?B?SUQxTks2MFpFWklsMTd3ZEIrTVBSSGFlWitWTWp0bjVYLzRyeXdDVmZ3bTFW?=
 =?utf-8?B?Rm9WUHBwKytZcHN3THJaL3I2ZnQyVXJEYW9DVEFsNTFMeU50WCtwT3dBU2Rt?=
 =?utf-8?B?ODFGTHhOeVFheUZHR2gyV05mWnZESWRabnI4QjRsZUZTM1Y4cW94ZVJ1c2NC?=
 =?utf-8?B?L2t4R1FLNXhrSGtpY0wzSlZnb2h1R010c3BBZjF2L1VERDdFaGJwczZHekpr?=
 =?utf-8?B?SjBrNHlHZXExOFVlNDROc3ROTE1NQlg5SFlJWnhBKzJBR1Y5Y3JwbFNZV09O?=
 =?utf-8?B?MXErTkU0THZmS3doaitXcjk0MHVpbEVQRytTT3FpbWprcVUxSWxnZGl4NVhY?=
 =?utf-8?B?MDZxczhkbTFmcWYvTitlb044UEI3U2FSWEc5aEtGZFdWRmxNMEkyYnFBZEFC?=
 =?utf-8?B?bFM1L3VqS3NscDFRTDlQdDVHSFJKMlU2bTN3alpZSnI3ditwRitheExDVHF3?=
 =?utf-8?B?cEdZN0Y2YlExY1l0MTVTeFhQbkNRMmIwWjFwUmVCcWIrQ1k4YitsWE5FY25a?=
 =?utf-8?B?cEJDajNJTk1iTEFMeWkyeWZHZHJ2YzVjNzNMZGkzWWpQYWRKTEFWYjVIeEpX?=
 =?utf-8?B?eUxXQ1hPQkhrQnpIOVJlR1BrRDU4aXVtZ1Z1b3QzM1BuekJ0c3hkQ2JOK1No?=
 =?utf-8?B?NjN3U01lNDhlSEJoUkxyeitFbWN0Mk5Fbm1Dc2tUcVpsQzlLTHVrNSt0MVVK?=
 =?utf-8?B?Z0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df5949b7-992f-42e3-c9a6-08de2c42c704
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 16:50:45.3155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+Rq7Bf/qSmYsvqu3ZC/es3Ws+I78AbRfpJpdCyTHclNFcc68RS72LqyyyRAeDBVtkedyQN7MqaduFnZ2ea6VeD4gigTU24LtuNGDBsqhiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7470
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

The check rejecting scan_maxdepth == 0 prevented callers from
scanning only the current directory without descending into subdirectories.
Let's remov this restriction to enable using scan_maxdepth = 0 as a valid
mode to list entries in the top-level directory only.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 lib/igt_dir.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/igt_dir.c b/lib/igt_dir.c
index e232dbda9c..6ef8e859a4 100644
--- a/lib/igt_dir.c
+++ b/lib/igt_dir.c
@@ -241,7 +241,6 @@ int igt_dir_scan_dirfd(igt_dir_t *config, int scan_maxdepth)
 	igt_require(config->root_path);
 	igt_require(config->dirfd >= 0);
 	igt_require(scan_maxdepth >= -1);
-	igt_require(scan_maxdepth != 0);
 
 	/* If the linked list is not empty, clean it first */
 	if (!igt_list_empty(&config->file_list_head)) {
-- 
2.34.1

