Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC67D78776
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 13:43:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37FD110EFA7;
	Fri, 19 Dec 2025 13:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UZZZT4JG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34FD10EFA7
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 13:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766151804; x=1797687804;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Pf4bkNiXhZgYNIT7qQ04a2uMztCRd2bdGraKQtbIViw=;
 b=UZZZT4JGBRXl8xApdqaEM+2Ps5GL3o+9CoSm3zD/9KVKNEvQF9MMPuY3
 sTWWb23Bvknf+EMfC7kHhF8Gz7QwhWb6w2pTs8jrgwKcvdBLb7T3pyVRt
 H8gC9taFuKaW50ex8mn7gqgbBNldlzqnOUJh9E83qNoOcKfB5Hf9Jt2ho
 1z1zPpy1J22ePTCpsDwVV4LLj3QNWvu+/pcT4MZ5s3FAENEPA95oiV0yT
 IXJ01ndvlpK6/PVJpe0D+nxfC1LcieQ4bCUkRBewQ0G3JFYw91dqyD4uB
 lObZhBbPDDzbEaibQbOjzgikzzQkKZTOHAxYjPS/bzJ73U3QgUdOVXS7T w==;
X-CSE-ConnectionGUID: b9EGB7M1QzWKaeNKxeuoRw==
X-CSE-MsgGUID: GRWUXuiVQhqCgYyf5FyFmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68186651"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="68186651"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 05:43:23 -0800
X-CSE-ConnectionGUID: bytGthVCRR+xPt5yHzLUqA==
X-CSE-MsgGUID: hzv3iOpPTOaeABpePgFGeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203770793"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 05:43:23 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 05:43:22 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 05:43:22 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.60) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 05:43:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PgtSmAgpqG3zXtHB9PXliXB+Q8VEh35Y83qATPwUmho6dnUJvrSyqujNYg/E2z+ukecOy5l8CjdY9fXE7A0Ok2vMKBfbeXnvPBWlkapwvUkC/XQH7xFUpy11lTcLtG/m55QsZaVpSt1Sx7sggSsawFRvbNouOrZjU+wvAWIazR1dOnLm01ljS56dwy11aBBeLa1M65gZZNF1oIK7UV/tlW3WthSkDNnnPFFINbCvLJ+0Fnq2+zIV3TR+hkjseipgJB+fWx2GaWLmnkrlU3BdbSIiUHiIBviNwi9LkXAoS797tabLq3TFmkQkU0HCcN48N495Rv73WvK0DBE9CTzq+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMgTlWwYRf73HqG9x6cJrCOzp7gMB8d1R4JKWRkZoPU=;
 b=bTTF7Gjmi+l+KLizKek7/MXhaKYEDOPnGK5Ucxp1SV9PEE5yBu7BbFylXfOiIdV7lKOULR2aHsqauvvwAe4KvbMnL7GLO4hnr5WAPTpeLStzR3gGOQ5PIrXclhXdTSQ8d2KqGajrxW5cBhCf4Lm8eEqjqwhDGFquCTnkr9Iw5LXcEUUpyS3Io+qvmQicM86ntawsjYIAze3MZnJCfWe86lKJn8HUOHkOSY06BgP9Slnz5lK6YgJucjtHzjIjP1hk9Sm8nMyZfjAjaP9vGmJAI+7gyesRIrSvE19vx77QDLRxrOe23deC7BwljfLAfln/+IzStH7otOmM3PBUCSrj/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by PH0PR11MB7470.namprd11.prod.outlook.com (2603:10b6:510:288::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 13:43:15 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%5]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 13:43:15 +0000
Message-ID: <5c0ec341-b5d6-4436-a1fa-e2e9595c77b0@intel.com>
Date: Fri, 19 Dec 2025 19:13:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 3/3] tests/intel/xe_pmu: Refine engine activity
 accuracy test
To: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>,
 <badal.nilawar@intel.com>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <kamil.konieczny@intel.com>
