Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E3160A3810
	for <igt-dev@archiver.kernel.org>; Tue, 10 Nov 2026 14:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B0v/k+GD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 299DD10F74F;
	Tue, 10 Nov 2026 14:45:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BCFD10F744
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2026 14:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794321877; x=1825857877;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SkYM4ajGJ3b3fcnzqDBptcm2m9/+k7jup8hYAaTmlv0=;
 b=B0v/k+GDUBL1ioQ+c4ZoGHNdHGgOtRt6mrUWP5ZsiUmyPcDGp6gt1tVR
 XhwIwt4I0rXq8mIv0YEAfZfxADUe8AZevdJh6S+3918ArXlJg2t1E8VMN
 saNzqFnG1nHf5BvKcsOfSl8+mCP4wjWfcO00iqkC8z8BmoYO78oiEKauz
 Io6asakfG7H0ZV4gcximzpzdeEvdzgEeqSWsp/ejhGReusdxfcZikKWe6
 guji1zJmv4+QUZVleXTkw+Vjchx5evJ65Om+zI3zVAtwEtyYx44Iezly0
 fjt0IwiLRaLFLP8GrNCP9MyZ580G6Ty9Tc2fgf/hwSWzoA0I6yEBqJYT5 A==;
X-CSE-ConnectionGUID: zDi++Z4oQFW7YRzNKWgWrg==
X-CSE-MsgGUID: IGrhRPUERTuFmAZbnBBwjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3067651"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3067651"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 06:44:36 -0800
X-CSE-ConnectionGUID: zonFvPS0TZi/j7M3p5SRZg==
X-CSE-MsgGUID: JktV3FGzTIyUKsPfLNlGhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8046264"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 06:44:36 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 06:44:36 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 06:44:36 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.29) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 06:44:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVwxNcyCn6u1y7vTstxNbxAhrFOQgDV7EO+YRnOlT0bElSQ0DoN1qU6tLqUNY9E6e9XpVuM3v+OOA9wR2F1PY5xKpqx8eDEweKwl0IiFRnmdbLbHGWzglhmGm+LeLjbecDhY2coypG1LP6jTgRhj95kGQxUNfWc0erb8f35+fj532cEknuSylUMHHHGk9TRhvG2G5NKJNjToipYcje94B/+P20VbvNiTWb6C5pD0fog02JYCPb6B/k7DIbDvCHet2Zz+vnE4NMXdQpBfUsSb2c8RFdYZuUz6bEQ56jaoodzAHD1LnR2WysBbHph60xWPzSNL0PmIcaRT7qMNfCKVaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/n1OzK5QJHDPBiwmJnuCyAM7sSgbhuwr5hHoSZtk4s=;
 b=vElnA17fqZORu3lVfZhksVygrbz5JVfWkajb5ikdyQIFpvLC7F3iIIiCCy8CiOG3T3sMDH0/eEF0uo8b04uCrl5MWvmovyiAVEtvLaXZXs5YzhMijG2qaOKnxwIuB4i9OcPNgYp3VsfyWE1Vbe/PxL3O6bCUhPRuSf2bbtuwDjwu5ww/V9PduPEmLy6PREXYvXaEhnaoJd76ULMizPCESJCmjzmLUHflpY3CRV7TJbd803gwxMv+X6S0KeTZxfCXtTXY/s1UKGELmJROvpqNrLr/Rx8uJrf7VYkxuQpZ2vUnDyN7rRIebuSZW3ZuXP2pbjVMfNAytxArKB3co8R1qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by DM4PR11MB7255.namprd11.prod.outlook.com (2603:10b6:8:10d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Tue, 10 Nov
 2026 14:44:28 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%5]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 14:44:27 +0000
