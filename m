Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0491D2F002
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 12:02:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D6610E55C;
	Tue, 27 Jan 2026 12:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A2Wz8utK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0B810E55A
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 12:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769515378; x=1801051378;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GHI19sp9vYrDMuoY0RQbm2WgSYWduI9i2y1UniyMo8I=;
 b=A2Wz8utKnS0MgWgXj6NAK4a/Wz3rWCfgydkLo44me0EZ1nZkkQ/4Gj9F
 9xgqUYIaVuxPVvrrQH6tlIqwPObDQ+Z+IjSbgxSgsakdtff2sqcBqJV+Y
 FdqNJtLnSWlnPAuCSLpIG5jD5XSKBEKSz8M2eququm4Pbyb0TGNXiORv1
 Hxc9PphERTlKmliBopSDijtyMmCWZkzopCz+6xnhBdyQ2e3UGgyZiv08t
 ehr9ja7gDaf6sQ/UquOR+CtEl3dPjfMJX+7FAA8+TSGOYy0of7mu4J62E
 Wq9IZp0TxZiwcI0zAbd9YKd0o51j8+lNzx80SR3otkeI54dnZocPzSiNN w==;
X-CSE-ConnectionGUID: VP92R9uzT8SSKzkywFMCvA==
X-CSE-MsgGUID: I96iINNJQ7maqNnyowutOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="74330910"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="74330910"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 04:02:57 -0800
X-CSE-ConnectionGUID: J9Y5BXS0RGe1ZrK9LnPoRw==
X-CSE-MsgGUID: Xh84vpU5SXaqXu/qabK90Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="212820155"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 04:02:57 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 04:02:56 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 04:02:56 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 04:02:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wxpO8Hd7Xmy847PRoMiTUvpJFlbcJF10sEAbK5/6i0oAxzw6G/652DCsoDdG2YiuPkgcpGsC5Pp4w57G9Sq7GvIqtMQwmSdytrWn/oBmTNgD2nIO2+Hy2+MDm7b6O/bmyeAzpYFNH/APMo/nX2z7Clgvus9mESlC9msF36bptk3WpC62YnzTuCCg22wJHN1NY/dAHHMbV4189IEy3+rCb7r56WSyAz3SLyMjhtmvFjMXfWnDieI5nm4RHvhpUCSLOCKdsp5wSyOiR8SYQSGjpxnA5sX60913eQTWZUBxx9+K1Kpdq2ns1LBWBYofVDkbZwwHuOzZHJIky9aD7s2vdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/lY7WaB6IvEwLc7d47I4p/8Sw8MglBMThoZetbhPQg=;
 b=u9uAVqjHKtkwqbWbySGL+PYAX9T4b/MGAgf7BIEYJav1aplbS9a1yClI7muFThexXV7fqzab7gIKlrpbwg9xnLxxZdtSrs++Gw5GcVWuHMvvyqww6HhfBKPxDDiQosq5vOlPxrt6v531rPBuwHOFH+gFTLsIYjkZv+iVLBUW1RUuhy5llY1STlWfwmd0n6Wasv7/8UypEKXKejxsY+xvl/rWOExceALJ4OotHNBUpb9EOSsE6zDUDkqNOtkh6+uRuCSh8oBZKY8h9LxwNTt/4/getqQz9Q6bxZd5D3ecM8GT95ksq1jNj2T3xq2X/irve/bbsifxMI6oGXXZrvCJyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7207.namprd11.prod.outlook.com (2603:10b6:8:111::18)
 by SA2PR11MB5066.namprd11.prod.outlook.com (2603:10b6:806:110::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 12:02:54 +0000
Received: from DM4PR11MB7207.namprd11.prod.outlook.com
 ([fe80::7806:5aac:a263:2653]) by DM4PR11MB7207.namprd11.prod.outlook.com
 ([fe80::7806:5aac:a263:2653%3]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 12:02:53 +0000
Date: Tue, 27 Jan 2026 13:02:48 +0100
From: Jan Maslak <jan.maslak@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] Revert "tests/xe_render_copy: Skip if platform
 doesn't support flatccs"
Message-ID: <aXipaD6syubwcpjq@ART-DEV-395>
References: <20260126121535.336206-2-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260126121535.336206-2-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: VI1P195CA0092.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::45) To DM4PR11MB7207.namprd11.prod.outlook.com
 (2603:10b6:8:111::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7207:EE_|SA2PR11MB5066:EE_
X-MS-Office365-Filtering-Correlation-Id: c0ca06d1-451e-40c7-91eb-08de5d9c007f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFN5bTJpdlhaVnFoMGx2RktJWERCckduaGU4eDJQRk16dENzcVlqUGhLQ214?=
 =?utf-8?B?RGtOb2JGL0Q3Mm5neWp6Z3lZaEdHdmYreFFQbEN0ZCtJMW81c2daZTFNeW1M?=
 =?utf-8?B?ZVd2Ujk5d3NrcHVxQWdqZGpMSUs0RVE0QWN2c3AyUUxCcThIbXhiTHp6aW9M?=
 =?utf-8?B?VUllYzVjVjd1M2FlUEVqU05nb2ViK0pwS0ZtYUJUNkljZkVLVS95WEFnaEhT?=
 =?utf-8?B?K3ZwUEdKWXhiMmtJU2k3bXlCdTNFajljcHg3ZlA4Tk04WCsvNFIwM202Ny9N?=
 =?utf-8?B?YWIwMmJvWTk0VVNwalE2Z2NFaWk4bnFuYTNudy9sSkxwZHV6TTN5Umo0aEdx?=
 =?utf-8?B?S080TFd3VVg1YStjTEdSN0U1NnZOUXJIS0FndEgrc3cvTG5PNzcyZkI0Qk1m?=
 =?utf-8?B?QzZVOWltMkxacFNrWUwrd3FSQzIxRzkrbTlqc3FNbmU2TWJMUml2cnV2b0tB?=
 =?utf-8?B?QUdBbjJobVc0Z3dTd3k2Vm1vb29Ob3doNlRXTWx6Q29ZYWpxZHhxeFc1eXhD?=
 =?utf-8?B?Q0ZtMjc2WTB4QkwvMklRWFpqR2c2Ym1YU3VJUnZmaU5kdWs2TVJrdWpwNk1v?=
 =?utf-8?B?MFBoZHdGM1V3SGFKQ3RMbGp3ck5TckdyMklaTEJmK1BiTHpvaDhwa1Nsc3Vl?=
 =?utf-8?B?c0xjbUZWUDZrenQ5aFdkSHVUK1VzQjUxM2R3ZE9uMmxoR1FoZVBWdGw4TXk2?=
 =?utf-8?B?Y2tXNlJUT1lOQ0t4N2RoNVMya3p0S3NYeGVVWFRCSGdOMUppVU1zNUZWbzJs?=
 =?utf-8?B?UlRCb0U0a2ZOVkMxNldxcmltSlhwQ29DZFEzT2UrKzJwaEJWY2VsZlRubjE3?=
 =?utf-8?B?NnRLTFlUOGpjSXp1RnRLeDZmb09YVHFXOGI1L1d3cGsxMmNva2s4Y1I2aVZl?=
 =?utf-8?B?MnBCVVZ1Mnk2SXVzUWdVUEhGTG5jRjFHdnVXOVc1VHVhUzEyYjl6bVRWRW1T?=
 =?utf-8?B?Skh2OHpSUndGSHQ1RDRJOFBFbGxBNTFjRERKRVdoMXdJODB3U3c3bUtYN0Fj?=
 =?utf-8?B?U2JUUFpRSzNuSW96am1neXhpd3pNSVFxTmYxeU82dTEzQkJKUURlL09JV2sr?=
 =?utf-8?B?S1Ewa0ZuL1NnWGdWcERpKzY3b3NoMFBjVGhXMnFjK3Y5cG1zZTBqYzNLK0pu?=
 =?utf-8?B?VUVlWTVLK0pzeWRodFRSdWZ5NnczQTJRWUhlK2dEVFFIeVkvcGF4dzU2UVhr?=
 =?utf-8?B?SU92N1hLM0VyanE0Z1NJQysxamFDODV2MWdsRDdkcXdSS2hqT1B6M2lJeXBX?=
 =?utf-8?B?WGs1S3ZkR0hKeUljcnMyY1R6aHYzclAzUlVmcUtvamJBTmNjTldVdWdHaUhM?=
 =?utf-8?B?bVJWczgyR1hoNkoxL1RONU9FTVpEb0J2S052SVVZYkNOTWJ2MG91U2Erc3lX?=
 =?utf-8?B?dkVXa1Zid3l4YzhiUDdOdkVuZnJnczFrTmV4bWxUWCtKNEltLzQ1WGE2d2pl?=
 =?utf-8?B?b0M0elMraG4xZHowU2c0UFlLS0pvUlZWcVoxS2I1OEQ0NnhHUnN5bXFkaWRp?=
 =?utf-8?B?ZVp6ckVEVGRYc202a2drMzBKbERBbDU4NFNMbXVmMHN6S3Fld2M2TE96ei8w?=
 =?utf-8?B?UUhVWnh1SldBaHF2aFRibVFlUCtoaU9EUkpiVVVBN1NkeHVEZitWS3NqUDNW?=
 =?utf-8?B?aGp2UldVTzNQbHpzUzRCWlhBb0pBMVZVWHdXWjZFWUkrcm9tWGgrRjZ6SzRs?=
 =?utf-8?B?eW05NS8zMVJyVDZGamNNdjlNQVJZT2JkTGo2QjhrVFNnV1NvTlgrQ2E4ckdk?=
 =?utf-8?B?MkExYllkUUkyWHlidEVIcStjM3plK2tCNXFWaUxMQUpYWjVlV29weHk3WHhh?=
 =?utf-8?B?NkFjaUI0RmZUMFRtNThWV2lZYk5WQXZRMnEvRDNXcnZzWW1oNE0xV0FHVkpN?=
 =?utf-8?B?Vll0NGNUMlRCdWpOOXZFR1ZwSFVGVVJrYkw2b3lVemNZV0c4eGkraCttZVU5?=
 =?utf-8?B?YWR1dDdjQnpXWnNMQTYxWVNucEVuZ0duWGVuRG42ZFc1NDI4ZlIxSWEvVmpq?=
 =?utf-8?B?Qk16L2g4S3VNQTJmQ0JiMStjVU5heXFMb1pVVm9hbDI2YXYxL0dONmV1NzN4?=
 =?utf-8?B?Z1BQeUI0QU0xZjlrOS96MDRtc2d3ZFNZL2d6K2phVUlHRWVzb21IcVNRNG1m?=
 =?utf-8?Q?UYOw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjhMa05JMXlpUHFrMDFIb0FhR3hJa1Ixd3BjcGl6cTBuTEU3U1JqNEZmanhx?=
 =?utf-8?B?V1NLakJGd1RtejViYmpFcG9ETmdMeElsNXFGWTBmTUN1UGw0UWVPR3JxMmlV?=
 =?utf-8?B?VVBuNkhSOFlrWWpwd3dlLzBxNHdjWGEvTURUVjZodWxKSlNubCtxUldiNzdK?=
 =?utf-8?B?Ulc0M1QzWVl6N3RIZ1ZCQ2doTnl3ekZtVFVGZU50TTdJT0xSSERwWWwzUlVZ?=
 =?utf-8?B?bzZpd1ZMUWRzRW53UlR3dHVKU1lmQ0dtOURQY3RSajdYendnTldncDg5SW40?=
 =?utf-8?B?SElYRlZvOEV4U2NzOTdXR2d1RHlZZDJOK0RXbHlxOThnRGtpSnA2RlhEaUdU?=
 =?utf-8?B?T1Jaam8zSWpURlNhUE9KWCs4TnFVTWwveThpTVVGNFlacHhmWE9NL0h3cG15?=
 =?utf-8?B?NTNwVWpaVjVXREVHVjhlWFFxSng4RlBNdU5VTWpTdjk1eHRib2huRy9DUHQ3?=
 =?utf-8?B?TnJpemRGR20wQnZNVlFibjhWU0JPUmJMNGtXSjRxcnRMUHFBQWhBclYrYjFz?=
 =?utf-8?B?Y3JOUHFrd3FNazFHVTFIK0k4VWFKcGY5R1MzaEtlOUlsZ29yckh4TVRMUFRy?=
 =?utf-8?B?cUtNZnQ3UTk2YmpPOERxRjVZTkFkN2R0SFBCM2Z4TzJiRUc5aFg4TFZ1TWlh?=
 =?utf-8?B?TVBaekhRYThXdDE3Tm1RMURYdWE0Z3lmYU93MEMvdUN4VFA2TG5aYmNERGgy?=
 =?utf-8?B?ZzFlck4wMGJEeGc4VWI4RXhLdmxFZllpc2JQYXNjWnVLNTlvVGtjbWRwQS9i?=
 =?utf-8?B?WHM1QU9idVB5OXBuVUtGZGZTN3VOSkVCTFk5SC9jMzlySnNPRXczVy9KRndi?=
 =?utf-8?B?b05lWUVwaldicnFmZzJrdCtzdXBIK2V5UFpBc0F3WVp3NzBsaUR3dWdLdDBE?=
 =?utf-8?B?cjFQU05lakMzc2RxWmplZHVSV2lObkk2YUZORkdMVjVza1UzSFVVSEtWWEpn?=
 =?utf-8?B?VW1OclNDM1ZuV1B0Qm1QT01TTnpKK3VoY0gvaEhlQXBDMnBIRzN5b05EMnc0?=
 =?utf-8?B?aElIYXVOdnVYb0tMVHdMQWxZcXN4R2dlakVVNXl1bnlEYzg3dnBONDJwVFVv?=
 =?utf-8?B?N1d4bVkvTHRnLy9iWG9kdHp1a2tUVDdkUENzL1JZS3FBS1BBNEZmeGl2S21V?=
 =?utf-8?B?eHFxQytpODZNc2V6QzFYbzZJOFFGVitWakpVLy9ZQTRMcVliNGhKOXhNRFhQ?=
 =?utf-8?B?T0JCRTlsL0ROWnZ6SlRhdTEyeGNrYThaYVZvbSt6bHRFK3Y2RlBPd3pNVTIx?=
 =?utf-8?B?SFFZcmlBUjdsaTFLME1Db2RlbWxSNVQ0RXpPdGNPQlFNdjlBTUJNRXpIdzVp?=
 =?utf-8?B?UEk2VXJpSGZvMm02NjkvYVZrc3ZyQnJoZThkNW1lcml2akNOaXNSZkZpWlVH?=
 =?utf-8?B?Y2Izay9xSjlEZ2tHcURZSTRVbWhWbDFaamxJZE9idWhMakRyaE5CUXVkcnpn?=
 =?utf-8?B?ZE1OOHYwa2NoZnpTZmF0SFlmRUdzak1tS1FHZi93NHM5Tk05VTRsSVZyNlkv?=
 =?utf-8?B?TWpoWFFaQWR6MThWbEVmUHdFMlg3UlZFTG5ySEV5U1UxUUszVnYrSUJVREtn?=
 =?utf-8?B?Z0FiUk5JS2cwRlZwNXpvdklzdTJ0N2FCdEJKRXcxNlN6SlNJQmhrNWp6LzY2?=
 =?utf-8?B?RmJnbVJKVGZsK2NIQU5CR011MTZJeTh5UXhPVVpMSVNnTXZIS0xWaEVMYTYw?=
 =?utf-8?B?ZHo1NVNNVUNUbkpITFNTV2hseTRDUzNyUWxBeXlCSXN6Ny9RMzlwSDU1c1BF?=
 =?utf-8?B?amw3aDIyVG1qdGZ6Skt2YWtYQ2dwUUp0dCthMUZacDhSaFNMNFYvUjkwSkpj?=
 =?utf-8?B?RXNCb2czTkR2azNRU055ZkVDS0hOV2pmNTZ0TldnNG0rb0tjc1dnd3Z3ZmVk?=
 =?utf-8?B?UXBNTzZERFJUUU85MG9HS2JzbHZRT0JWbkh1SHpQZm93Njk3Ynd3OUVxVVps?=
 =?utf-8?B?ZkpCT0pWNmFEYkpiRE1rZWVmOWpocWNUY1lDSnd0ODlOUjJWUk9KcTVVWHlQ?=
 =?utf-8?B?QmpPS2V5MTJibGdvQUpNcjIxbytRVEdoMEJ6WTBQWC9VenM4N3QwNlNvdEp6?=
 =?utf-8?B?YTl3cEQ3Znk2Ujl1djc2SStmTXh4bzFGOHRoOUYybjlKK1JkS3BMS0hTRWNL?=
 =?utf-8?B?VjVXeHNQL3RnT1BRUG13M3RNbjhKei9BUEYxTGxDMDdYaXQ4MmNHWE5pWWdW?=
 =?utf-8?B?MXRwVExLVm5OWU42N1FSSlhSMitiZFRqN0V4Vm1CenFrRVZQd3ZGN2tRMFFG?=
 =?utf-8?B?SUpOaHp6Zmg1Y0RUemw2ekFFS2xTMGRrOWRScmo5a1ViU3RtNmhHR0R5T2lQ?=
 =?utf-8?B?TW9wanhzOWEySTdMRml0bS94dnlrcm1Tb0VvVDlmMEtha2lUV3pUZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0ca06d1-451e-40c7-91eb-08de5d9c007f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 12:02:53.9257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VQZ8vT0kR1a+usJE+/QG7oTdDFoxwg1cg38YBv9XPzSLMu1V9tDFe/Jmz5ZelVuLH2GBpUKBcUmqMeNtPSBQWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5066
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

LGTM,
Reviewed-by: Jan Maslak <jan.maslak@intel.com>

On Mon, Jan 26, 2026 at 01:15:35PM +0100, Zbigniew Kempczyński wrote:
> This reverts commit 071bf8edb91dcdf6b8bbe0c5d301477a39c5ccb8.
> 
> Xe platforms even if doesn't support flatccs still can handle
> compression with aux-ccs tables. Rollback change which limits
> the test to flatccs only.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Jan Maślak <jan.maslak@intel.com>
> ---
>  tests/intel/xe_render_copy.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
> index 861daec971..e2e752e28b 100644
> --- a/tests/intel/xe_render_copy.c
> +++ b/tests/intel/xe_render_copy.c
> @@ -710,8 +710,6 @@ int igt_main_args("dpiW:H:", NULL, help_str, opt_handler, NULL)
>  	for (int id = 0; id <= COPY_FULL_COMPRESSED; id++) {
>  		igt_subtest_with_dynamic_f("render-%s", testname[id]) {
>  			igt_require(xe_has_engine_class(xe, DRM_XE_ENGINE_CLASS_RENDER));
> -			if (id == COPY_FULL_COMPRESSED)
> -				igt_require(HAS_FLATCCS(buf_ops_get_devid(bops)));
>  
>  			for_each_tiling(tiling) {
>  				if (!render_supports_tiling(xe, tiling,
> -- 
> 2.43.0
> 
