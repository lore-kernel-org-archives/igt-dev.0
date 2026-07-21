Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A64DC4451C
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 13:20:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1700210E781;
	Tue, 21 Jul 2026 13:20:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PAqUe0hn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E12B10E360
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 13:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784640010; x=1816176010;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=p7rccl1hQt4GShfhT7yw4/OA2uaBUldjCgmJJ5MnRJ4=;
 b=PAqUe0hn5ERex7TmE54hFfEZR6W7W5N4LLMFH70lOtZdkKXQXqgPK4C/
 MgcidKOA+xFDCRAmCgpRxbirHjG/rxvHGNPL+t2mm4AqH1WAMxIX/OJWd
 rf+t2WsapT6vHkBLLng+nvpiBr9EjqUUaycJexNF0oisLK2kjrr5RYT/3
 8VEfeOBxZPmIHZDQyvC9lzFTvG31OM+eXBkMmZkhnD9Z9214c4e117qeG
 KzfWUGTbxm9nRQiyKqcurQhIPtGFlX1ZFBOBkMbU68H5nIwbN2spzKWkN
 x+ARMbi5NkRy5XoBdYC4mO9xuBP1jUBlNiI4hm26E2Q/PZT1Sbsr8PZud Q==;
X-CSE-ConnectionGUID: dmY0rNNKSLCfq2Uv35Nsng==
X-CSE-MsgGUID: PdGVYhGeTu20d4VO3NGJ7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="110790288"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="110790288"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 06:20:09 -0700
X-CSE-ConnectionGUID: LX+EYv8GSQC8jEgEOfOvIw==
X-CSE-MsgGUID: yJ6iMTMrTdek7kdgcxRhWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="255117084"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 06:20:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 06:20:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 06:20:05 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 06:20:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w25Ah6iq/O/QQkJK936GS67gCH4niZUsMsLbXD6pSK4BxeLvzCl8MWsh3hSixRvZrXLpGY/xdFNM2R7j7z3oJ40RT+GkrRtNK2ZqQx3OwJ/396RAQATURZhbzC5F+mmvGaLKjqAl2ZbtRfJqWxaRHFUBk73x2uvrNb2xfV9q4Tt4IWuy1HgluKi6bXxrplqb0/V3OwUHbr4QYlUw4i+GNIIFswETvl4QR91HyM/d1cqcstagpipysk+V2w9jHGJywWNrnsHFcPUvQkoAv/z0vzt1Sx+yYpQqgBTWuiMfVBEY/4+nM8Rp2hVkihb7zThi/0lEjrhdwxNyl3CHhlTBEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p7rccl1hQt4GShfhT7yw4/OA2uaBUldjCgmJJ5MnRJ4=;
 b=HQ4T+kj3EPHEI49OimWktEBArTIvSk8We6VAfGqW9OC5yIMr4GWFbtp1pMKkflnBZ9cWa8g8F8xLYh9JOm+fJ7zQYZN4fNpKs5LwfrOx+WIdvcofgpj2Kjk5rst2ysc9ewxPJlEl4xXElSDBQ1oaOuCJ3GWbdZkK7kPBoUZz6oQPqW4aQkUCbLOGac8im0Lh2vUuv9rKEcoMSgt33LHvrZfHsBzD7VFChdvVk9msa44ACcx7Aw/3m71Tz1MdGC5/4DdFwobPsplGtzEd+wOWsfnr2tADHq+5zGby5KzB4d5yMq8BSzrEcM0+K6JTykNg+OKYpsuCf6fm5gwyAjxXUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com (2603:10b6:a03:3bc::9)
 by DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.10; Tue, 21 Jul 2026 13:20:02 +0000
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd]) by SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd%5]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 13:20:02 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [i-g-t,v1,2/2] runner: Create new option for incremental results
Thread-Topic: [i-g-t, v1,
 2/2] runner: Create new option for incremental results
