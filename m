Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE67CAC58F
	for <igt-dev@archiver.kernel.org>; Mon, 15 Sep 2025 08:05:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BDF210E33B;
	Mon, 15 Sep 2025 08:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QEH/RTkX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFD310E33B
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Sep 2025 08:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757923522; x=1789459522;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1e+eVqQfR+u2NaLgnKohTPlMGckPqikENJ6pzz9IpuE=;
 b=QEH/RTkXxVpv2H5x/KQRoAbM5gh0kW4tmMvxULgKUgmwuq1v0Vj6hr0E
 X4NHC0cw8RhX7RAt07iEb94gLWrMwMtX6jiDXSjJocIsEtLsbBKMyT9Ds
 R2prZw4HzrCvut5S5n0ty47P4johUWddSSJkv8FLtQJCvae3Ky6dNqW9O
 9oMa42oJ26NdI8xaMlNgsTqMSYm1mk/9YDYVitB0KCaVIizg/J3TBRfNs
 lbnyTKUoQi/ha1IHbYfwnpLkIczYQEBswy/em1Z2M9FMNLWGAg7lPizK0
 A+dDc/uWbEJl1AN1X86oPqy5Zu1wkOxOBfqOo7fZX8bJJXF/auyNrQ/1Z Q==;
X-CSE-ConnectionGUID: cerXrTi4RFaDKkecAq7b9A==
X-CSE-MsgGUID: t/rC3IUORES9gWE0mnnXsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="60273886"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="60273886"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 01:05:22 -0700
X-CSE-ConnectionGUID: +CJNelvGRgu+sgXytFG3+A==
X-CSE-MsgGUID: klavK+8kRPCICplpt6bodg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="174154803"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 01:05:21 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 01:05:21 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 15 Sep 2025 01:05:21 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.59)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 01:05:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyJDii/ShgNnKjohCzx67f9TK4gUeACXKNIcO+lE6JHTW9uBKBe7TAgBr/Z5cWMdw2OkM5gyTM/sab1ZjZezmr8bB/3ASFCHc3lk33tIRKV3SCK1bNZG140GppASepsVKZmjx7Ffbl+NhIc1x5Tc0cpCJqmX5hewJu2eEspaXaxMZ/yziUmoAdG6hejVZ5vmrZlTUmASZzC0CtjCEqE153shI72HlfMCSd2sLSI0+aUW5tx7ZWLJyk6O2Ibb9Ab96x87/b211Q3F0gXyCRPchvMqE6bkkmtWfahAbBmce2J26/0kUJlwqHkireZ+J4l/Q3J877L494jMqLGY41nFjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxnpo34tI7vn5H8NfqQeUDQSeAysYhjex+2v9EIJ53o=;
 b=WzPu6poT3SIRTE2LGilAdy1apOnrXzB1vzriITn2fGqbRegwiIw2f3ciAkar9heOyMGUd3r/eIdV2FbuJX7M2cOtlG6YiwJRpdiyNhm4gRnLo/NpMnuhQL/7veIl6XkjBHJa/ce13wNTVIPBGk9XUl/jxeo/SmzHgD8qXBQdomHH/HXoHCKzwm1Ne3qZAjIr2YwP5f0WeUKilYxTEVyOu+pCuPb9+PoA7gj9E2v+orZLoZ6sTAmu4B5nKtagux3+eYBf48OPZyDDf1jAgyxAdx6pk9Ae5b7CIpEd3PKywrm4oDTeegwtPUXxnkN167ORkozTO4rW815O+K4dOKhODw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2760.namprd11.prod.outlook.com (2603:10b6:a02:c0::26)
 by IA1PR11MB6076.namprd11.prod.outlook.com (2603:10b6:208:3d4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Mon, 15 Sep
 2025 08:05:16 +0000
Received: from BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7]) by BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7%5]) with mapi id 15.20.9115.018; Mon, 15 Sep 2025
 08:05:16 +0000
