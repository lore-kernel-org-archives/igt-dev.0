Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F222606A321
	for <igt-dev@archiver.kernel.org>; Tue, 10 Nov 2026 06:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hmDp3MPj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0969310EDF1;
	Tue, 10 Nov 2026 06:05:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591ED10EDE5;
 Tue, 10 Nov 2026 06:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794290666; x=1825826666;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=qI8EClS8VtKO3HFQKV3zRowbgXuOH4RovbPs/FEPXPc=;
 b=hmDp3MPjrgM/bKfO3hJaRB226M+wYZm83uOC/2kQf1QUm6ZwQ9EE29CU
 cBN1OCtm5fxA1Rijc1gF2snp9qFqxUXcRZYbq4o8I9AA4vn2YHKaRVY9E
 vkciDM6k7iCFD7xkeamg/6CBweHhvdKASGZQhyi1UsqD08pXB7WrPEQ1U
 TkuKMo3YOekOKpSMeu9BLhBS4ypINgQwYSv7v5G8xcfLYTcnRRUfeIHmd
 /WsKg5BtR/rLyqxjNvuOU/K11Mvhptx7VEAp5ox/9zNqJDuvYrSc90nze
 h2pa696L6W803pMko3QmVNQeJumjVsZ5PI9MG+C5GMFIBYLmsDfc2YKBF A==;