Thread-Index: AQHdGRL3XNGTI9VVUU6EeGkblC1/KrZ39R0A
Date: Tue, 21 Jul 2026 13:20:02 +0000
Message-ID: <ab3f212acab766cd62f3ab5d84489cc387653563.camel@intel.com>
References: <20260720161526.64709-3-kamil.konieczny@linux.intel.com>
In-Reply-To: <20260720161526.64709-3-kamil.konieczny@linux.intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5663:EE_|DS7PR11MB6039:EE_
x-ms-office365-filtering-correlation-id: a6ed7173-0ae0-47c9-d41d-08dee72ac5b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: aOdxOef8YG4DffwkTD1EJm7+iBPt6je68Qk1m2FlP3nCbrg0cFpeBqvt2vnoZM4nIQ0NRFaDegYaYnu9mq+8JI9DE80zB9Yk78G0w28PmfeY/aTI3vWMa9mkAAOWedpIeu6LnngEhpkJ8eUEVQZkIhdEhp+gWFjgWxpNiGk0+ZUGkkasNuIC+zlpMJR5Hjcz7tg7CYkHaZ/U5X/4XOBudkHO/uITi+trvhWezSaBqpBtVUdyEws2YvaLrFTBe1HQ6lTLPBXJ1mbGEYe/RZfBHrtkt1yg07f22nXlv6+P711AI7x5lYxLZK5TwqKizFTDMgZMlAaWFEIVPfQfee7FG+SGHiFqoeOXhE8SrClop0jMpjY69tUKAENhMZME0Rbxvr30PYUoyjlXtlEC3ZTLG7m/M+0P1eU9LaE6sqpXAz++Yn5ME/KojOv+3wW9W6uQUZjtIAQIhsBPaFlxgJgF5R/9M/DXNXganrQY8+eOldKtl4XzwE899ZaG5w1aNTTrJTbHqZr46kEP82HeALLMXXDSpxHf5IuoCOsFZK2VWukO3wpaSOmBypRey7WsiPusdhCrefekbMkd+s0ZxabIPHJZAZfv67ib/NVAVri6LU43LTlAeQNLS2Umuf+KRBMCFgYWj0QVbNQHs3iFiBbw4S3be7wKknzCP5l3rO/wIR/l6cfg44eLReEQVk7rBZsWmZRCIBTrAz1wouFWW6n7iA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5663.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWFGcWsxdGcwTTV4YWs5ZDZJMlkzQ3JhMVlJSlRhaVhwOEZaeXNjVk1JUDFv?=
 =?utf-8?B?RlZRY252WkJEclovNVY2L1N5UFQzMDFISm50R25qeWN6cEY5ZlNGWmJGWGN0?=
 =?utf-8?B?RTdLc2xyZGFlZXJLSENGMlFCOENJZHAvczVaUFBXMEgvakR5WG5vLzdvbUJ0?=
 =?utf-8?B?VTZVZklTTzNBYVNJZlh6dWhua1lzS0swNEFXYXJxcExOZVBSQW1LVjdUdWgy?=
 =?utf-8?B?eXplM3lOWUh0dXFvem5QcWZpVXNQZkxNZFIvNlJ1M1hkbk1MZEl5aklscHd0?=
 =?utf-8?B?VmNGNE5xNUxNaHpYKzIzcHE5S2dTcC84dkIwWkFnWDhGelg0dmczUVJIY1BK?=
 =?utf-8?B?S1pIbjNQdVNVVjcxNS9MWmR4eEU1RWhCVWppa2pkemJsSXBBNTk3UEZTUkxj?=
 =?utf-8?B?a0dJS1cyU3RxUzY4Y3lYbXNTNVByOWhSeTlTSnJFSFJ1Z29kQm1LME84TVpS?=
 =?utf-8?B?MUpwQjBEbHRlZS84UDhDVUpxb0dTZFVZYTVtQ3NhTEsvTjViUzI1TVZJaUdN?=
 =?utf-8?B?V005N2JlWDRkck1lWU9xSzhpTjFaUktuY0hyUTZ0cGJQcHdId0xZaEpVQ05i?=
 =?utf-8?B?dnRBU2VvbGRHYWRNajlaY00yVDl6U3dxeDZoZ3o5ZTZiV01udzZSYk4zdCta?=
 =?utf-8?B?V25iY1ZuSG80b3RDbnFTdi9ZeVRGMFdVNVd4T1IrcFNkQnhVQ1NZcGdJbWxm?=
 =?utf-8?B?eVFPTDN4eTYrUDlRNHNpWkpvU081Zm1KN0FleE1OUzBkMmtPQjJQZXZTQUVu?=
 =?utf-8?B?WHVsOVRWZSt1VW5VZ0k3UksxUkVnd0NwNURja0ZpQUl6Qy9GWWMvd0VRYm1a?=
 =?utf-8?B?Q2ZNSGJTdlJ1c0hNS0hIcGpmZyttcHpuQ0J5dlRFa3hGdFZIWWZ4Q2RXZHcy?=
 =?utf-8?B?N1djaGtvNzRscXdBVkZLWktVZnVsOGYxS2VVdGRtVEJxdFZjNVp5NlVvMTMr?=
 =?utf-8?B?aTN1R2syM1Yyb2ZmaHZUM2llMVZEb3FXbk55WEl6TTFhUjlvdkRXaHRQdUc5?=
 =?utf-8?B?cGpKK1FzRWxzR2h6ZlRVVUNtNTlheEs2R0hCQlhMa253aGxHSmxyM0l5Q2Rm?=
 =?utf-8?B?UXhha0tDQXR0UElESEtuUjB3RmpxZ1M0bEk0U2JwUHN3UFJ1TzY4WGEzNWNG?=
 =?utf-8?B?MThNOW1Gc3FMdzFoZW1iZlBsMURtaHZ0djBZN3BsMnUzQUk0VDIvWmtXRVV4?=
 =?utf-8?B?TldnY2w5NFJEcGRqUnRoYVhEOG93bnZUNzJWcFJyNTRtSnR6dlhHUThBOFpF?=
 =?utf-8?B?TEt4SWdtdjQyTU1MRnYvNmRVUVJ1WjRwQy9zYnZQbVpYSDlraVZ3RkpyWFRk?=
 =?utf-8?B?UVpvVUVTSEwzdm5zVHVXYjNHb2plcytqUjhyaFdmK0NZdTJzbHBSQ3NhVHZ0?=
 =?utf-8?B?d0ZkUzNrVmZRaUlJQzBqWU93QXRTSVh1eWI2UDFZWGUybThxVFhUdDZURENr?=
 =?utf-8?B?UjVlVjE0MDJDMFM3TUZVU1Q4ME5MOFVVVFRQWi9PK2d5TFUwUFBnYXhsZHlS?=
 =?utf-8?B?S0gvWWVUWHNldDNPb3pqM25mdUpKalQwY0RUWUJTQ1Y5Yk1PUDlZMS90L0tZ?=
 =?utf-8?B?eHZKNXVvRnVCbzAreThHWCtLOFdoaGl0ckRSYnFLaXJ3VndYV1IzZlVhaDA4?=
 =?utf-8?B?eVRySDdET1dLeE9QenRpdHZVSGdPdm1xeXA0YXlHMXhUNHVJdnh6eHlDcmhP?=
 =?utf-8?B?Y1ZkQWJHY1NnMmJ5YnBMcUU1dnhTLzdCcXNpY2hPeVRvc2oyano1SlB2Rlkr?=
 =?utf-8?B?NDd5OG9pNThxTVpmc2lSNGFLcjJmd3RqVHpnWVp4cXhXTjRnOTJSQnFGWFZu?=
 =?utf-8?B?U2k2R2tQektkTC9CNEVmbjVSUi8vb1M2NDhVOS9wZGJrdS9xQU80Q1NUb3BS?=
 =?utf-8?B?RS9vNjlMRTRvY3huMGZOblV6ZVdoSnZQRTVjMjJBb1ZZdi9QSzQycDU0WGRP?=
 =?utf-8?B?Q3BoV2FwNTNHVXhFMWpZOTIzcytqRytseUFZWU9qd2lMQlhjSVNDcUc5cEFt?=
 =?utf-8?B?WXNHV01qYkVvSVM2MUZnMjloeGN3RFR0cHAreWdKRGNIRmsycjc4bkw5a1BW?=
 =?utf-8?B?cDNtZHJrYkpnTGcxc21GWGt0Q2t3ZUIvQ0cvN3BLcDJ0RzFGSmhNNUpDSmFs?=
 =?utf-8?B?OTFtN0krYndFTXBCRW9sNUdhOGQycHBvakE2NGoyVGFpWnMzT0FzN0F3UDFZ?=
 =?utf-8?B?dkhzS1RSeGdtaU1qV0lwMUZ3czY0MFRvOGs0dVlWbXlzNjdqcGN6dkNmajZG?=
 =?utf-8?B?eWR4SVBMdktvRTVTa0xzWGJXWURoTG9YUVZNNzRQK1F4S3c1OVJSclRsdldC?=
 =?utf-8?B?SjFMdlBVbm1BWEFYZHc4ZnkvTm41OW4zTUNvajFBV1dPbWNYV3pFbERxZ1Y0?=
 =?utf-8?Q?b0z3aOUR+N9Izgfs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E26A9570ECC048489B3D440FBABE6ED5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: HRe1M4/1N/hmqC3UPupsIpga7tdDzdqoCHyncLvftIX/h80K3YkDrmwTJQcfSgfqD8PzfudGOmunxg65l2EcNIw0F+opQ6vda6HMLGdFfC6ifiXK9tjkU84aBlAflIvddecCXnNMYwnaHhUIk50VTPflWRk6LAedVe+L3uNY5NtvKJLdlaqW0onC6Exq+uXOA1zwgyDWr8fZfcIVqLn5nY05DUKXAS7bJLTsT+he6XBjEy92D+a7cgkQt5codZCOigznR40sI4Kp9Pm79amrPancvAAxGafJIJMDDF/2wxUufWevMnMuLn7BqPCZDjPQfjkreF6dlhrdv9Tv7lOTDg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5663.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ed7173-0ae0-47c9-d41d-08dee72ac5b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2026 13:20:02.4386 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RO2YpaNSyq7cAaBooPdCGuTjPxk6KpgogBxPnf5hg2G4aI3t9oc2nT5lp9BIIO8EmJfqQrON56OoC5qN1n0Psw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6039
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

