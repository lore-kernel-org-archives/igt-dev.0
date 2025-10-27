Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEF9CCF9EA
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 14:15:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5596110E4BB;
	Mon, 27 Oct 2025 14:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WPQXo2Zq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DAC010E4BB
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 14:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761574521; x=1793110521;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=MHrlQRuWZ0hw1dezy17yBDApLv/tnaVhlQUwJt0uH8E=;
 b=WPQXo2ZqXje/loMLnxm+3rBDidYuMuV3QlIbP0oRdzdplhZMszCBUNn3
 KX3JMxh6JwX8OUYIXwCgXrhWME6L9YV8gn27O362Q2IuyYNA8XSmH9bVE
 fSBnEh0FNXoIi6EVcT1t1vQiHhtwIe6UL3j/ubqWvOWg1qPT1hccfSor4
 s2nXgLs2euz468yN3YkUutrfOo9IHM0BQOijQgD5MfT1Mld6Tr+Hxk2RE
 56i+P8zgXdiyxFP5kS4qe1F9oWTEPJV1Bl9edO+Rzab1WJWBIECOr8xgA
 e/c7Xo5IyEkPpQOi89+re9psP9D5S1PpyLPdWliZ1SII6x0l2cBcLQlNU A==;
X-CSE-ConnectionGUID: NHI+6FbuT/CADo8J14AzJg==
X-CSE-MsgGUID: kxYvYWojRFagaZUjQMjokQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="89124636"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="89124636"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 07:15:20 -0700
X-CSE-ConnectionGUID: x3x92ZwFQZmxzlGbdOTR8g==
X-CSE-MsgGUID: /lAWWLOKSAKWwo2NdUmpcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="189428019"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 07:15:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 07:15:19 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 07:15:19 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.50) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 07:15:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFcWmEuX7wp64N9+aGzwO422fapvVZAVsYqu5GM9RJ6FJ/sU2vR07NsWb9tnn6ZF++SUmQXg1bnA27gS0rtsqU5um03wikcMiz1tKhwOaI0FEXddptXx4VXxfA1vxx+xONOckHG/4ah4cOY/HhIeyBhryf2YG9og0BikYJvdxOvqoXNexYzbXJuypdLk5NEJqK07/13fX5wuWlb/FeLr7GN+Xw+Yc1fH/qcX64zquRiha/qJjcULSsnlHc4e7CFGZ6WeNPb/djSgvGKUH0YLl7r9pdWYoPyqWEPW/DRfDny48FaioossmVmyUVV9ZIXMCVxNXmy5hKZ1CRCAn/9+eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQcg7lPWXUJndvxM4gHtNvS5fmbFkzc99Ohr2Pz9vQk=;
 b=LVoWo9JhLmvmzYuNiYaQqFTG5CGnCHe6IMOOjxGNRbPJoqQgTpcaQo2oLHZySRRGLMrcLvqzQV+DDXZ7i/2YdSY6On7LoGBfNnDQRQHYecAaAiWQgoVshNbH6Olmi0Ey/tRAQSTfvXc3BpNqybK47Kt6ZnQGXqofeAbn62zXZHf4bJTFhcseW5AdbMAhltZkz9V6YTTJEWONZR078uUDSwF4jciBnjzjLBdfRRgAfPAXoz7e6cvM3jbKjoOhfPuXKnIFiZZLTd+nlllFBvGiyQwnufajr0eFDkAWW9yZ3UQ/5rAfHJBRxC/HhSNUd4HkS2hxOgWLHmU3HlT3f+0NiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8280.namprd11.prod.outlook.com (2603:10b6:806:25d::21)
 by CY8PR11MB7899.namprd11.prod.outlook.com (2603:10b6:930:7e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 14:15:16 +0000
Received: from SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::13a:4240:8d73:3c88]) by SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::13a:4240:8d73:3c88%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 14:15:16 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251024233732.55832-1-ngai-mint.kwan@linux.intel.com>
References: <20251024233732.55832-1-ngai-mint.kwan@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_atomic_transition: Fix dynamic subtest
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
To: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
Date: Mon, 27 Oct 2025 11:15:11 -0300
Message-ID: <176157451100.3407.12104950322254043568@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::32) To SA1PR11MB8280.namprd11.prod.outlook.com
 (2603:10b6:806:25d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8280:EE_|CY8PR11MB7899:EE_
X-MS-Office365-Filtering-Correlation-Id: 7749a27d-677e-4b78-2e8a-08de1563403b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dFdpR0ZORWQ0SWJEZ0FLU3JZRFhLa1ZVT2V2UWNNK1F3d2xPVG5nbUZnWU1P?=
 =?utf-8?B?ZVAySlo5SE0xcTkvMkVpS05ueWcrb0tWRkQ4QWZETUhGYldVVFVNeE13bFlQ?=
 =?utf-8?B?b3ZJN0U2bENTVlk4TnZTb2RzZFk3UDZ4QmZkeVBYaVVlTFF2UVJWeXQwNjV5?=
 =?utf-8?B?emFISUxkVHpWNEZBajd3SThLdW1jczJVVCsrbXJyd2o5SmtxN255YmNING5L?=
 =?utf-8?B?SGVCMEVMQVdtV0lnSWNhMi9vOE9OV3YzaVd6NnZZSys0S3QxejdrMmlqTzlT?=
 =?utf-8?B?MU40cjI5NENMaitLdUNOUG1BeVJhdnhjOEN5OE1NTmVqM1dlcXlSTXNrK3Vw?=
 =?utf-8?B?NS9nd1kvSFFibUs3OHZRUit6TGZqeklrN3ZQcUhmNHloSldrQlFGbDA5R1Nt?=
 =?utf-8?B?b2hNMDkrVEJJbEhSMzBNamN4OWxHZ3gwM3RUeFR3VkZVR2Q1dmU0V0NLQS9I?=
 =?utf-8?B?ZUFuM3l1MlZ1TjJlRFR3TS80MjZsUEdTQzB4ZlcrU2FQS2RPR1hRellJa1pP?=
 =?utf-8?B?R3M5cGFKSUkremRSRGpFMHZxT3NacjZnVENFOGd6aVRNRGxRWlg0aUdvRGVX?=
 =?utf-8?B?cUJBRXdWZUFLUzhvMVo1M3F2Z2F6Nm5Zam56ODlXMndLWTNvWko5UzhiRHhV?=
 =?utf-8?B?eFdFMDl0d0tNOVVnY2RoOE0wd3pLM3o1aHdPK2JnVDZ4S01YQnU0ODY2UUZS?=
 =?utf-8?B?eTFCMnFNZHNkQ3BZYklkWnkyRDQ2MC9ta1ZVVm0yNDdrOG5DWlBZVjcxRnYz?=
 =?utf-8?B?a2EvakpnM2k5dHN4eWVsWE1nR1p5RXJ1ci9ReHJoY0pyUzBhRGhKNmVGdWJm?=
 =?utf-8?B?NmRRbSs1ZzN3TGlpZE5kQ1g3K0hIRG1PYjVrUzJiNTYrTFhPRUtuTFJycGwv?=
 =?utf-8?B?b0w1ZWVVYmNxak83WjFKWHJoeDFjNzJ1NVovYnZTSG5HeU9QMzBoOHFOeXF4?=
 =?utf-8?B?bmsraWVFZTZUeTRGVkhCdE9MRk1vaEl1ZjMxZDVjdDUzWTZndlBpSmFvTGhx?=
 =?utf-8?B?TjNESWtSL3loaWRUb1VVTW5SdWtVdkJHRnlWMWVzdFFMZWl4Q0s3M0RnVzMz?=
 =?utf-8?B?UWY2QjdKeFRiM3VZbDMzeC80bEF5aEhGN3Qxb3B6SXVmQVprQ3RUcDVGNmhD?=
 =?utf-8?B?eVBQNDJ4dUZvdnFJMFVaREhuamFoSWlVWVI3a2xtdzhaaUlNL1I5OGtGQk43?=
 =?utf-8?B?N2tadEVneU1sTkJibm1RNUw1M2xhZS85bFVqWGM4ZmJ0bVJKZzE4cExtbXN5?=
 =?utf-8?B?dVRrRWRLMWNTRUw5SXNYMmxhcStxTW9MK3BjZDhpdEdYYnQ3ZjBxS0JjeFR4?=
 =?utf-8?B?K1RzWkZXWHd4aDkyTGs0QUFMWFc0Ymk3T2lpaGhNd0pyUmlRMjFkYWd6Yjlr?=
 =?utf-8?B?MjBHc09WZzRKNDQ5enYzbEJlZXJVaEhmdGpvQmdtVzF0YjAyaElzS3drRUFH?=
 =?utf-8?B?QTl4MFk1Tlg2Q1poMzBYeEhwdk9xZ1o1MEJ3UktjalM2ZFVtc0ZOTWdEUlhG?=
 =?utf-8?B?SDZGYjdscXpzQlB4NllDZXZkOWxoTEc2U0JwMXFERUdZdy92Y2dJZWVaOTdu?=
 =?utf-8?B?T08raXdSREVIRHpxTUNZb3ptUWNwOHVPdTRIMWNMUURTZG4rS0UwVTNRbnV1?=
 =?utf-8?B?QmlzaVh3NWJNM2piWUd6OEcrUllHZnVzTE1oUGdxM3JWSmMzM3ZNcE9OS1k0?=
 =?utf-8?B?T2ZocUJzek9VaG8xRmN2ZGYxN211ai9kbm4reXBzYlVjQklWcy9wR0ZQZjJR?=
 =?utf-8?B?ekpNdnN2MHkrYUl5aGlmWWUrc2tLTmdpa3J3bExpcDY5NGpQd0tsSjk0MGFZ?=
 =?utf-8?B?d0ZwZEJVTENqU25lK0o2Q2xyTnpTZWx2dVFjT0JtcU80K2RaanNOZmg3eVdJ?=
 =?utf-8?B?OHdQTVNXWkw2MFZNQ1VJVGVOMmRSNnJnVm9CNnA5N3IrM1JqakU2SDBYUndm?=
 =?utf-8?Q?w9S3P9L8qfjZ0eNDC9aQd1l/5jG32zjC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8280.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGRsQUhrMmRDZnhIQlF5Z085UklvcjErRU0rNFRZZHhwTXl0YUdBeDJicUtF?=
 =?utf-8?B?bGhPNVV4bnFpTStlZWM1TzdxR3pQUnpDdTM5MFFoeG4xbnVRVVYxaGlvMDFz?=
 =?utf-8?B?Qm13bDUxcnE0MWJOdWhlNUlwMGxJdzQ1LzdIVUFlbEhKMHRzaUhSNHlFOTZT?=
 =?utf-8?B?bVkvNXNlSFo2dmIzaGwxMFdBU2ZjWWdyMUp1TWUrdStEUUtldVpWcnZjQ1J1?=
 =?utf-8?B?YjVtK0hLVXdZTmpDT2dwWklSeTZ1cUFFTE40MWdUSHVwRm83MlRUU1RsUWFo?=
 =?utf-8?B?bS91aUthRWl1S3lod0RvQkQwaXZ2RS9hUVhOK0I4MkhqdDlHeVFlSWNOQVNh?=
 =?utf-8?B?MG5VUmtMdEtDaC9mdHZLeFFRN2k2T0Izb3E1amViS2tCM2U0T2RnYjR5eUdL?=
 =?utf-8?B?YVFKK1ZRa3ovWjUrUjJ6MDNhTTVLblo1TmJoUEUzWjhLUGFDTlllRTJ6WGVs?=
 =?utf-8?B?V3hxNjEzdlNENGlEa2tMMXdGUzN6VnZuVktLWVgyaVFRQXAvdnZQV0wvMWlG?=
 =?utf-8?B?SXZCWk5xVjJlUnpadm5vaEhWWTJQSndBMktPMk1KSmtqRmVoZ2FENGhsb0NT?=
 =?utf-8?B?dEpDOEI0Rlp3T0RtWnB0WUQ5TUxYUGIzMFE4bEkrWFhhTjhIelVra1U0WFJy?=
 =?utf-8?B?L2xRSlBVckdsanZjS2l2MmlIQVlWVHUrTDlhQzl0S0N0L0ZsN3g2WGdyU0l1?=
 =?utf-8?B?VFFMSk1pMHFUaUtsblc5dmJyYVcvQzNjUGlHMEZMNHEvZ1ZGOFllV2QycHJ4?=
 =?utf-8?B?U0tUTGJFU0ZIZjZ1dWhiOEhjTkNWUFlITFFaM2ZJSVZKYTFUZWdTMFhvSmgv?=
 =?utf-8?B?SHlYeThYNTFUNjlHeXg2YkxUSW5wZVUwMFByWVJnQ1BkLzFFSEJQU0JCZXVI?=
 =?utf-8?B?RWdwK2l3WVN4NjFyUVNLbndjNFQ3SWhaM0ZKTGI1QnN3SkY5dTZSRjhsTWVj?=
 =?utf-8?B?ck5jOXVGTGdzd0dLWVE4Yk5SWm5hNmFZVk13TitKNm80SlNxNlViOFE4Ymlp?=
 =?utf-8?B?eitSL21ldVVGaElkSzJyQnBpZWwrWFpZZ3ZzaTJCcjRWMFlRRGhGcHNIc2xL?=
 =?utf-8?B?eFJzQmtNK0ZqdFdqVkcyRXhJWE9DTTk1Rm1ocnEvblVqZTVDUWFSS0ZMT0dI?=
 =?utf-8?B?UWdZNDJWY2Nod2o0dC81eWNIZFdBRzN0K3V0ZmttTXRwTXJKWDZGOXFuSHAv?=
 =?utf-8?B?VU5McUhkZ0xnQnhzKzZ6bDFSaVR6bnVndjBNY2RRVHBDT1BmUjV3OHlxR0Rh?=
 =?utf-8?B?a1RMZFZJNjIwRHNrL2crTnN2RUR5VHZPT2RQWXpzRUF5Wkp1SjNmeDRxK3Rp?=
 =?utf-8?B?WlMzRmhENFZONnJScXArN3RjUnMrU0tvTzlJcGl6elhGTHZQYTJOQTNIRUtS?=
 =?utf-8?B?ZnJqTHo5WHRpRitIcFRJeDNKd3ZOU0dzVHJFekVabWpqSDNzWXczbHJTeW1s?=
 =?utf-8?B?WHd0WDVtWm1Cb1MyV2VVVFpvcWJoNEFNak5vaHArTEVVNHVRVE9GN0duNExI?=
 =?utf-8?B?ZmZKSzlhOElIUzllUjJUOS90ek5tRG02VHIzTmhmRGkwUUloeVZiUDJ1VVA3?=
 =?utf-8?B?L0dqNW9DOGNtdm1RTFMxazZwZWpBWDRtVGFmRFBPY1VVWnVGeFZabEdac0Zr?=
 =?utf-8?B?NmNibWhrcGV0c1BuaWRTQU1oSlI0U3RLUllQK01FT01MMDduKzVYckREbVda?=
 =?utf-8?B?QTRwaVpzdGIvZ28zTEtXcDY5Qk5zNWtmQmZiQkRqTzlqSHo0aC9tUUoybjFP?=
 =?utf-8?B?N3lwYlFldEMrT3ZDWUtnbi9KSDd5bFpzVFcxR2s0SzBXbEVUK1BFVVVYcllM?=
 =?utf-8?B?WTFQSjFDZ0hNcVp3Q1VQV2p5UVRhUjFOZ3ZNa1JqcG1tazhCelpQMXhrNm5j?=
 =?utf-8?B?QkxZRjRua3NyNC9kR0hhdTVYODVQTVZwakhnZXFiVDZEZmwxR1VNeE9yUk9k?=
 =?utf-8?B?WXM0aUppN2dnMzFxZGxHZGhJZ2tVaExJek1MVy80SldDMmhDdUxKNFdJT1FI?=
 =?utf-8?B?eXNsbjljWmhkQU9nM0RuZ2RqSVJvNC9zNGNqVHppTTdjb3dpUjVSOUJVUGYx?=
 =?utf-8?B?djRDaWtkQkhoL3R5aEE3bXFEbm5iVEpUK1FPeW8zVE1keFZiZ1JXY1djRlg3?=
 =?utf-8?B?TDA0b2V4cmppRzJlVzVUSVQzM3hocFpnWkNRUFNndzFaWUhOUW05NHdFVFhu?=
 =?utf-8?B?TXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7749a27d-677e-4b78-2e8a-08de1563403b
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8280.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 14:15:16.2392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aAnakPoWJ0ZZut5yIVc+EYobXqIlX9oKDH5tkO/ntZcTErWP7fHq41UskSg9TFNPwAETEdHMtrtPSb51K1jM8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7899
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

Quoting Ngai-Mint Kwan (2025-10-24 20:37:28-03:00)
>Fix Segmentation Fault when calling igt_pipe_crc_free() due to double-free=
ing a
>dangling pointer.
>
>This occurs when a system connected to multiple displays executes a test w=
ith
>"1x-outputs" dynamic subtest.
>
>Example:
>kms_atomic_transition --run-subtest modeset-transition --dynamic-subtest 1=
x-outputs
>
>Signed-off-by: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
>---
> tests/kms_atomic_transition.c | 10 +++++-----
> 1 file changed, 5 insertions(+), 5 deletions(-)
>
>diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
>index a13830965..a7d8d88b4 100644
>--- a/tests/kms_atomic_transition.c
>+++ b/tests/kms_atomic_transition.c
>@@ -1065,8 +1065,7 @@ static void run_modeset_transition(data_t *data, int=
 requested_outputs, bool non
>                 return;
>         }
>=20
>-        igt_dynamic_f("%ix-outputs", requested_outputs)
>-                run_modeset_tests(data, requested_outputs, nonblocking, f=
encing);
>+        run_modeset_tests(data, requested_outputs, nonblocking, fencing);
>=20
>         /* Cleanup */
>         unset_output_pipe(&data->display);
>@@ -1259,9 +1258,10 @@ igt_main_args("", long_opts, help_str, opt_handler,=
 &data)
>                 igt_describe_f("%s", modeset_tests[i].desc);
>                 igt_subtest_with_dynamic_f("%s", modeset_tests[i].name) {
>                         for (j =3D 1; j <=3D count; j++) {
>-                                run_modeset_transition(&data, j,
>-                                                       modeset_tests[i].n=
onblocking,
>-                                                       modeset_tests[i].f=
encing);
>+                                igt_dynamic_f("%ix-outputs", j)
>+                                        run_modeset_transition(&data, j,
>+                                                               modeset_te=
sts[i].nonblocking,
>+                                                               modeset_te=
sts[i].fencing);

I believe one possible problem here is that we might end up creating a
dynamic subtest that ends not not getting exercised, when (num_outputs <
requested_outputs) evaluates to true inside run_modeset_transition().

Maybe we should rather move the cleanup code to be contained inside
run_modeset_tests()?

--
Gustavo Sousa

>                         }
>                 }
>         }
>--=20
>2.43.0
>
