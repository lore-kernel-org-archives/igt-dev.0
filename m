Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9C6D1039D
	for <igt-dev@archiver.kernel.org>; Wed, 26 Nov 2025 10:28:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966E210E5A9;
	Wed, 26 Nov 2025 10:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pz17MhH6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F43110E5A5
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Nov 2025 10:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764152933; x=1795688933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=e+L6R3+uYe9fWYYrzjiXv/bJ+o1OQCgz2NwfyDkyDi4=;
 b=Pz17MhH6txYokJeJb96rxv+mxeLg9py+3yiZm6WnJbI1pUXLr0Cof3LX
 DugerDJqjaPy/bhzyxsGlMO4gRtCSb2XC8v0hVhh6gRxBYlmsIpCpafiw
 bfPULvH4NJJcPyXSqp9OA3qIZuAWNOmMhpMW2u7Fq+IZ8votNkD5Ibg0R
 bCLLIhu7W3IgLhnH2iZzQUbQWMR8RzlOMjd1MBsu0qitd5i9BkTxvT7Ut
 87fB6E23HGQWVyra7SjwZxBnmRzbFVGbCtojLNdSaDkqHWM53GCVMpiiC
 /CND+kxVtBUch47xWIoeA85JwSdR8x6LC706+f1dUCBxuAoa9dVVJvWkZ w==;
X-CSE-ConnectionGUID: rpwCRrlyQEu/aakr9TnSuw==
X-CSE-MsgGUID: aWIomlOPRUK+4BCq/TcptQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="77551133"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="77551133"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 02:28:53 -0800
X-CSE-ConnectionGUID: 9DK1LzssRGaKH7sjxqB+rw==
X-CSE-MsgGUID: NtIkvj5zRQiqqj7n5B7hwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="192922552"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 02:28:54 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 02:28:52 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 02:28:52 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.7) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 02:28:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CP2+8xG5w+c+rMarTmdF0B/VWpGhrqFg9r0zJfV5lpxSTfz9LlvmiUmQATXYlCIUpsOw0jM3MJD2Rol0Ywo3QyrJfrPsKlH9T+Hq6UH8pMkPdgrqWCfa4LF/PVU0Z/RlDT9RVwqmhj2uoSlmMo9OVQYpaH39qrhwFA++POaja5js+ofFqXaR+Gt6LPzPfIROLAI5TY18u+zyQ6edIYdG5iEBZsc0pKJ6K59TlqLnf/3Ug3cbmmmGTsHD3ztBPl16zGh/oUNwod0fZkfKXhI5kh776b39yG++lSvomBEJLwSkF2Ogrz8w7ZzYCI7UI4OhBDT1PtdpLgU2kHP5PzqQjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDaNPEw8Iok+nnlamWD8mTapTRm14Icws8TAzAGGPDk=;
 b=MH+87znFYnrwh5N/CEO6UspZDAQyN2xSguIQwu3HlN0WjD3KGKg8QcT7uFt2n4S01xzVu2D+CGB6UIGc9C8FhYxXSMQ0TFbDRp8hxoLJt8DH5Wefh/0o0q51k5yO+wyfdW8eFV10DuY63X+IRrHrUPqAa8ZwiJ5fMuU0lUikq4jRKqkZ3wxKKXhSL/W1KZStbkG4fYjqyN6Q1TT8luIGqdx78sulIPfHeUBdQHSB+U1Km3ZGS3+XSJBZr7YmfOY7xUqSZOxNiUujZ+aVhURicwNZRYOT4zPcYZephCXpLnxiybuuH2EbXPEe9v1MCWLb7xL7+1j7SqeKoiCrb4LO3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CH3PR11MB7722.namprd11.prod.outlook.com (2603:10b6:610:122::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 10:28:51 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 10:28:51 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 5/5] tests/intel-ci/xe-fast-feedback: Rename xe_debugfs
 subtests