References: <20251113124936.3878794-1-soham.purkait@intel.com>
 <20251113124936.3878794-4-soham.purkait@intel.com>
 <cf076e76-10b3-46c6-a4b1-a6835fcbabc8@intel.com>
 <9180ae12-d7ec-4a1f-96bc-c610cc20a287@intel.com>
 <30dd6ab8-7a55-4be3-b309-cb11900826b9@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <30dd6ab8-7a55-4be3-b309-cb11900826b9@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0215.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::8) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|PH0PR11MB7470:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a689b5f-94e0-43ff-00a7-08de3f048f4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3hlK0NyRW5WQlZOSERHZk5Sdm1KY3BFUWxuREJkT005eFg1M1FQbHZlRGs4?=
 =?utf-8?B?UEhjcE5hWTBZVUJ2L0Fqc1ErbnYzU044YVFSY3I2dnFZYVJZejJXT1NOV3J1?=
 =?utf-8?B?SnF4VlhFWkVZNitiNXFFRzUzNkVSWHQ0YTJ1UytxekRtWHdIRi9MbC9pU2Z6?=
 =?utf-8?B?TUhDY2ZOUHhob2FhamRIQ2Exd1JJZk1kS2pURktEdjhNNGRGdjUwT094N1k1?=
 =?utf-8?B?THVhemFlUkhITHNQNWdvSjhEVUwwVGtKb1RqWCtEZHBBM3ZkMEh5Qzl5aGtR?=
 =?utf-8?B?ODRnaWo5bVUwd21CSGpXRFRlMGR1VjQrWXB2cXB6Sm9VUG5Fd2ZNWWpWYm03?=
 =?utf-8?B?dUh4aXA5eE9LOWZ0M3JkN3NXbStTakxKSmhVZDBoSmdSWHV2SjZlS0xhOFZH?=
 =?utf-8?B?K0llMzZqWHk2RU1RellmRERuQ1J2SmRLdUJUUU9Mbjl1WmRjcUNtK0NkdHNH?=
 =?utf-8?B?OFpsN0tlV3ptaVYxdFBDaHJWY0srVkgyZ212eFVJeHNiVUFZWmdNZTNyNnBR?=
 =?utf-8?B?S0IyVVJiRHBINHNlU25YaGNYeGdMZnI1NldFVGZmWFp3SWphaTJnUFRQbmoy?=
 =?utf-8?B?WTA4UnQ0a3REMWY4dmxQZVpTVzU0TkFzUTcwTm9nT3hFWm5YeGRKRFFUNFUv?=
 =?utf-8?B?MHVSbkdEWm9FY0YvTGtUeWxOdVE3SUxGM2tSMkNlSnVoeHdqMFhBRlJMU3Rj?=
 =?utf-8?B?NTZYSE9DZUxpdlpEcWJvc21BZXVVa0Q1ZmpDZDFiRmxWOEdnVU1iOHgrRGZV?=
 =?utf-8?B?S1Z5Vy9FUkpSMFZKUGswM3Nid3Rtdy9BUnoyZDVTZHlvWExjWUZhMWkvRjFB?=
 =?utf-8?B?WmF1U3pjajdQOWRBM0liRUw3THNDMXVJUkNoSFhZK2RycmRyaDRidXc4Y0k5?=
 =?utf-8?B?T1IvZ05mSVNvWkpEOEtweUhybExwT0NmVzRYNVBMY1lwVXFYMVZ0Zkp3elBT?=
 =?utf-8?B?V25yUzcwZUlzQUh2dXVDTEQ1OFJHUTBZVXhvcGw0SW4wNFhrSk8vTXBxUzJ6?=
 =?utf-8?B?QU9kenRORFFQMEtHd1djMHBWa0JNZ01aVnpsVjZLVmlyQlB1Q1ZuYjJRenZx?=
 =?utf-8?B?ME0rYjhkWkN5ek9lb3B6MEx2bk82d016WUVXczVaTnJpQk1FT0FNcklDazNv?=
 =?utf-8?B?RmkxUXlYV0x3RjhUdVl3d2l4L0p1VnJhL0FwUUg1RWdnaDdSN0tVSmhEMlVn?=
 =?utf-8?B?RzNXN01MeGpJMWFqcU1pQVBhR21xVURlODQrSy9XaTF4Skl4bjhvNXRKQ2ZH?=
 =?utf-8?B?eSthSTU2NGp1R3JOZG8xSDdXVHdlakxmU3VFcTQvRmE5cUtNMktCa3NtVmM3?=
 =?utf-8?B?bEMzTHFoWGFmc1FrZUNsT0cwbllZQW9QY1FCR2RzL0V2WjZzWnBkY0o0QnI4?=
 =?utf-8?B?UzQ3ZTlPWjI3L2lSbU96NjlHSlFSaXhMazBTcEFTYjdtKzVtZDJ6bno4M3g1?=
 =?utf-8?B?UGthY3RuKzVSb2RpNW9lNkZQdHg2V2JSL09nOXoyNmYveGJ4aWRVVlFoOXNS?=
 =?utf-8?B?ZlBGUXlDYW5USmM5RENsclljd2VMS3VmWDdPR0g3OFN4bDRGTFNEazZKZ2pQ?=
 =?utf-8?B?WTl3YjlhSWJ6N1VCQUJkL0N3MVpDdUJnUDh2cGF3SWo2WklQejBYRHFEbW5j?=
 =?utf-8?B?OTgxbmZvN3RQR2V6S0hHcUFIeFdoWHZhTmdiOC9QVUs1c1p6OC82VUdNUDhh?=
 =?utf-8?B?VDBRRFFBUXRKaGQ3RE1pTSs0MjlDdjQzM1VvUEZoellMOXFkNG5VYTJhRUk2?=
 =?utf-8?B?MmFNejliRmhmb25UTkNyUDFFNVJneW9tWmZVWUJOU2YrbGlQN0djM0NGcXZJ?=
 =?utf-8?B?S1puaU14SjVBSEtqQ1lLTjlxL0plL0c1a2g0ckhNRG5OdzhBQW5vMThqUi9S?=
 =?utf-8?B?dGE1TWlQdzNNSVMrK3kxMlFJNy9QYkhIQWtGL3FFUmx6QUFxUWluTzhXRllJ?=
 =?utf-8?Q?/CjM+Qv6l1D1Cn/EadaZZjRGy+Lmca5V?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlJIYlA2M2Z3bGNpQWZWUjlodXNLR3VjdVdrRWVqTUZmY2lIdVB1T0hSVmpp?=
 =?utf-8?B?N0h2OXpIVTNtbjhtNWRETGIwcVFHTng3RlUydnJxN1BxYjV6YVhMYjRCZHdJ?=
 =?utf-8?B?N2w0bk9xVTh4RVN1ekxLRWZCcEFhRUJ4ZDFvUkpmYW83NmpDeGZjT1U4NVlo?=
 =?utf-8?B?SkpnZ29wQXdyU0J3TzNsVmxXQlJKbTRhRStscUVSK1lkVldrTGJsbHpITWNt?=
 =?utf-8?B?bG5WVExockJHZ1djSTdUU2YrN3lkYWF1TEFvREdSQS9ESnFZblNEZTVNY1dt?=
 =?utf-8?B?UG53cThIVVcwa1hOT3c0WFZ4Q01Zb2sxSUl4MDdRS2c3VUZiTUw1cXVXRFpE?=
 =?utf-8?B?LzJaejBoWkYvTWN1S3ZDWklTRFBKck9FVFFjei9UeUV1Wmx2RmMyeVhqcXVD?=
 =?utf-8?B?ckpXS1RiWHpSeTZuWTVHT1FlVG9UM1BMb0dnL2hxYVFRaGVEa1Ezdm9nZjlS?=
 =?utf-8?B?elJZUGxkREZNYVJWUUNXbmJNUnJzUUpnT1FWNEZTNFlnbUFIR1hJU21sYWU3?=
 =?utf-8?B?bU4vNDRVVGc4TDNkVDNPYTcwaVBHN2Fmb0oyUDJSQ3NpSU1uaWdvQ1U4Nkt6?=
 =?utf-8?B?OFlWbVZBcHBkbUhna1FPdFRuKzVoeXNacXM0a2Q4MmdYUU9mVGp3ejVkY3c0?=
 =?utf-8?B?akpHM0RjQjA4YkIvdG44MXpYbGU4YXIzbjVBTHRuejhhY1M4TjJMaCtoVkhO?=
 =?utf-8?B?OTJUM0FYdzVPeWpZUk51c25JYUxqM2poakZLdzRGWkR0NjBzT000QklCQnc1?=
 =?utf-8?B?R2w2UEZCVXhGbUV0b2xINzFyZzJ3REdYMFYxbFhNdnFPcVAwOHpQMUZBemp1?=
 =?utf-8?B?ckEzMWFNdFF2T0JtTHJJNjAvOVJkRjdyOFhndlRlOVJMMThaRzlXQ2JGUFNr?=
 =?utf-8?B?My9Ua2VzUTFmbk1SQXM4UTczMmhzSXFGMFlRYjVhNmFMVnpFaXBnRjV1dFZy?=
 =?utf-8?B?Rk1qaktGZnJMeWFKcWVvTStsS2R6MDM5ejd1RWRUaUhXaU9LUnZDNHlicmJq?=
 =?utf-8?B?ZG5XV2NmZjBMSVM1eWlTZzltN3VMNDhOa1NhZmJGTFpWUmRNTjlpMVorSWJu?=
 =?utf-8?B?aXZjZlpVT2l6K0Y5MzUwYkZjZVhRYkU0Mlloenc0REpxQk9yb2hPV0ora2NI?=
 =?utf-8?B?NmNhRVBaVlRRaXhQMWFvMGpDcnJ4ekdOaDFWbnNWN0tFK3hCOWl2Z0RUQk5D?=
 =?utf-8?B?SlhZWHkxVGhoL1drT055dThoYXJUZTlCYWpMRENqY2h0aXZmMkl2OUdFeVRG?=
 =?utf-8?B?VEtHUVJDelA4TW1iaGRzS1VxaGdYRkxKck5kbTZWYW4yN3NwNGkxNFVMZ2Fv?=
 =?utf-8?B?MW9YUWdPUzhBSjhvNDFvNDhPalF0MXRwZ2FGdFFzSkk1U3NCZXlzVHdEaFB5?=
 =?utf-8?B?OUJvMkErT1VCaHhTaWRiNWNpTkF5Z2FyQ0U4TFErUUZ5cmx3YVZNSmd0M3Y0?=
 =?utf-8?B?L0s5VUNJZk85SmJtbWF4VGRUbHd4bjNFQ0l3QllnZkxDTGdiZ3VVYTRrTHBU?=
 =?utf-8?B?SzlsQi9jQ0NoSFhPK0Y0R2hRQi8zZmZ3eG1TRFFwb3ducmhva0MzSm9rWlMv?=
 =?utf-8?B?VStoNlRXTFQzNnQ5M3BuVWxvWmw3QVN6WXhWTnRLTkpjSWNVVit0NW9QWUdN?=
 =?utf-8?B?VUI3L3NjUGs5R1RqdmdVUDFFaUFQZS9BRFEvNE4va3hQR3NSS2RmaElDblZh?=
 =?utf-8?B?N3Y5MkRPOEl3OEwrdTlhSjZVT3ZpM0ZhelVseVhZNklRbEpUOUVHSkxRa1VP?=
 =?utf-8?B?cHRlK3FBaWV5WjBHWU9ybVRXSDI1QTBMTTArZkNsMjRHZDhZMjlpZ3JGN2gx?=
 =?utf-8?B?MXlnb2w5R2kxR1JCU2VhUER2ZVlFUm5PcU1WZlNkdXhiRjJOeVU4QUtZSUdw?=
 =?utf-8?B?TzJXV3cyVHY3SXplRXUwUmZ2SVViMXBuU0RZT2xNRStZZENNZDR0blVQTEpV?=
 =?utf-8?B?VjRyNkIzKy9uVUxDR1c4aTFjbThoQkhSRG4zZXdJN0VVWmY1RWRmcjdGRXU2?=
 =?utf-8?B?cVBMYW1xNTVTYnk5MXpPQ3lJYXNLWHlzbUtQMzVDb3Z5aHVZc2hCcndleFJR?=
 =?utf-8?B?K0tFOW9pVXl6Q1FmejJkNVZBWWZrQW56OC90Und0SlZwck1KMmh0MDFJR2gr?=
 =?utf-8?B?cFN5SDJyelErcGE4OVRYVTZJS0N0cGZoN1NDVWNIalBMOUllQjBmL2lGT3Nt?=
 =?utf-8?B?ZHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a689b5f-94e0-43ff-00a7-08de3f048f4e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 13:43:15.1504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xRNN1zBM4fI2KWlmMjXeZ0wnpKeZJQTql947OOe/WFnTnYaIKCUQjDkE1j2N35Ssxcdx6K77Y9z110qSd2pEeg==
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