Message-ID: <3f4811e4-8f10-48da-8d6e-229eef9b11fd@intel.com>
Date: Mon, 15 Sep 2025 13:35:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/4] tests/intel/kms_mmap_write_crc: lower rounds in
 simulation
To: <igt-dev@lists.freedesktop.org>
References: <20250910090059.351698-1-swati2.sharma@intel.com>
 <20250910090059.351698-3-swati2.sharma@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20250910090059.351698-3-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0091.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2af::9) To BYAPR11MB2760.namprd11.prod.outlook.com
 (2603:10b6:a02:c0::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2760:EE_|IA1PR11MB6076:EE_
X-MS-Office365-Filtering-Correlation-Id: 705905b5-99d4-4d0e-85c1-08ddf42e9af7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blk3NFBqbXVLMG04Q09URWhKSDhiZnRHMFJUSUdhOFU1TUJPRUxTUnVqaWdI?=
 =?utf-8?B?VUxTZjNMZUd3VE5qMG9JS3UreUtObFlGU0VEQ3BKOGlabDhSYm1DSjhKMTZF?=
 =?utf-8?B?Z2Rac25hcEJwZzRhVzM0Q0l0SkRyUTdWU2F6cWpGb1ZpRmZxa1dIRExrWG50?=
 =?utf-8?B?U3pvelowdjN5RkQ5M25ROTNMekR6a2ZVdDZvZUJST1NlNW5pbmFSbVRyZVJV?=
 =?utf-8?B?c0FWWlFGaHFjQVlxVWFpVEQwbTNiZHRZVUZ2MU03cXdCbzNKb2ZrVjJSZXBl?=
 =?utf-8?B?ZnJvSUlhSVhxLzVjY2t5cFdodU5ob3hLeW5DU21UZXNOdGhhYWdrdjRBUHIv?=
 =?utf-8?B?MndvT2w4ZU5iV2VxRUsrL01sc0NMa21jdGdkd2l3c2dBVE1Kem1PaEtNa0NL?=
 =?utf-8?B?MUZ5NmlDRTRnUlhyMlRrWW5va3JuUjQ2OC9veVJGZU83Y213NEp5N0N1Vzdk?=
 =?utf-8?B?eFNOQkowZkdQZk9WQXl0Mkx5WFhFaDJEby9TK0tnV1VuZWN4dWl6SjVvU0ZW?=
 =?utf-8?B?Y1dEcGlvTlV5bmlhK0dha3p5ZnVuektXQ2VGUlpBWTRONmpjM2ZCM0pTcmd6?=
 =?utf-8?B?YkVMVkJnMkVXQlM5Qk9zRjRMS2J2bXdkWEpiUkVJSXBzaklZWG1waG9ZS0l3?=
 =?utf-8?B?RDFhVTBHMlhwMzVYV1V6aDVFMFg2VTR2eE9vWHcwbVdVVlpoem9WdGFaR1Jy?=
 =?utf-8?B?TEl0RUM0UUtDeGVvYjhnK2RZTjBNQlBzbERmbHdodXZkYTJjMTV6Skh0SVJG?=
 =?utf-8?B?SFhCM0VaamMxZTYvcmNjR3ZRdG5Ud3BtSVYzdkczSUVSZkswbUx6ZUFnbGZW?=
 =?utf-8?B?V2VQYkViUW83eFgrU2VQaVRtMDVKcjc2NFJXM1VMeG55ejFEMEVGUHM1c3VN?=
 =?utf-8?B?TXhtdjdEZ2gxZjlxR0VuOTZQcU1MemQwNE5WN3lBSVhpSHgwZnZQR0EzZk1B?=
 =?utf-8?B?MEJTSWdiVUNKY3BCeURVcFdTMDBzMkJsd0ViOXk2cEtwbFpDVVNKd1lQRGxQ?=
 =?utf-8?B?cmhsU1pRU2FBMFJCeitJd0I4aVd0YlByTkhuV2lrSFdmQnUvVWtZbFg4Wm1t?=
 =?utf-8?B?U21uSXdsR2NYbzVzTUFlSVBJSnRGU3FzMG42bnYrcEpkSW5mcmtWVHJnd1BK?=
 =?utf-8?B?aG5wMHgwNDBUSy9qWmtCTFNVL1R5WWJoM2ExeTdHSUJGckN2YmdsbEYzZ0pI?=
 =?utf-8?B?TG1zanZ3UXpsTDJscmM2NHdCa2xzRFVuMldrK2h5ZzZTdjVrWVkrMkw0UWQ0?=
 =?utf-8?B?Ujk0anUyMmxNb1h0N3l1KzREa0tmSHhYelJISkVIeW4wQVJKS1doYlFOSlhF?=
 =?utf-8?B?cTlCVTVPckE1OC9HTjlwL0picHN6TURCQUM5dWR5S3Y2aVA5L2lpUkw1cWZJ?=
 =?utf-8?B?eE81V0I4V21TL08wLzZYQnlzaWh3czB2c2gzRC9IcTZVR0hBY3plKzFyVjg4?=
 =?utf-8?B?K2dtV0ZETmtpMExVU0FGWFBjZ3dSZXpTMVVNaHh2K2Q3aXJ1VTNIU0pvL1Ax?=
 =?utf-8?B?NEVwOTdaVXlZTkRhcERERHlOR09wbDN1RXl6dGlCSDZKdFZSWEw1WFpyMjNn?=
 =?utf-8?B?SzZuQmtrMFE0ZkZxemVaTjR6cmx4M0tZbnA0cnlMZ3V4NDdqZUp3ZDNBS2Nt?=
 =?utf-8?B?WGk0UE9SQlJacm5wYk9hOFlmQXF1UVllZUFpQjBvODdGN2tPNnRKczR1bCs4?=
 =?utf-8?B?YXBRcmE5MERaV25JczZuL09NcHJjUitySWU5MkZaZU80b0tsVk9WNlJWQ2hr?=
 =?utf-8?B?akFtenZhY01zMjNnUnI5Qk1MeHArUTE0V090REh0Yk9CbElHeDJ3b3JTbHFQ?=
 =?utf-8?B?WGdDYjV0WklDTWF6MXk2RW4zUlV4bHRwR1Rnd3ljaXJaODdlR2kwVk5WVXlH?=
 =?utf-8?B?U2w1aVVJUHdHTnpPck4yRG1qcXVYK0pFMU1ldnFYeWtZZUI4YldoN3NCSjQ1?=
 =?utf-8?Q?8hWQ+wHXrMQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2760.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmFrSW83MXk5WE9nMURVSTBJU3pDUVNnYTY2ZjhZYTJhbThWRzBCSkR3L3hG?=
 =?utf-8?B?eDY5K0IrOHYxVVRpMHh6ZUx6UXpGNUprSU9yTVp5Z2phMkFRLzBnS0RPdUNI?=
 =?utf-8?B?RFk1Wkg4STB0RXViQ2FBMmp1aTdhQXJpOWJMeHBVaEdxeUREQktST0hlRFRW?=
 =?utf-8?B?L3o2cFFpYXAwck9rOG95TVU4RCtveXVzZnlsTDJ6bU1lYUpsaTQ0VENGdGFD?=
 =?utf-8?B?T2NyUnFuL2UvNUpMako1VHo0R3JlZmovL1FYVkFCY0NPdWFwbkp6U2tuS0M3?=
 =?utf-8?B?eTU3dXJ5N1d2T2IzckVKNk9XaUc1S3B4SXlLcXRjMkVYU3FlZ0tLVUMzaUx1?=
 =?utf-8?B?WGFCV2dSeW9xeVRFSUZiNmg0alI0cG13WDIwQldRZWUxMTBDUmhtY1dlRTgw?=
 =?utf-8?B?RlpESDJrQ216b2VNVnVHZVo4Wm13MGxCTE9vdGtFeGFzVG8reEZwR0lVMG1J?=
 =?utf-8?B?NWkyYVRvU3pzTXlCQTAzcGtMMTFsczJGSzJUdHhCWnJFWTgwenZxajQ3ZlYz?=
 =?utf-8?B?TDZiZ2Q1cnVGU0NQQ1NaTlUrKzRmYldkeUkrN2NleGlyQVdYSE1tTXdFNDZ6?=
 =?utf-8?B?QTB1cEVMdVJyd2F1aVowVzV1aXE2Z1dHcjNMM1FPdi9NNDU2enZtWVpnSURr?=
 =?utf-8?B?Y3VhVk9XV3JKajB6RFVtZGxVbWZ0amc3VWp2NWVLMy9CZnVNcnFOVDNMNTJv?=
 =?utf-8?B?bkZ3eXlqMU1xTmw5NGtxS2Jqcmg2R2xjNGh4ZmNXVlNaTCs3dEJBVUVUK29O?=
 =?utf-8?B?VnpxVmYzVCtDb2FFM0doQ1VsNDhCWHRjU0tOamNBbkRwRi9JTk1VR3htck9W?=
 =?utf-8?B?K0E1T3VrdTFWbXZoY3ZzQTBqL21aOVIvdHlHa29FSHp1c3ZxSUVOMmttMnhJ?=
 =?utf-8?B?QjZuKzZSR29iL3JRakhhS1JMTnprTENrQTBRUHROQmJwK0Vtdkx6MTBDQUlP?=
 =?utf-8?B?ZVk5RHUwWTZyVlVseEpiWEVycWozby91OEdkY0p3ejFMaWt0QzF5VGhGdEVx?=
 =?utf-8?B?cHg4UXZMUHVWL01YcVVzY3pkWmFPUDFjVlN5aXBrSk9sWm40ZU93VkNPOGtU?=
 =?utf-8?B?U1dLeUtManFxZmFzeEcxbWptY1Q2Y0hFdnBxMnpHU1NwalowS2dUVjV2UDJi?=
 =?utf-8?B?LzNUcW9zQVpTUkpqVU9wTFloZWJGYXhmekdNQVFXN012VVJQMW1pc1JXaHhy?=
 =?utf-8?B?b1JmN21vNWp3VG5ITnExYlJCTWNTMXV5WUZvWklyUkZwbmx1ajNkdjJjM3pj?=
 =?utf-8?B?V1NQTWxRKzJ1TUI5cVA3TENWREsrc0RRVWk2eCtUejFRQjNoT3picmsySllC?=
 =?utf-8?B?eDJGV0pMenc5ckUva1htS05OV0VwdXBIYTBvTHpkbzZNWnRsRDlRZm5PdHI4?=
 =?utf-8?B?cTZEZDFZSytyOGd6bVI2UkJSbCtnMTVFOUpXYlBWM3NWVTY0bFc2a01nUVd5?=
 =?utf-8?B?aC9BNkNxSnhHY2g1cWVyUEZKRCtIZjNjNkhXMzBvUkpnU3hjekQ3KzJka0VZ?=
 =?utf-8?B?MzJGYmVDa3dJOC9UYmJ5NW9ZL3NoeHZlMUwvdFo0QVQra1hvMkM4eHozSEFD?=
 =?utf-8?B?LzllRlZYWldYSFNVbGhFZ1pZVTFGNVM0NjFHMUx4d0R6NndEK1gxNlc2Yzh2?=
 =?utf-8?B?SklHWGVXUzRKNkRJYXY5MkZ2RDhXbXo3clpwaFlRQ2lJQ0ZTQndNMENTaTRo?=
 =?utf-8?B?bHIydE1VSGZIMDAwT3c4QUhYRXdwV3I3UnJHWlpjUlEzRDNJZXNLM3BIOHJt?=
 =?utf-8?B?eVZ1bjF3a2l0cVhxRStJVVZKcHpIM3Vnai9FNXhqNytkUko1Q0NqR3p6VVF5?=
 =?utf-8?B?K0ROMnFVTjVTWldIV0lBY2RBYkswTDNkL0svaGJGeTl2SEF2eUdtaENveXIr?=
 =?utf-8?B?aE1MemptTHZyYTNyenhCaVI1cWQ5c2dRVTh4Uy8vaTk5bmU1YUJ6UUNpVlM2?=
 =?utf-8?B?VTVabXQ2bHpxMEdDOG85SFRLUWttWXYzZWRoeHQ3ODB1M04vdTFwS2hJU0pJ?=
 =?utf-8?B?b2FPbnJTNTRNdEN0V3JzWEtyYVduaWxRaXFNRHpuVTRQak5EbUptUUZFTkRV?=
 =?utf-8?B?ZjlYbHY0YnNPNUJFNGxRbTVDQVpMWUxOZ0ZUUUNnU09UNkhoVXNud2JSWnJz?=
 =?utf-8?B?TXhENEpHb1BseDd0dFloNHZFb0lrZTRTcmMzaURlRkVReU9TbFhueWRDb0l6?=
 =?utf-8?B?L1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 705905b5-99d4-4d0e-85c1-08ddf42e9af7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 08:05:16.6709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RwifTBWv68R22JBMh/KnAlwyMNXsEcQufdTXQqTBttym2mxEIBI4owgYr584LGr4HfqoZwKPa/gGAsM1upw1LjtMw+iZ/5txJBYyb59033c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6076
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


On 9/10/2025 2:30 PM, Swati Sharma wrote:
> Reduce iterations from 10 to 5 when running in simulation to
> shorten runtime without loss of coverage.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_mmap_write_crc.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/tests/intel/kms_mmap_write_crc.c b/tests/intel/kms_mmap_write_crc.c
> index ddc5ed63e..01fa998c4 100644
> --- a/tests/intel/kms_mmap_write_crc.c
> +++ b/tests/intel/kms_mmap_write_crc.c
> @@ -55,8 +55,6 @@
>   IGT_TEST_DESCRIPTION(
>      "Use the display CRC support to validate mmap write to an already uncached future scanout buffer.");
>   
> -#define ROUNDS 10
suggestion: Instead of introducing a local variable to determine the 
number of test iterations, consider embedding the conditional logic 
directly into the macro definition.
#define ROUNDS (igt_run_in_simulation() ? 5 : 10)
> -
>   typedef struct {
>   	int drm_fd;
>   	igt_display_t display;
> @@ -271,7 +269,7 @@ static data_t data;
>   
>   igt_main_args("n", NULL, NULL, opt_handler, NULL)
>   {
> -	int i;
> +	int i, rounds;
>   	igt_output_t *output;
>   	enum pipe pipe;
>   
> @@ -280,6 +278,8 @@ igt_main_args("n", NULL, NULL, opt_handler, NULL)
>   
>   		data.devid = intel_get_drm_devid(data.drm_fd);
>   
> +		rounds = igt_run_in_simulation() ? 5 : 10;
> +
>   		kmstest_set_vt_graphics_mode();
>   
>   		igt_require_pipe_crc(data.drm_fd);
> @@ -305,10 +305,10 @@ igt_main_args("n", NULL, NULL, opt_handler, NULL)
>   				data.output = output;
>   				data.pipe = pipe;
>   
> -				igt_info("Using %d rounds for each pipe in the test\n", ROUNDS);
> +				igt_info("Using %d rounds for each pipe in the test\n", rounds);
>   				prepare_crtc(&data);
>   
> -				for (i = 0; i < ROUNDS; i++)
> +				for (i = 0; i < rounds; i++)
>   					test(&data);
>   
>   				cleanup_crtc(&data);