Message-ID: <13bbb890-e6cf-4780-87bb-7e6f4fb4e566@intel.com>
Date: Tue, 10 Nov 2026 15:44:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_sriov_mmio_regs: Fix warn about
 discarded const
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
References: <20261110142823.52591-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20261110142823.52591-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::20) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|DM4PR11MB7255:EE_
X-MS-Office365-Filtering-Correlation-Id: b3a763d1-9ac1-41a3-96e7-08df3f391ec2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|10067099003|11063799006|261009223027099003|261102123227099003|56012099006|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: /sFeqL2OOYiP3fNRrV+wwtow+rekghZYGGePS00EV2XZEz12NLhFL9W5jPwGqIeq/Fh2GE3oZDLPGI5HVcEeRl7RoUlNtgoQVodfJrg6YGMbxkJwsaVoIBno5xFDK57O93ydm5W08jI46UrvWwdo9uaYP4+zvuyeaq5eqml3h5XkYjJxhzcO5gV+obfoY6qmaYiftEh1IhhIsxOsP7XZSijlN5DMd9rv/St8zVcpl67cZy3/fYlgtrPMY75QSMHJjV4czTxSyyEDmTNkXBokySdHgUCppft2hK9S6dFNKd1b3JBVTwhbJXqBnVbiyQo4leHSOfraAoc9gaHib+RFtD3n0tUFnH7cbmoghptOkrqABoCrBEe7CbHjhGK/0E2cnO6ACqYWy4fCD3s5EffCgHEs/IP0ObPQd6sUM/hdb8LQqkFJ3a01YErMr5EIRfKyTTCMW2+3f5BPkz4iiC92JtLK/9lsZy9zLZgEms/bxu97RfAlZiQqAniEVOFudRxlFSMk3b28WNeqm2ssCIPjJfLsyWdNAz2N2ElrN/nttOPCoPCoHRxBlpwy8MpCoXPGMvSBmSz3a/hdZJfNK4ZJGTYVttEn86fN9nIZhZ3q8KXAoWeCIQRZXc9o0w4CnTJCJ/2mDXNso4P+iy5MXKZTbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(10067099003)(11063799006)(261009223027099003)(261102123227099003)(56012099006)(261021121427099003)(261021123027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amJvSjhyYkpkM2t4bWlXRnJLN2NURVdqd2cyaWlEYnkySExqcFpNR2pYMDlS?=
 =?utf-8?B?OWlFNUlsWGVtUWlqRkQ3QzR4S2ZlVHRybFQxdGdvUnV4RWNwdDRUQTNGWU5Y?=
 =?utf-8?B?MHJJSlpyUXlURU5sd1B4TkQwd3JMekU2NXdaTm54MmJqd1FMVFF2Zkx2b0RH?=
 =?utf-8?B?UlNZejVhMXVwZU54S2VzTHBZK01ESFF2cEdRQm8vU2YxNkZwM1VTQkNWN0pz?=
 =?utf-8?B?WU5SZCtKalg4MlZ2M0xRZWZSSk16Wit1aklvOEdCNjUvZ0MyYjNObUVPK1Qz?=
 =?utf-8?B?VDQ2b0dUREJ2QVBqTDA4YWlIS2c5ZmF4ZFdLT2kyZVlEeTdRYWU4MkE5ZkVy?=
 =?utf-8?B?MXdHZHBST2ZxTkhTTTdLb2dSNlQwZGtWY1JRa1M1THhTcndCZ0RRazRpNmVE?=
 =?utf-8?B?KzE2YWl4Vk54ZlNVZWRERHArSGxTd3R5Q3VLV05JaEtnaURkcDJkelhEbCtG?=
 =?utf-8?B?TFJSazVsNkpWanJxZXpFZlZlU3dGNlN6SFBhTnJOQXIzTWRLYmlNQXliL3Er?=
 =?utf-8?B?QnpIcG5SWHJNVmppa1FrakNYck1aMThLZnJzV2ZxMEhtMXZHQVJBMGJ5OHVV?=
 =?utf-8?B?RVNNWUxRRFNuWWNSS3FrMDkxMERSWGFwVVZDbytoWjdWeEVSMjNyTExsSlBF?=
 =?utf-8?B?eG1jQmtsYmhBWXQ2ekxDVWxGS1ozak5LMHIvRWVNUUdTaXhkVWJEY0lTUVpT?=
 =?utf-8?B?SjRONVpmd0RhVVZjNFpUQmpxeDNSVTYxY3dvb0VVWXBGbnZDcnVrYnFXOCta?=
 =?utf-8?B?MHF2WmFFV2plNXNCdUVJcFRYVWtOb053dUhLdURKQm5JRUhwVU9YTnZrbWM5?=
 =?utf-8?B?MFdNdzFLTE5FWnNDaTNnOFdPUmZRUXlOTEphbFJWekVZR1FweWxHMDdvZFAr?=
 =?utf-8?B?SU5vZEZvWG1hdytJNnY3dUNKd0xROVQxdzZ6MDIraFVzNUx3TGJJcU5aQUJv?=
 =?utf-8?B?V2kyMUZuMDlFYTJLSGs0QVc1cU01Vk9Oa0t1T1ZubERHNXVFTGMzQjcwNjg0?=
 =?utf-8?B?dUJ1ZGo5emdDTWV5ZVRheHpIM3FHcncxZUlQMHhqRG9xeHZYQWIxakJ5TjZz?=
 =?utf-8?B?cjdET1l5dFNzUTJFVUJvbzFQMG4yVW9ZeVRLNTRFbzd3MjVtOTNjTGd1SnUv?=
 =?utf-8?B?dUROYTU4Z0djSkhWcmU0YXZCYVJta3NNb2VVM1dvTWFkcDBRaExSei9MS0t4?=
 =?utf-8?B?ODd3TzNsYjZ6S2Q0TWUwODdQNUpqU1plbmxRUGszMEl4aVZTUnNkOG5aeFlG?=
 =?utf-8?B?U3NmcFhjemZnTWJ2d0FMOUh5SkdwUjNQRCtqMGFKMXpLYXNwVklwTVIvb0FS?=
 =?utf-8?B?NlZnNWZMR0ptV09XL1pJR3A2ZVNYSjNaMHVEb083UDZyZmhjd1UrSWVvSkpz?=
 =?utf-8?B?NVREOGtoTkU1SG5YOVl1ek14V1orblp1RncrMUcwWUxKbmkwOFVETmZwM1RF?=
 =?utf-8?B?b2FCQ01xQktHVjBZZWpTQVFySWFOQkdoMVh4TXE0SXlmTFNlV1cvTDcvQjVU?=
 =?utf-8?B?ZlY0SjE2TDlISXZwbzRENkZJc1A3ZmhCTTNVZVZJRlI0UGpwUlJOTlpaMEpK?=
 =?utf-8?B?MXJPRWt4em9vTjRGU0JGR0NRSlN0ekluOFRxd04xWG50L1hIWjBTRjhRZGEr?=
 =?utf-8?B?ZHdaYVlkcDFlZEMraGh5ejJQWElIYnd0a0tSMk9WcG5IZ2ROaVdxalluRlIr?=
 =?utf-8?B?R2FIditFUEtJcndYeU5oaEhtTSt2K1V4RWlwNUZVdFB6WFVIY0p4bUJTQ2t1?=
 =?utf-8?B?SEU1bmNxdExVVUVFT2JEbDdHYU00aUpBT0x1RlJnamNLQmpwRG42cXV4cFRl?=
 =?utf-8?B?enNlamVQWHpqRFd5dGdYSThtdVFzR2VLcnRXWmUvWnZJVWlHRnVMR01hZW5r?=
 =?utf-8?B?QS9jUE0vSmE0UGJoZW15ajRnTUdWelg4YUdFcDBRSXBuOVhZb1pLVHByOWVw?=
 =?utf-8?B?dFNWZ0lqbkRGdGtwT05FWGF6MGYyMUhPZkhKbnBEb0pqQTJEUEREWW5xcHpt?=
 =?utf-8?B?ME5HaFFGVE5yYlhXYU9QZmd0R0N6Q281a1FzRXIxMmdvYTJNWjBnYjdHOGRO?=
 =?utf-8?B?YkhaWnk5VlZBMXozRzRTUm9xNm9Sb215YzQ0ZnFaTHRkcUd5SGxGZXRQRVpC?=
 =?utf-8?B?SUoyQnRHMlJQZ3Rma05Hd3Rvck1tak1qZ3pYZUl0S2tmdGxGTWdGM2F2UjJH?=
 =?utf-8?B?M2VNSDk4V1NIWGFvbGNaV05DM2tqQnJnSjB5cGxYalZjZ1NzMXFLaUlIUGJD?=
 =?utf-8?B?N2FxZ1pPZmYrcDhqejlodklXZThzTTRkZ2tJZHM3cy9iZ1dQYzdLZksrZ3ZF?=
 =?utf-8?B?QVdEc0locXIrMjhLTms2Nmd4TU5JSEhUMUN6UTlvV3g4Y2NCTE82QT09?=
X-Exchange-RoutingPolicyChecked: TWFtCzwv8W+8UBKNGSLs8KBWI9ZzuHMPnRrrIKt1QAX+eHssnsxnGliN7ZmAHuczzlwgPU5LlSKwvfeilmfDl/s3Cz8XPrC5zCBKOLd/Yczq3UDTVT10vFEJCtuBwO5lk7nQ/F+B41tEx8yFCI8MQsUn/J88pHrPXJu/1uNrbuG5QncS389SQCyJX8JiSbNaUkI+vvw32aYhcBIA9v0leAzBvUr4bB9A2U5evymfAHYLj4myRl1LPUYd4zj5VDJ24XtJbGesXa7zp/r3Fw/6MtQtQKhgwkbhJh2In2nE0mMMx9Tnp07gzPYfRaW/F2hCOEkA7JN3+FputTg1G5BjSw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a763d1-9ac1-41a3-96e7-08df3f391ec2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 14:44:27.6537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UEn8bJV5CVudelm5aZUIAysD9DImsDAMLoq9qcSM0FocPkRss5hQ2I5OFbtWf0Y9F+XlIQs25eHKFGDBqFeSbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7255
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/10/2026 15:28, Kamil Konieczny wrote:
> Fix compiler warning:
>
> ../tests/intel/xe_sriov_mmio_regs.c: In function ‘skip_if_on_whitelist’:
> ../tests/intel/xe_sriov_mmio_regs.c:306:14: warning: assignment discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
>    306 |         item = bsearch(&reg_addr, &allowlist[0], ARRAY_SIZE(allowlist), sizeof(allowlist[0]),
>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

Thanks,
Lukasz

> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   tests/intel/xe_sriov_mmio_regs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_sriov_mmio_regs.c b/tests/intel/xe_sriov_mmio_regs.c
> index 121ebdea6..1e7c9ff61 100644
> --- a/tests/intel/xe_sriov_mmio_regs.c
> +++ b/tests/intel/xe_sriov_mmio_regs.c
> @@ -298,7 +298,7 @@ static int addr_range_cmp(const void *addr, const void *range)
>   
>   static bool skip_if_on_whitelist(int pf_fd, uint32_t reg_addr)
>   {
> -	struct vf_regs_allowlist *item;
> +	const struct vf_regs_allowlist *item;
>   
>   	if (reg_addr < allowlist[0].start && reg_addr > allowlist[ARRAY_SIZE(allowlist) - 1].end)
>   		return false;