Hi Riana,

On 18-12-2025 12:06, Riana Tauro wrote:
>
>
> On 12/3/2025 3:09 PM, Purkait, Soham wrote:
>> Hi Riana,
>>
>> On 28-11-2025 14:56, Riana Tauro wrote:
>>> Hi Soham
>>>
>>> On 11/13/2025 6:19 PM, Soham Purkait wrote:
>>>> Instead of creating a new spinner during each pass, it's more 
>>>> efficient to
>>>> instantiate the spinner once and reuse it by properly ending and 
>>>> resetting
>>>> it between iterations.
>>>
>>> Give an overview of the the issue and the links in Closes
>>>
>>>> This approach reduces the overhead associated with repeated spinner 
>>>> creation,
>>>> saving time across multiple passes. By eliminating the cumulative 
>>>> time spent
>>>> on spinner initialization (i.e., creation time * number of passes),
>>>> the spinner's active duration more accurately reflects the actual 
>>>> engine busyness.
>>>> This leads to more precise measurements of the percentage of engine 
>>>> busyness in
>>>> terms of spinner running time.
>>>>
>>>> With this change engine-activity-accuracy test result clearly shows 
>>>> the difference:
>>>>
>>>> Before spinner reuse :
>>>>
>>>> Starting subtest: engine-activity-accuracy-90
>>>> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_RENDER0
>>>> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% 
>>>> (90000us/10000us)
>>>> error=-2.90% (81.03% vs 83.93%)
>>>> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_RENDER0: SUCCESS (1.598s)
>>>> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_COPY0
>>>> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% 
>>>> (90000us/10000us)
>>>> error=-2.81% (83.06% vs 85.87%)
>>>> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_COPY0: SUCCESS (1.684s)
>>>> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_COMPUTE0
>>>> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% 
>>>> (90000us/10000us)
>>>> error=-2.04% (83.83% vs 85.87%)
>>>> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_COMPUTE0: SUCCESS (1.667s)
>>>> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_VIDEO_DECODE0
>>>> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% 
>>>> (90000us/10000us)
>>>> error=-2.15% (83.99% vs 86.14%)
>>>> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_VIDEO_DECODE0: SUCCESS 
>>>> (1.647s)
>>>> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE0
>>>> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% 
>>>> (90000us/10000us)
>>>> error=-2.00% (83.59% vs 85.60%)
>>>> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE0: SUCCESS 
>>>> (1.664s)
>>>> Subtest engine-activity-accuracy-90: SUCCESS (8.264s)
>>>>
>>>> After spinner reuse:
>>>>
>>>> Starting subtest: engine-activity-accuracy-90
>>>> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_RENDER0
>>>> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% 
>>>> (90000us/10000us)
>>>> error=0.03% (89.45% vs 89.42%)
>>>> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_RENDER0: SUCCESS (1.560s)
>>>> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_COPY0
>>>> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% 
>>>> (90000us/10000us)
>>>> error=0.02% (89.56% vs 89.54%)
>>>> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_COPY0: SUCCESS (1.559s)
>>>> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_COMPUTE0
>>>> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% 
>>>> (90000us/10000us)
>>>> error=0.02% (89.42% vs 89.40%)
>>>> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_COMPUTE0: SUCCESS (1.571s)
>>>> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_VIDEO_DECODE0
>>>> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% 
>>>> (90000us/10000us)
>>>> error=0.01% (89.28% vs 89.27%)
>>>> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_VIDEO_DECODE0: SUCCESS 
>>>> (1.581s)
>>>> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE0
>>>> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% 
>>>> (90000us/10000us)
>>>> error=0.01% (89.37% vs 89.36%)
>>>> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE0: SUCCESS 
>>>> (1.583s)
>>>> Subtest engine-activity-accuracy-90: SUCCESS (7.859s)
>>>>
>>>> v1:
>>>>   - Add how this patch improves the engine activity accuracy test. 
>>>> (Lucas)
>>>>   - Show the numbers with the said improvement. (Lucas)
>>>>
>>>> Fixes: 477154cbad2c ("tests/intel/xe_pmu: Add tests to validate 
>>>> engine activity accuracy")
>>>
>>> Add all gitlab issue with Closes:
>>>
>>>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>>>> ---
>>>>   tests/intel/xe_pmu.c | 11 ++++++++---
>>>>   1 file changed, 8 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>>>> index 9525655ba..af0c2dfe4 100644
>>>> --- a/tests/intel/xe_pmu.c
>>>> +++ b/tests/intel/xe_pmu.c
>>>> @@ -534,6 +534,10 @@ static void accuracy(int fd, struct 
>>>> drm_xe_engine_class_instance *eci,
>>>>           intel_allocator_init();
>>>>           ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>>>>   +        spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe = 
>>>> eci);
>>>> +        xe_spin_end(spin->xe_spin);
>>>> +        xe_spin_sync_wait(fd, spin);
>>>> +
>>>>           for (int pass = 0; pass < ARRAY_SIZE(timeout); pass++) {
>>>>               unsigned int target_idle_us = idle_us;
>>>>               struct timespec start = { };
>>>> @@ -552,10 +556,10 @@ static void accuracy(int fd, struct 
>>>> drm_xe_engine_class_instance *eci,
>>>>                   igt_measured_usleep(target_idle_us);
>>>>                     /* start spinner */
>>>> -                spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, 
>>>> .hwe = eci);
>>>> +                xe_spin_reset(fd, spin);
>>>>                   loop_idle_ns = igt_nsec_elapsed(&start);
>>>>                   igt_measured_usleep(active_us);
>>>> -                igt_spin_free(fd, spin);
>>>> +                xe_spin_end(spin->xe_spin);
>>>
>>> Should there be wait here?
>> Yes, ideally |spin_sync_wait()| should be used here. However, to my 
>> understanding,
>> the amount of time this call consumes actually defeats the very 
>> objective of the test,
>> leading to a higher error percentage.
>
> Why not take the readings before the reset and wait since we are 
> calculating the busy time?

No this does not solve the issue, having more percentage of error as 
previous with spin_sync_wait(). So if spin_sync_wait() is really needed 
to be included, we can exclude the time consumed by it. Which is having 
negligible impact on the test result.

Thanks,

Soham

>
> Thanks
> Riana
>
>> Although, in my opinion, as wait is not used, the rest of the block 
>> compensates for this.
>>>
>>>
>>>>                     now = igt_nsec_elapsed(&start);
>>>>                   loop_active_ns = now - loop_idle_ns;
>>>> @@ -590,6 +594,7 @@ static void accuracy(int fd, struct 
>>>> drm_xe_engine_class_instance *eci,
>>>>                         sizeof(expected));
>>>>           }
>>>>   +        igt_spin_free(fd, spin);
>>>>           xe_vm_destroy(fd, vm);
>>>>           put_ahnd(ahnd);
>>>>       }
>>>> @@ -622,7 +627,7 @@ static void accuracy(int fd, struct 
>>>> drm_xe_engine_class_instance *eci,
>>>>       igt_info("error=%.2f%% (%.2f%% vs %.2f%%)\n",
>>>>            (engine_activity - expected) * 100, 100 * 
>>>> engine_activity, 100 * expected);
>>>>   -    assert_within(100.0 * engine_activity, 100.0 * expected, 3);
>>>> +    assert_within(100.0 * engine_activity, 100.0 * expected, 2);
>>>
>>> Is this tested on multiple platforms?
>>
>> Yes it is tested on BMG, LNL and PTL.
>>
>> Thanks,
>> Soham
>>
>>>
>>> Thanks
>>> Riana
>>>
>>>>   }
>>>>     static void engine_activity_all_fn(int fd, struct 
>>>> drm_xe_engine_class_instance *eci, int num_fns)
>>>
>