Date: Wed, 26 Nov 2025 11:28:27 +0100
Message-ID: <20251126102827.47844-6-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251126102827.47844-1-piotr.piorkowski@intel.com>
References: <20251126102827.47844-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::18) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CH3PR11MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: d4fbb5b2-363d-41d4-5d50-08de2cd69789
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXM3UHFJMkdlajNjbWpKT01pczJMWmp6bGFkbUlHZlM1Ly9ROWNacXRDYXg2?=
 =?utf-8?B?cDNXY1lOTXBCRVdhYjJoUVIzUXJ1M0E4VHpZaHpZLzZONER4UTl0cTI1MG03?=
 =?utf-8?B?Z0dUMXhFZ3JiTy9QWjIreE1jbnIyTGdqaWllaDZ0bnc2TVFXcTNvZS8wYkRK?=
 =?utf-8?B?ZFlkQVp2RDJUZEpVRWRIcVdsbjBxd1BwNHFDbnErb0dvbkxtYkhVTEZDQWZq?=
 =?utf-8?B?WS91QjZYZmtFWmU1S2MxSkxCMG5QLzIwWDNiZ1RLNXNMMEJHeEg1UGlWOW5J?=
 =?utf-8?B?OTZGeFJyOVBxMkYyRFZzb3ZDalZ4MU14aTN2RnRiYnFHQm9nWk53L2p0eVkz?=
 =?utf-8?B?NnZDQUQvcXFCYlFYenQvcXp5SXdUTUxyL3J2bitQMUVJMXZvbTlsL3NjSEE4?=
 =?utf-8?B?eGFIRkhrMDEvY2xZazVUbjViOGQ5Ky9raSt4YVdWMWw4dHV1Y00rOE1ISEpw?=
 =?utf-8?B?RG9tWnZjWm5FUDgzNndoeGpKb1F4UlB4bDgzL3NDUzYxb2FqUXRWQU56N3pB?=
 =?utf-8?B?Nk1PeVZOLzdkdkM3aUFmMk9YallKdGpoU2RseEtLQ0V3UlJnYVRTeE80a3Jj?=
 =?utf-8?B?dlJNSVhEckRNcWpzdGN1ZUtqTmIyY1ZVWVJJc1R4ektvL3JsejIxeWEzUVNv?=
 =?utf-8?B?N3dBMHRCSzlGeklFMkJWdk9rdUNscVFSb3QvamovSDBwMDRYY2xyakozL05v?=
 =?utf-8?B?bmxLWjBEY0p6MG91ZmFxQTdwSnNaNU5XaVBZOS9VbGZKNFQwUlZkWkpmOHZL?=
 =?utf-8?B?aDdndFRFQzVCRk5Vb3dlbEpuYjg0SEJiMlRlRUtGKytyZXZuUTRTTkNRMkx2?=
 =?utf-8?B?cC9kM05UdXFsM2wrd0ZiMlE4Vk1RbFBCc09pcVZGWDhPNXJoc3pWbnU4cUx1?=
 =?utf-8?B?bVF5Vkt2WlpuU09nbys1VEwxc0xTZDNibGJ6RXFhdDVNRDBIRXpNVXpUWUUr?=
 =?utf-8?B?RitodEprMXpjQXVndmt2bEZ0YWJqbHFHWThpalVWT2tYeVZ2SG5GQ1RnZUhr?=
 =?utf-8?B?aTAwWUZxTWIwQkJCWmhoOGVaS2VpUEpQOEpWdlJOYWZTU0FvM0R5OFhneVR4?=
 =?utf-8?B?RGpzMVlwaU5QQVRpcTRYZHpPbjRZU1dNTkhocFdKOUtuSlhIUTRCeDFjVEc1?=
 =?utf-8?B?ZCtFRi9UbzVQWWYvK2RCckQrc21SOE1IejdzcjZjRnA0bDhleWtLOUJKWjBp?=
 =?utf-8?B?dS9MelNEdWtEMmY3YUhYVkxYQVUwUGFNTjFYRnlFcDliaEh0VW9MNURKOC9I?=
 =?utf-8?B?eE5lcExrd3JsUFhWQWlBRXhyL05WSnBFckdwNW5mYkJYd21sYmt6VURqQjdI?=
 =?utf-8?B?V3BkS2NCSlc5MTJ1VHoxMWNYYlZCSHcyenpaNWttZS9PTzNjNkR2bGJnUmkv?=
 =?utf-8?B?b2RUWUdaTUd2SVBiQkM3MWNmWVR1aG5JYVYyOEIrV2JIL0ZqUmRyKzd6M3pi?=
 =?utf-8?B?VENRTmlicFd5cFM2QjgycUl2c0dFeGxHQSt6NTU2cmd5QnVpME0xcVZPRXpJ?=
 =?utf-8?B?Y3NncVdLdzR3VzdhY3RPbGdOVWp5cTRjcG1lMUErRjVuOE5CLzNrNCtEUXNs?=
 =?utf-8?B?dk91czFORmFjM0V1S1pnQnltNC9MZXBWeHh1TndySFRaZktKY2hpL0h3TmZD?=
 =?utf-8?B?aEMwTHM5dFRrRCtUZ0VWeFo0dGlZd2p3YnN6TEtTcnh3RDF2aTVKbUFra0JK?=
 =?utf-8?B?YU4wa24vYlFURnlwSDdVczAxdTI0KzlYNk8zVEtldnowWTBBc2FzbjZ1bFZH?=
 =?utf-8?B?UDlPemVWWUNLZSt6NHZ4RkpqQVc3c2NSb3Q0V1ZnZVV6WjJkaDRMdGlXNDNQ?=
 =?utf-8?B?VTlPOUhaL3N0dmZBTWVZMG4yc1ZoOFRTOVl2WUNCSlhWcVpSblJzd05ZOHY0?=
 =?utf-8?B?U1dobytOTDRobDBQN0I5WUNxTzlTd0J2ZHlMMlVWc0s5OVcxOTgzZ1JiRDFQ?=
 =?utf-8?Q?kGtpqek8lTlvK3BI8EtKkiCGDQDoM8Qb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWxpK0R0bmtGUnBLQ3Q0R0IzTHVSNlNoY25BNUpuMW5tQzJzSXNNaGltT0dY?=
 =?utf-8?B?RXJRWkNkWmQ4VXRjalg1NVlYN1h6SW1qTHRibWRtSVdOYm9TRHBUa3JnbDh5?=
 =?utf-8?B?RjBkSVgvSHJnN0d5U0poNmp5WHhLTjBFcUNDdExaaTlNaC9KaVJEYjJjMzFD?=
 =?utf-8?B?SzFkWWtMMmxuekVuSjZ0WHFhemVuM2t6WnNWQmJ0V1RRcEkxTzc0aCs4NHh2?=
 =?utf-8?B?UmMyR0l6bGRHOTNzdkdGTGR0RzNLYzNpbFROS09hc1o4OU02S1M5S1NOd3k1?=
 =?utf-8?B?dFBLdzJhcERXbFRMS0JTSnVoM3NlejFXRktxZ1RqZUQralY0bEtHSXBHa0lC?=
 =?utf-8?B?RTFkcVZJZ2tGS1N4VXhQTEVtSUlmTVg0NFVwRCtzdndKb3owbGY0aXV1dEMr?=
 =?utf-8?B?L2R3VUlqSzlhWmYwVlc0NXFqN3YxdHpBMDJUYXNVc2E0RUtpd2NxakFpSEtR?=
 =?utf-8?B?dFRSTUxobGp6aklLY3VLcUJRUUpqek1jT2FkeWRZaFZCQlNXNHFTZFp3eW9E?=
 =?utf-8?B?QTdPOW9iZ0lHUFhHUEFZRjFXbmVEUWJMNEpMc2xDNUl4Snd5dVFYOUNzZEpw?=
 =?utf-8?B?YzAvWjlTdzU4OEVSWEwrQlI3cDYxSGhxQmdrV0Q2NHZiVmgzSmlDL0xrUTBN?=
 =?utf-8?B?K2o3MUFaQ2V4UXFWaS9XTWF5eTBEa3N4ODByZW4zRDRpUitzbEhKbDU1SWNX?=
 =?utf-8?B?T2JKVzM5Z0xDeGtuT3dycFk5UnU1VzgvZFBaN0JyQ2pRdC93UjRDa21nNmdF?=
 =?utf-8?B?MThhYVoySmdsSTBFbVJOeWNNUXNndlZYc1dQODRpQVBGQ3I5KzI2dk8xb0pr?=
 =?utf-8?B?dHhlWWE0UTBjTWx3aWhnRzlXenZUSFZwYW9vRHZWZmxhUkI3T2w5K1lnVEhJ?=
 =?utf-8?B?RExaRDM4YXJHdGF4Njc0L0hwYVNyREdUcTdrd0MwRXF2M083bkZSc0RUa2dS?=
 =?utf-8?B?aUVSUHVRYTBtOUtHREY4VlB3eGpERHJqMzlRTElPSXZnMWdTYTZ1RWRiL1R6?=
 =?utf-8?B?c2lyVW1KUHc5NExnd3hBNGJocU1aY2txRUdpTmxFRWtXQ0pEYmlURGsxZWJS?=
 =?utf-8?B?Skx4MXBObzl0WWtkNWI5QWR5TnZsZTlSOEdSTVNObGo4NUlLUjZ1aTZhWkRH?=
 =?utf-8?B?eWdIejZmM01VcGFxbk5DbnhCQXJ2dTFPbU1ISm9FbmNRV1JiSFhrVUxiUTli?=
 =?utf-8?B?TW0wc0FCY1pJbmlyRUtMS3NvMTd5ZUR6UEZXaUx2ZmNOYmpwVnFJS1daZUJN?=
 =?utf-8?B?NDZvWjVOR2Zyd2pHd2VEcERWczZUa2ZlUHZva0Z4dUdaUWMyRUVRNXZXK0x4?=
 =?utf-8?B?WUZnTlpiNjkzSWJuRHNwSVVXWFd2cUFZN1YrMlVvTlp2dDVVd0MrVlBobERn?=
 =?utf-8?B?NUFMMmJ6MXlUak1PM3FhYXdBNjJSeitFcmtxdHFIbWMrWmxPUkc4TU1JRmc1?=
 =?utf-8?B?Y0IxY0RuSEROakZwdHdvcmNMQmh1bHhRTFJWbEFVR1VxU3Y1Rm40OVZDMWFC?=
 =?utf-8?B?ZDFqY0FJNkdINVo3VkdFQ2FwZzZ2cUNCbWl6STlJeEMwcjFEOEJaNXlra0tz?=
 =?utf-8?B?Yk9menMzSWlMUnJsNms2TGU4anlSeStzekM1aW9GUTBoaEg0RWdEOENvYVRL?=
 =?utf-8?B?TThZclpzbVhYRy8zUHZ4REFyYVNORWZ0bGFNbERRYWcvNVFmejJxTy91SUdN?=
 =?utf-8?B?V1A3bnJGOUQrY2VqcnRPRzFPR3BiWUNsMGEvV0hEclg5aGlVTUZ4N0gramZI?=
 =?utf-8?B?RkFyYUo5ZzlkV0dWVmlwamlUaTAzZmR6UGFXb1Bia2xqU2tTVnpJYTdkdTE0?=
 =?utf-8?B?Qmc1NkJaNGR6MWRxQ3hmQ3owaFVHVkpnWlhJMEpJV1BiOG9HQkpjVjlvQUNC?=
 =?utf-8?B?dkh6WE5GWjRvWjdsdGZkV2htYzhFZHY0NUZRYXBOWlNsME8rdEhTNy9CdUty?=
 =?utf-8?B?M2EzU0xEZUQ4ZG9nOUdCbHBlMFE2WW5WWWxRTXpLL1g2RXJ6bGJZSG9xcVFw?=
 =?utf-8?B?dnF5TkgyNENYTVhaMW1aNkdJdTdvKzNVbHVwUmkvK0JLVncyODhMcGFpYkZn?=
 =?utf-8?B?M2xGL2RERS8wbUh3N1hDL2hDd1MxL1M5amkvNEtsVk5PWWt5eTN6bWtHL005?=
 =?utf-8?B?VGxmbFRFU1ZucVR2cm1GcjZWVlMvc3A5TzF0cWZjUmcyS2RIZzdYcWpQWG1q?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4fbb5b2-363d-41d4-5d50-08de2cd69789
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 10:28:51.1130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P3icLBqwZPtR/r5xwve3UpqAGGfR9GI01NDb20IHdMnblc4w3t/hoffHKBfSstbAtVP3rNSqUj5ZhiL/Or6PJNeS5weU2jq1eaEfDqfbCRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7722
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

Replace old xe_debugfs subtests:
  - igt@xe_debugfs@xe-base
  - igt@xe_debugfs@xe-forcewake

with the new ones:
  - igt@xe_debugfs@root-dir
  - igt@xe_debugfs@tile-dir
  - igt@xe_debugfs@info-read

The new tests cover the scope of the previous ones, extending it with
debugfs verification at the tile level.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 017e3ba2a8..15fce6a42f 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -74,8 +74,9 @@ igt@xe_create@create-execqueues-noleak
 igt@xe_create@create-execqueues-leak
 igt@xe_create@create-invalid-mbz
 igt@xe_create@create-massive-size
-igt@xe_debugfs@xe-base
-igt@xe_debugfs@xe-forcewake
+igt@xe_debugfs@root-dir
+igt@xe_debugfs@tile-dir
+igt@xe_debugfs@info-read
 igt@xe_dma_buf_sync@export-dma-buf-once-write-sync
 igt@xe_dma_buf_sync@export-dma-buf-once-read-sync
 igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync
-- 
2.34.1