T24gTW9uLCAyMDI2LTA3LTIwIGF0IDE4OjE1ICswMjAwLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6
DQo+IENyZWF0ZSBuZXcgb3B0aW9uIC0taW5jLXJlc3VsdHMgd2hpY2ggd2lsbCBtYWtlIHJlc3Vs
dHMuanNvbg0KPiBhZnRlciBlYWNoIHRlc3Qgd2FzIHJ1biwgbm90IG9ubHkgYWZ0ZXIgbGFzdCBv
bmUuDQo+IA0KPiBQbGVhc2Ugbm90ZSB0aGF0IHRoaXMgY291bGQgYmUgc29tZXdoYXQgbWlzbGVh
ZGluZyB3aGVuIGEga2VybmVsDQo+IHBhbmljIGhhcHBlbnMgZHVyaW5nIGFuIGV4ZWN1dGlvbiwg
YXMgYSByZWFsIHRlc3QgY2F1c2luZyB0aGlzDQo+IHdpbGwgbm90IGJlIHRoZXJlLiBJbiBzdWNo
IGNhc2VzIG9uZSBzdGlsbCBuZWVkcyB0byBydW4NCj4gaWd0X3Jlc3VsdHMgdG8gYWRkIHRoYXQg
bGFzdCBvbmUgdG8gcmVzdWx0cy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEthbWlsIEtvbmllY3pu
eSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICBydW5uZXIvZXhl
Y3V0b3IuYyB8IDE5ICsrKysrKysrKysrKystLS0tLS0NCj4gIHJ1bm5lci9zZXR0aW5ncy5jIHwg
IDggKysrKysrKysNCj4gIHJ1bm5lci9zZXR0aW5ncy5oIHwgIDEgKw0KPiAgMyBmaWxlcyBjaGFu
Z2VkLCAyMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L3J1bm5lci9leGVjdXRvci5jIGIvcnVubmVyL2V4ZWN1dG9yLmMNCj4gaW5kZXggYjIwNGZkZmZj
Li43YzkyM2JlZDMgMTAwNjQ0DQo+IC0tLSBhL3J1bm5lci9leGVjdXRvci5jDQo+ICsrKyBiL3J1
bm5lci9leGVjdXRvci5jDQo+IEBAIC0yMDQ1LDYgKzIwNDUsMTEgQEAgc3RhdGljIGJvb2wgY2xl
YXJfb2xkX3Jlc3VsdHMoY2hhciAqcGF0aCkNCj4gIAkJcmV0dXJuIGZhbHNlOw0KPiAgCX0NCj4g
IA0KPiArCWlmIChyZW1vdmVfZmlsZShkaXJmZCwgInJlc3VsdHMub2xkIikpIHsNCj4gKwkJZXJy
ZigiRXJyb3IgY2xlYXJpbmcgcmVzdWx0cy5vbGQgOiAlbVxuIik7DQo+ICsJCXJldHVybiBmYWxz
ZTsNCj4gKwl9DQo+ICsNCj4gIAlmb3IgKGkgPSAwOyB0cnVlOyBpKyspIHsNCj4gIAkJc3RydWN0
IHN0YXQgc3Q7DQo+ICANCj4gQEAgLTI0ODQsNiArMjQ4OSw5IEBAIHN0YXRpYyBib29sIGdlbmVy
YXRlX3Jlc3VsdHNfd2l0aF9lbmR0aW1lKGludCByZXNkaXJmZCwgc3RydWN0IHNldHRpbmdzICpz
ZXR0aW5nDQo+ICAJZG91YmxlIGVuZF90aW1lOw0KPiAgCWJvb2wgcmV0Ow0KPiAgDQo+ICsJaWYg
KCFzZXR0aW5ncy0+aW5jX3Jlc3VsdHMpDQo+ICsJCXJldHVybiB0cnVlOw0KPiArDQo+ICAJcmVt
b3ZlX2ZpbGUocmVzZGlyZmQsICJyZXN1bHRzLmJhayIpOw0KPiAgCXJlbmFtZWF0KHJlc2RpcmZk
LCAicmVzdWx0cy5qc29uIiwgcmVzZGlyZmQsICJyZXN1bHRzLmJhayIpOw0KPiAgDQo+IEBAIC0y
NzU4LDEyICsyNzY2LDExIEBAIGJvb2wgZXhlY3V0ZShzdHJ1Y3QgZXhlY3V0ZV9zdGF0ZSAqc3Rh
dGUsDQo+ICAJCQkJcmV0dXJuIGZhbHNlOw0KPiAgDQo+ICAJCQlyZXR1cm4gZXhlY3V0ZShzdGF0
ZSwgc2V0dGluZ3MsIGpvYl9saXN0KTsNCj4gLQkJfQ0KPiAtDQo+IC0JCS8qIGl0IHNob3VsZCBj
aGVjayBvcHRpb24sIGFsc28gbWVhc3VyZSB0aW1lIHRha2VuICovDQo+IC0JCWlmICghZ2VuZXJh
dGVfcmVzdWx0c193aXRoX2VuZHRpbWUocmVzZGlyZmQsIHNldHRpbmdzKSkgew0KPiAtCQkJc3Rh
dHVzID0gZmFsc2U7DQo+IC0JCQlicmVhazsNCj4gKwkJfSBlbHNlIHsNCj4gKwkJCWlmICghZ2Vu
ZXJhdGVfcmVzdWx0c193aXRoX2VuZHRpbWUocmVzZGlyZmQsIHNldHRpbmdzKSkgew0KPiArCQkJ
CXN0YXR1cyA9IGZhbHNlOw0KPiArCQkJCWJyZWFrOw0KPiArCQkJfQ0KPiAgCQl9DQo+ICAJfQ0K
PiAgDQo+IGRpZmYgLS1naXQgYS9ydW5uZXIvc2V0dGluZ3MuYyBiL3J1bm5lci9zZXR0aW5ncy5j
DQo+IGluZGV4IDNjY2Y3MTg3MC4uYzUyZmVkOTJiIDEwMDY0NA0KPiAtLS0gYS9ydW5uZXIvc2V0
dGluZ3MuYw0KPiArKysgYi9ydW5uZXIvc2V0dGluZ3MuYw0KPiBAQCAtMjMsNiArMjMsNyBAQCBl
bnVtIHsNCj4gIAlPUFRfRElTS19VU0FHRV9MSU1JVCwNCj4gIAlPUFRfVEVTVF9MSVNULA0KPiAg
CU9QVF9JR05PUkVfTUlTU0lORywNCj4gKwlPUFRfSU5DX1JFU1VMVFMsDQo+ICAJT1BUX1BJR0xJ
VF9ETUVTRywNCj4gIAlPUFRfRE1FU0dfV0FSTl9MRVZFTCwNCj4gIAlPUFRfT1ZFUkFMTF9USU1F
T1VULA0KPiBAQCAtMzA5LDYgKzMxMCw3IEBAIHN0YXRpYyBjb25zdCBjaGFyICp1c2FnZV9zdHIg
PQ0KPiAgCSIgICAgICAgICAgICAgICAgICAgICAgICBTZXQgYW4gZW52aXJvbm1lbnQgdmFyaWFi
bGUgZm9yIHRoZSB0ZXN0IHByb2Nlc3MuXG4iDQo+ICAJIiAgICAgICAgICAgICAgICAgICAgICAg
IElmIG9ubHkgdGhlIGtleSBpcyBwcm92aWRlZCwgdGhlIGN1cnJlbnQgdmFsdWUgaXMgcmVhZFxu
Ig0KPiAgCSIgICAgICAgICAgICAgICAgICAgICAgICBmcm9tIHRoZSBydW5uZXIncyBlbnZpcm9u
bWVudCAoYW5kIHNhdmVkIGZvciByZXN1bWVzKS5cbiINCj4gKwkiICAtLWluYy1yZXN1bHRzICAg
ICAgICAgU2F2ZSByZXN1bHRzIGluY3JlbWVudGFsbHkgYWZ0ZXIgZWFjaCB0ZXN0IHdhcyBydW5c
biINCg0KQ2FuIHRoaXMgYmUgbmFtZWQgc29tZXRoaW5nIGxpa2UgIi0tc2F2ZS1yZXN1bHRzLWFm
dGVyLWVhY2gtdGVzdCIgb3INCnNvbWV0aGluZyBsaWtlIHRoYXQ/IEl0J3Mgbm90IHJlYWxseSAi
aW5jcmVtZW50YWwiLCB0aGUgZW50aXJlDQpyZXN1bHRzLmpzb24gaXMgZ2V0dGluZyBnZW5lcmF0
ZWQgZnJvbSBzY3JhdGNoIG9uIGVhY2ggcnVuLCBhbmQgYQ0KbG9uZ2VyIG5hbWUgaXMgYSBiaXQg
bW9yZSBkZXNjcmlwdGl2ZS4NCg0KPiAgCSIgIC1MLCAtLWxpc3QtYWxsICAgICAgICBMaXN0IGFs
bCBtYXRjaGluZyBzdWJ0ZXN0cyBpbnN0ZWFkIG9mIHJ1bm5pbmdcbiINCj4gIAkiICAtLWNvbGxl
Y3QtY29kZS1jb3YgICAgRW5hYmxlcyBnY292LWJhc2VkIGNvbGxlY3Qgb2YgY29kZSBjb3ZlcmFn
ZSBmb3IgdGVzdHMuXG4iDQo+ICAJIiAgICAgICAgICAgICAgICAgICAgICAgIFJlcXVpcmVzIC0t
Y29sbGVjdC1zY3JpcHQgRklMRU5BTUVcbiINCj4gQEAgLTY5Myw2ICs2OTUsNyBAQCBib29sIHBh
cnNlX29wdGlvbnMoaW50IGFyZ2MsIGNoYXIgKiphcmd2LA0KPiAgCQl7ImFib3J0LW9uLW1vbml0
b3JlZC1lcnJvciIsIG9wdGlvbmFsX2FyZ3VtZW50LCBOVUxMLCBPUFRfQUJPUlRfT05fRVJST1J9
LA0KPiAgCQl7ImRpc2stdXNhZ2UtbGltaXQiLCByZXF1aXJlZF9hcmd1bWVudCwgTlVMTCwgT1BU
X0RJU0tfVVNBR0VfTElNSVR9LA0KPiAgCQl7ImZhY3RzIiwgbm9fYXJndW1lbnQsIE5VTEwsIE9Q
VF9GQUNUU30sDQo+ICsJCXsiaW5jLXJlc3VsdHMiLCBub19hcmd1bWVudCwgTlVMTCwgT1BUX0lO
Q19SRVNVTFRTfSwNCj4gIAkJeyJrbWVtbGVhayIsIG9wdGlvbmFsX2FyZ3VtZW50LCBOVUxMLCBP
UFRfS01FTUxFQUt9LA0KPiAgCQl7InN5bmMiLCBub19hcmd1bWVudCwgTlVMTCwgT1BUX1NZTkN9
LA0KPiAgCQl7ImxvZy1sZXZlbCIsIHJlcXVpcmVkX2FyZ3VtZW50LCBOVUxMLCBPUFRfTE9HX0xF
VkVMfSwNCj4gQEAgLTc2OCw2ICs3NzEsOSBAQCBib29sIHBhcnNlX29wdGlvbnMoaW50IGFyZ2Ms
IGNoYXIgKiphcmd2LA0KPiAgCQljYXNlIE9QVF9GQUNUUzoNCj4gIAkJCXNldHRpbmdzLT5mYWN0
cyA9IHRydWU7DQo+ICAJCQlicmVhazsNCj4gKwkJY2FzZSBPUFRfSU5DX1JFU1VMVFM6DQo+ICsJ
CQlzZXR0aW5ncy0+aW5jX3Jlc3VsdHMgPSB0cnVlOw0KPiArCQkJYnJlYWs7DQo+ICAJCWNhc2Ug
T1BUX0tNRU1MRUFLOg0KPiAgCQkJLyogVGhlIGRlZmF1bHQgaXMgb25jZSAqLw0KPiAgCQkJc2V0
dGluZ3MtPmttZW1sZWFrID0gdHJ1ZTsNCj4gQEAgLTEyMzUsNiArMTI0MSw3IEBAIGJvb2wgc2Vy
aWFsaXplX3NldHRpbmdzKHN0cnVjdCBzZXR0aW5ncyAqc2V0dGluZ3MpDQo+ICAJU0VSSUFMSVpF
X0lOVChmLCBzZXR0aW5ncywgZHJ5X3J1bik7DQo+ICAJU0VSSUFMSVpFX0lOVChmLCBzZXR0aW5n
cywgYWxsb3dfbm9uX3Jvb3QpOw0KPiAgCVNFUklBTElaRV9JTlQoZiwgc2V0dGluZ3MsIGZhY3Rz
KTsNCj4gKwlTRVJJQUxJWkVfSU5UKGYsIHNldHRpbmdzLCBpbmNfcmVzdWx0cyk7DQo+ICAJU0VS
SUFMSVpFX0lOVChmLCBzZXR0aW5ncywga21lbWxlYWspOw0KPiAgCVNFUklBTElaRV9JTlQoZiwg
c2V0dGluZ3MsIGttZW1sZWFrX2VhY2gpOw0KPiAgCVNFUklBTElaRV9JTlQoZiwgc2V0dGluZ3Ms
IHN5bmMpOw0KPiBAQCAtMTM1Myw2ICsxMzYwLDcgQEAgYm9vbCByZWFkX3NldHRpbmdzX2Zyb21f
ZmlsZShzdHJ1Y3Qgc2V0dGluZ3MgKnNldHRpbmdzLCBGSUxFICpmKQ0KPiAgCQlQQVJTRV9JTlQo
c2V0dGluZ3MsIG5hbWUsIHZhbCwgZHJ5X3J1bik7DQo+ICAJCVBBUlNFX0lOVChzZXR0aW5ncywg
bmFtZSwgdmFsLCBhbGxvd19ub25fcm9vdCk7DQo+ICAJCVBBUlNFX0lOVChzZXR0aW5ncywgbmFt
ZSwgdmFsLCBmYWN0cyk7DQo+ICsJCVBBUlNFX0lOVChzZXR0aW5ncywgbmFtZSwgdmFsLCBpbmNf
cmVzdWx0cyk7DQo+ICAJCVBBUlNFX0lOVChzZXR0aW5ncywgbmFtZSwgdmFsLCBrbWVtbGVhayk7
DQo+ICAJCVBBUlNFX0lOVChzZXR0aW5ncywgbmFtZSwgdmFsLCBrbWVtbGVha19lYWNoKTsNCj4g
IAkJUEFSU0VfSU5UKHNldHRpbmdzLCBuYW1lLCB2YWwsIHN5bmMpOw0KPiBkaWZmIC0tZ2l0IGEv
cnVubmVyL3NldHRpbmdzLmggYi9ydW5uZXIvc2V0dGluZ3MuaA0KPiBpbmRleCA2YzU4YzMyODIu
LjEwZjk1ZjI4NiAxMDA2NDQNCj4gLS0tIGEvcnVubmVyL3NldHRpbmdzLmgNCj4gKysrIGIvcnVu
bmVyL3NldHRpbmdzLmgNCj4gQEAgLTYyLDYgKzYyLDcgQEAgc3RydWN0IHNldHRpbmdzIHsNCj4g
IAlzdHJ1Y3QgaWd0X2xpc3RfaGVhZCBlbnZfdmFyczsNCj4gIAlzdHJ1Y3QgaWd0X3ZlYyBob29r
X3N0cnM7DQo+ICAJYm9vbCBmYWN0czsNCj4gKwlib29sIGluY19yZXN1bHRzOw0KPiAgCWJvb2wg
a21lbWxlYWs7DQo+ICAJYm9vbCBrbWVtbGVha19lYWNoOw0KPiAgCWJvb2wgc3luYzsNCg0KVGhh
bmtzLCBSeXN6YXJkDQo=