X-CSE-ConnectionGUID: Y9QGMIoCRFmgEt+4QDOQAw==
X-CSE-MsgGUID: 0YTenM5kTVWWHw8PFX6Yyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3019698"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; d="scan'208,217";a="3019698"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 22:04:17 -0800
X-CSE-ConnectionGUID: Z3RrFvVsSVCgHS1zWignbA==
X-CSE-MsgGUID: Z75eixDaR024Ajm8xHo33g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; d="scan'208,217";a="7944160"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 22:04:16 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 22:04:15 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 22:04:15 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.20) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 22:04:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLguKaG810Jh9cn7TDimKAbO9RXKpR+hx4A0oqkBiv1Ilc3kiXN3C547Zw8Xv6ksP0u/03/fYlJlSgw5ZiFwsmwzMg+RRSB9j9qzGMEvrIxfPqM7DScVRFqBq/+yt/IRCBK028etgvRi0746zr3XgGbL2Cln05VLaXC5iVwmw+i3wwVe0O/Sm5YeGRwB6zt1MbrsN0As8FMo0Xb1R+RYWbnYN88rHOfwts9FgxBF302Qq6OHoJpOct23EvclkX6t+lO9jt8Njako8Ge5DQftaH7OLWAZxk2wTEok5OjqEx3egAJ/tR2XmyZBpIbXUqHbS/pyu38oaFtICoINFksOpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBA+GMc1/KKnfy1qoguDzckt8PGzyv0JJ9KJbOma9x4=;
 b=n15onasJAK6ELp0uSkew51IiMZiBLUqiW9shnDQbf6MOK92BdKE1Aiq/SnCeI7G850mUiH8kzVonuy9l24vpccgMB3igCHAY/65phxA6K3CXdf0/Po0BI/yjjjZQPjlZJSqOJGD3DNRwNoSQZUEh/kqCvVPcKx7VRn8JIkmYxw3+317ftUpkTNk054AqzogQGjr4oI7YB8yBH5XxKhsQYi0DF5O3KV8qjOn+OW3kYsqY7jlFUVTYoEOhJ6AoMuYAtoVKwy/8D1HyronjJyI1nDn1YoBjGR1fqNsd5CSYztsfMh1S3swcOk+FYXeVSSVfKAb5Db8clSa5moRu/KGC2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB662844.namprd11.prod.outlook.com
 (2603:10b6:806:538::23) by DSVPR11MB9744.namprd11.prod.outlook.com
 (2603:10b6:8:352::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 06:04:12 +0000
Received: from SA3PR11MB662844.namprd11.prod.outlook.com
 ([fe80::cd9:c00b:a7aa:e841]) by SA3PR11MB662844.namprd11.prod.outlook.com
 ([fe80::cd9:c00b:a7aa:e841%3]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 06:04:12 +0000
Content-Type: multipart/alternative;
 boundary="------------1FxOXK4SJgdaND0cZHD1HGMs"
Message-ID: <50ce25e9-0d6a-42d7-a1a6-cfbd54c9fbc7@intel.com>
Date: Tue, 10 Nov 2026 11:34:05 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/inte?=
 =?UTF-8?Q?l/xe=5Fwedged=3A_Add_cold-reset_wedge_test_=28rev8=29?=
To: <igt-dev@lists.freedesktop.org>, <I915-ci-infra@lists.freedesktop.org>
References: <20261105123002.1368655-4-sk.anirban@intel.com>
 <179389095846.125928.9611996889184010090@221881a7231d>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <179389095846.125928.9611996889184010090@221881a7231d>
X-ClientProxiedBy: MA5PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::8) To SA3PR11MB662844.namprd11.prod.outlook.com
 (2603:10b6:806:538::23)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB662844:EE_|DSVPR11MB9744:EE_
X-MS-Office365-Filtering-Correlation-Id: 72a3ba67-c862-4ac7-168c-08df3ef0714c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|22082099003|18002099003|10067099003|13003099007|8096899003|11063799006|5023799004|4143699003|261102123227099003|261021133027099003|261028144727099003|261022115727099003|261022105027099003|261022113327099003|261022075727099003|261021135927099003|56012099006|261026140227099003|261021121427099003|261021130227099003|261026135527099003|261009223027099003|261021123027099003|261026130827099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: 5YteIc9hFfzuqRC6O1vZQEbxvZB1/2lDTbHkn7ERQCR91kktA1h42sSHTcbiUCfg5pkfcXhx4LrA5rjn49tjUbMN86vzv6MjSZheSF37QiDjzHzdzwC2hiSZZOjDA71gFNvVIVZBxkDK5dGVZTN9EzQ2GptJSPEty4L89/54pRlEwDJ9goB0kYTXA1QzV99hQbZ22SCQ4buBcvleLLQ6IcCM0bVy4+1hcE8KlFAjIXtDSidIPthI+4SrgefQX4Uz4DCeKepi/wtmPrmgw83Hnu6p2Qyl9MJqGmGld5htIt2Pp0PGKEFUqfYqFnu9zmIkfj1HIB05xR8epP40UxMnzpxCv49tFK6QcVdurrD9zxZ4G+juPbg1paJHK501mIcYJRWgrcYZeCDm5LW5mSmP6W+HQDb4MN5cp3JL8CJx3SOhcwSuzqgB0dAd1xruvx/fCMbfNHncgfpAyVsJ5loriUBc73IzUXSQCAT3GWx3KBNvri0JS7CxLRNwDY+/C0HBtYTBKShpTUfdBBL2F6qy197wl55lcfQxzq5zbuGnZRZfw96Tqgy9ACSpcZAr+ScZ0JxoMNQUSRLKjNQhtZeHF6FX9fNEBw/hZoe4Vb2Flf1PAEQyKWPyqbZsyUzTxmis
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB662844.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(10067099003)(13003099007)(8096899003)(11063799006)(5023799004)(4143699003)(261102123227099003)(261021133027099003)(261028144727099003)(261022115727099003)(261022105027099003)(261022113327099003)(261022075727099003)(261021135927099003)(56012099006)(261026140227099003)(261021121427099003)(261021130227099003)(261026135527099003)(261009223027099003)(261021123027099003)(261026130827099003)(261026121527099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGR5ZVdYTTlNY3F1Z2pHWWJSYTdMUlRreE5waUFuOHd3TnkxOE41QmVuazgr?=
 =?utf-8?B?V0Rqbk4wVXdiZVpVU3FCOC9JTWRDV013YklSK2krKzVtekc1N3JVWGN1NjEr?=
 =?utf-8?B?Q3d1MDJIeTR4d0VqcXkrZ0l2WmsrMHY0cjBSNTBjaVpmcHVkNk5UMzAxTmI4?=
 =?utf-8?B?Z0QyaTBZOHlxWVp6YVFRSlpPK1BvbEdRM3hiNEs5a2w0YmdYTllRQ2RaYnlW?=
 =?utf-8?B?UitESkwzZGR1a2hIRVVIZHN4ZkxVSGJ4Q01WSjRCdUQ3WXQ1TXIzMktub3BT?=
 =?utf-8?B?dXQyUjBFZ0NDTUx5YW1WOUt3SlV2ZlF2bm9WbDB0dnlpVHZ4cDBUNGZzRkx3?=
 =?utf-8?B?U1NtWWM5d3NTVjhYYTVPc2RBU3lHS1Q3dVJpN29sMlphTDVwWVRFMmRQZWxz?=
 =?utf-8?B?d3V4MTM5UmZRanRnTWFId0U4YkFBeDNqRGd1aDArNWhTekViNTZ0MTRGQ3Rj?=
 =?utf-8?B?MWJXSEE0aVNtMVNVSm82blJRRmVZa0VNVFRKUVB5SCtGdjI3SWpObFBydDRP?=
 =?utf-8?B?S3lRVThLK00wNE55Sm5MVmVqY3Z2bHMrTHhib2lTVndOWUNqdUIxL3E4bmgv?=
 =?utf-8?B?Nis1aStTZ1BWZjZvUGovdnI2WVJMSEk2NVd0THdlckMwVnJzQjJzZ21UeUZ5?=
 =?utf-8?B?UFgxajBqd0JyWnJtZUpqb0lwazZKYUI3TWJndGxacUd0OGlxTVhRbjZ3WWdO?=
 =?utf-8?B?RUZDYlFGUHMvL2tWZVNCcHRnTUIxSmlMcldYTVNndkRDZmhoWmVzZkVhZWJM?=
 =?utf-8?B?MEw2YUhNYVBEWGhEVVVOT0hBdHd6RmVTa3ZQcFAyMm9IVlozOE40cnVxRmN1?=
 =?utf-8?B?dXpuK0VBdDdRcm5sSVBjV0U3MzhUSVZsb2ZGZzY3TVA4eVdHUDZKb0tRbDlp?=
 =?utf-8?B?M1psN01xb09ac1haZThsSUNndkRHUCszUzdnNHgxcCt6K0p5NW82N2JrMEJS?=
 =?utf-8?B?ZVN0M3FadjZGSHduQXFCaGFJTEJieThUT0J0VXhrYTM5aGs4VkpYc3Q5cW8w?=
 =?utf-8?B?aVFsWUszWG5qa0R0QWhyZ09QQzhYTFJncDNDVU9JdSswSUZvWFJIeFh4WTda?=
 =?utf-8?B?aDJKUnVrZXZDd3ZLMzNJZk5kcURBN0VUaXEvSHFERzUyZk5NczFReUg3bVpN?=
 =?utf-8?B?U0RmTjcwbm1JWGZweVhIMzFYVndWQ3RJOHFZV0Z0bXdtMERSekNHck9Mb080?=
 =?utf-8?B?aktSbGNKcnUzQWprYXlDd1dpWUJGZlhZbU0wNUpEN1ZpUjBsKy84RHBEM2ZV?=
 =?utf-8?B?WEdxRVB4UHovZEJLdk01MGJGQmtoS1lnYUo0QUNBRW9UMms5cy8rSy9NVEx6?=
 =?utf-8?B?NzRvR1QwWU9RSFFYNlV3Tkt4MGVsNzE5cXZERm8zUEdrSUYwYVBKc0crN0o4?=
 =?utf-8?B?VDV6c2lTUFdjOGFqekRyTEhSRE90WGZtYXFlVjRyajZDUCtYV1JmdE1LTGdZ?=
 =?utf-8?B?RDFadnVvSjlOY20vVVZnS0k2VjNpamtXaGZYREJYc3c2aHlVTlAvbEJNRjVy?=
 =?utf-8?B?M3dNdm05YUtjYk41bkNzZ3habmlheHhVTXVyTEI1c0dIRUU0bllKWld6RW40?=
 =?utf-8?B?R3dMVVB2b2J1SVppaGZ0a0FaVXBWOWFOUy93cjE0Q1ZzcmJyV2ZvUE1TTXNN?=
 =?utf-8?B?UXZpSHU1VXpyTmN2a1l0Uk0zcnZNM2tBMjZGT0l2L0xUdjRHanMzNytCRWg4?=
 =?utf-8?B?N2lrNkVkZzVxbC91UXZMNWhsTFR1YlVMMGkremp6aE02TCtLTDB2dXlzMW1C?=
 =?utf-8?B?RUhtVmZFNmR3TU9aRmM5YitDS1llL3hOL3FMN3hjczJIUkxHMkwzZ1I5dFY4?=
 =?utf-8?B?Q0NGVVBZSkE4alVRK25XclMvZUZXRkhUeXQvSmU5Q1doZ1FMc3JGcXR0RWFo?=
 =?utf-8?B?eTNTOWhIWnBQNTcxcDFjZmVOZlZaZ2NwdWxYS0UrNVRFVlVCN3did203a0ll?=
 =?utf-8?B?VVk3bjJTeG9FdFBPNklMZHdUQTc0VmF5WU5yVWxpUldMV3VmZ0xNdlhoRjM5?=
 =?utf-8?B?emVCN1AzQXdvQ1RhaVFUSlpyNTFlUFNXdzA5d1ExTllYZGp3RkpzRnBVa2xL?=
 =?utf-8?B?ZExnV2FLbG1QTWQ3NDB3cEpKUVRrV0YyM1VjOFRUWE1mME9JcU83SnlTMTl2?=
 =?utf-8?B?a1NiYkNIY3hJZTZJdXFNNnZxeVB3a3FUSFBNQmlMbnhNdUwxaFpSU1VqelRQ?=
 =?utf-8?B?UktPUngrMVY3VFZIbUpmMHJLckxPVDdKZGdDSU13WHdHTmN5a1BJc25VSkZy?=
 =?utf-8?B?b2o2cXhvampsVk1BNkxUb1BiQkI2a3hyQTUvUmJmdnRGQW1UUUMySDRZdktu?=
 =?utf-8?B?endqQ0MxVUplc09PcUFMWHhTaDNTWmhoYWlKY0h1QmNxOTgvckI5UT09?=
X-Exchange-RoutingPolicyChecked: L/D7mOsnHBBeqCROVXwse9ljLMaWv3DeprUVNo5YJs4rMQvybVmP+MgVxv5yfLke5gtzh+/bxIcIGeV4Lq2/qaf7ycNPwA/3gMi/6QWCMr3S6IrqSnjTXpJ8TNx1ApoX8qlcBFpaoEDeQ7b8WqZV3rCqy4hS+vmJytSC1ven6Aypz77lnoHYVBXkcRtu5bFLQPJwBjJrL1YMwOojJxTFGJ5ob6jBak/0LCyAWJQRv2q10cEUewOS2Rnoahk/BlXmBQbl2BNt+1CdmBmJtSKSDSX0qsX5wsv8Lh7g3Pzllkca4XornZpoC1rXIpfvVvoiXILu8G0sbGQZBxe9d/GTkg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 72a3ba67-c862-4ac7-168c-08df3ef0714c
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB662844.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 06:04:12.4552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vMgmeKJXa7vlgRmWHdKlpVyUqSXZqLIzmM6b/fJ5rTLbEl2Aucd2t0QYCXC0s5RRBfOZaA8oXkHVZJ/tdeHe9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9744
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------1FxOXK4SJgdaND0cZHD1HGMs
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
The failures reported here are not related to my changes. Could you 
please re-report?

Thanks,
Anirban

On 05-11-2026 20:32, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel/xe_wedged: Add cold-reset wedge test (rev8)
> *URL:* 	https://patchwork.freedesktop.org/series/175755/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16110/index.html
>
>
>   CI Bug Log - changes from IGT_9177 -> IGTPW_16110
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_16110 absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_16110, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16110/index.html
>
>
>     Participating hosts (40 -> 39)
>
> Missing (1): bat-dg2-13
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in IGTPW_16110:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@i915_selftest@live:
>       o fi-kbl-x1275: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/fi-kbl-x1275/igt@i915_selftest@live.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16110/fi-kbl-x1275/igt@i915_selftest@live.html>
>         +1 other test dmesg-warn
>
>
>     Known issues
>
--------------1FxOXK4SJgdaND0cZHD1HGMs
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi,<br>
      The failures reported here are not related to my changes. Could
      you please re-report?</p>
    <p>Thanks,<br>
      Anirban</p>
    <div class="moz-cite-prefix">On 05-11-2026 20:32, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:179389095846.125928.9611996889184010090@221881a7231d">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">@scope { td { padding: 2pt; } }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel/xe_wedged: Add cold-reset wedge test (rev8)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/175755/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/175755/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16110/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16110/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from IGT_9177 -&gt; IGTPW_16110</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_16110 absolutely need
        to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_16110, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16110/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16110/index.html</a></p>
      <h2>Participating hosts (40 -&gt; 39)</h2>
      <p>Missing (1): bat-dg2-13 </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_16110:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@i915_selftest@live:
          <ul>
            <li>fi-kbl-x1275: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/fi-kbl-x1275/igt@i915_selftest@live.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16110/fi-kbl-x1275/igt@i915_selftest@live.html" moz-do-not-send="true">DMESG-WARN</a> +1 other test
              dmesg-warn</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
    </blockquote>
  </body>
</html>

--------------1FxOXK4SJgdaND0cZHD1HGMs--
