Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8083C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon,  5 Aug 2024 05:29:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A26110E023;
	Mon,  5 Aug 2024 05:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QVi/Jb5G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C04210E023
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Aug 2024 05:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722835786; x=1754371786;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=phImCi+n8+GKFluHGxA4Mq/ExtvmZZx/Mz0IvxHnJaY=;
 b=QVi/Jb5GEAf9H5eKUf2UIU1kUbteiphKZ3L36f0ihVyfP4oImLFdXA4N
 XyIARaevEU+ACJQZ76bjLihW+Tq1OQhPXJeamJUlv+XQY8T+VkuK5twiE
 GlXZZTfLuCOVExQrxiM48wH7bn7F+VQWApHdJa1AUyvdoLgzVly4EqvL/
 RJPZlSp/CIWfv45HySO/k4joDStrKP1CFoTGHzOVVgWBpk2ZqwRRhOh8v
 2nUIGuRqav3Is71J+NMZI4GcQhlNt0DzSCi4riMy0faydetQCpj23UnFM
 m75iIQlrKbJSlJlIc0dJzl1/1FriKSl9cKOUxke301Rvb3dV6XUHxUpeJ Q==;
X-CSE-ConnectionGUID: fo10l0sgQ1+7+u5A/W3G8A==
X-CSE-MsgGUID: o9zgvCoLThOv/q0lqfXQCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="20917697"
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; d="scan'208,217";a="20917697"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2024 22:29:45 -0700
X-CSE-ConnectionGUID: VuaG3aTGSniG68yyhfwxPQ==
X-CSE-MsgGUID: stR5t4SKS3ik6/eJ0MbE7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; d="scan'208,217";a="55986376"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Aug 2024 22:29:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 4 Aug 2024 22:29:45 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 4 Aug 2024 22:29:45 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 4 Aug 2024 22:29:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mjJP/SnGRGEnSnx+ueofRc8zTtRdF8M8mMR4lT2c3qpoAAdmN7ZuziU3JhlEp5vo0fDl0FNLF7J2TQnVGumUyAlXF8kngVbQM+QNjp3arHop0BPTzKhytG68WEsxQBNHDtDvIGkbzvstqjj8D6Y1aGE7kez9D6sU1XdBGfVrOn0TQew1TMnxJjA5OcL0mx5da7pYjXStdXU/NxA/Pxc6NHEJr0TLkIUmUb4Ij+HtbB1QWS/92lGGOUQ0iXFtA+PC5dOLSBHFsc0uL1mm6VXXltJUhpfHpx7udtF0/QM2TP99KVCjXD67RIZkf6+v0F9lKSuketht3FXLT9U99KGrBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SmsF0ajInunb5u2gGd6HekIVy11ghYl6uhHQpgIX1aU=;
 b=W+Wk2rFhuVLEmiZAQaJ5ZMpRkwcmSsLvGW6JNbvRI8s72445crNO6MJFHcnllgg/WuYClSuJUjBtiSuK3AXnTa7WQxf74ENci677Z4gbUht0ZkrX+6cHnKerwY2w96fCHc2DeN+Lo38HEi6q2U5ocFOxn6TDXlrRuPRfL+4UR3O0XDVQumBUXhueWqiGJ1WCkLfh2AcmkHf1CHqB57rmHT5eIcfL8dx8A/47iaIvMIHbw+Nmbuhsey0lk7OCJwIUNxz5yFe59bTzjksV7Ue1qZF7b0VoUHopCVBts1lBuM2Y0HaR4bbff42mJB7yxL6dX1NhT9gR+jqrjJ4f0OP0CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20)
 by SJ0PR11MB4912.namprd11.prod.outlook.com (2603:10b6:a03:2ae::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 05:29:41 +0000
Received: from DM4PR11MB5293.namprd11.prod.outlook.com
 ([fe80::e1f5:3b23:9560:2dc2]) by DM4PR11MB5293.namprd11.prod.outlook.com
 ([fe80::e1f5:3b23:9560:2dc2%4]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 05:29:40 +0000
Content-Type: multipart/alternative;
 boundary="------------5IXU0OLK600Hej2DPQdm60p0"
Message-ID: <5b52d3a3-2c3d-4668-b9f0-f11b4bdceee2@intel.com>
Date: Mon, 5 Aug 2024 10:59:32 +0530
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH i-g-t v3] tests/core_setmaster: Adjust loop control in
 tweak_perm
To: Emil Velikov <emil.l.velikov@gmail.com>
CC: <igt-dev@lists.freedesktop.org>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
References: <20240731082037.1069-1-krishnaiah.bommu@intel.com>
 <CACvgo52=CF4Ms3eL16k_1yOJykvS6AMWvicW2NVF1cmrh_-1Fw@mail.gmail.com>
Content-Language: en-US
From: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>
In-Reply-To: <CACvgo52=CF4Ms3eL16k_1yOJykvS6AMWvicW2NVF1cmrh_-1Fw@mail.gmail.com>
X-ClientProxiedBy: MA1P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::22) To DM4PR11MB5293.namprd11.prod.outlook.com
 (2603:10b6:5:390::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5293:EE_|SJ0PR11MB4912:EE_
X-MS-Office365-Filtering-Correlation-Id: da56e6f2-dd3e-4e29-d706-08dcb50f9aa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWplN3c4cDFsNnQ1OXNhUTVyZDlUK2t1bHRkdTd6aWJYcDJIaDlXZU9qdm9T?=
 =?utf-8?B?YXdpa28xUlhIb2NZREZTSS84a3N3SStzV2FkSkRzNzlXSlp5NVArZUFWVkZK?=
 =?utf-8?B?a3ZmeGR3d1FpcUJTMXNCNmhZeC9XNGJUTWNRRFJ3TVZ5N0wxNEwzajlpR1Nx?=
 =?utf-8?B?MW9aMHJ6dVcvOFhwUmR4OEtvVjgvVEo4a1BpVWIrenUwZENpMWxpS21WSFAy?=
 =?utf-8?B?QlVPYys1cmF3KzZUTHlnM3F3ZWdwWVl0VXA0TDFWdTRINTdoM0tNYWNjZFdS?=
 =?utf-8?B?SzlyclNuQ2Faam9iRWlFSWY5azRlYmorZER1VGx1MHpPLzBPbE5FWVVQSUNx?=
 =?utf-8?B?NmI5eXBhZHJPRUl0Mld6enVWNjRuV2hneW50UC9SUGZlbDEycGQ5QjFEWUFt?=
 =?utf-8?B?cllMdUhvS3dmYkVFRkNNSmpCTzE4a2tBbVQ3bW5wejVrVm9JaUxKeUY2c0l6?=
 =?utf-8?B?RkRCeUdreVFKSjNyMjQ2MUFkcW8rMnFxMFZ6NWE2YllOR1REbFg2L0VqWU1o?=
 =?utf-8?B?dVNvWXRLMVV4Q2pqbk05eTgwL1RLYzh3TWxpSGVyRHZvTk8rbWpod3o0ZUI0?=
 =?utf-8?B?Z240eUhSUysyWXN0bkl1aXBEeVdHdnJJdFNia0h1cUV4ZUxCQWU3cklUeWpn?=
 =?utf-8?B?N0kvTzdGMisvQ2N4MGZ2cmZaK0RuZUlmajBreVdYMTVOOUM3QU5zUE8rd0kv?=
 =?utf-8?B?VFozNnhWaWIwV2huUFdQNzliN2pnMDdxckl4TkpPOG9TRGdWbUZSOXMxRWVw?=
 =?utf-8?B?Z0xONWNmbUFwWExYajJnVEZyTTZlbmxxVTNhMnhPd1pZUTVMK0hqRlFXd0dN?=
 =?utf-8?B?cFM5ZWlCNUxsUjQ5UmNBQnpBa2Z0MnBjYTQraFdHL1Ayb251SmJoRDhyeVlk?=
 =?utf-8?B?V0FJQ3pGb0dBNzg3TVVjR2dtVXFONk01NExqNUZQODdDQWc0amVwZEE2YW9o?=
 =?utf-8?B?blBvOCtrc2JmUHRNWWJib2JVanVlaSs2SWZDYVU0MCszbVRXVzV5eWVjS0N4?=
 =?utf-8?B?RHlWcG1VUkptL3NnenQ2YTVUcjUvUVpyNGxzRkw0ejM1a0dacXVneHRXZWpT?=
 =?utf-8?B?SHlnQzl3UURRSkRDSjNhalhXR3A1eG51ZlMyNHBESXhYUk9aSDVWT0dkL2N0?=
 =?utf-8?B?a09yQjJIaVpHUGZOSHlmbGRYaGZMVSsydDRkSzQ5QXpSZTdTbG0zeCtWeHVS?=
 =?utf-8?B?a3gwL1M2aVRwQXd3M2RqUldkRzRjRVZhU3JTcVJTYVhFUFhMa0VzYVhyYXZM?=
 =?utf-8?B?Q2VGTmwrY1dFbTFjU3FiYng5cE1NdUlqTmxnd2pOMHlqZFgzZ2dIVnZzMEJy?=
 =?utf-8?B?UEJHaFBuNTVsZDdvL2swUWt4T2htaW5zTWtTdTBBVVpvN1VueW5sdjJQS3lE?=
 =?utf-8?B?WnQ4NFFSY0NKQVA2UFczaFdPbktOTDdOUTN3ZGF0ZmphSGtHSGdDbWdQRStt?=
 =?utf-8?B?aFJ6dGV6YlE5dko2bXFyTytlbFgvS0VvNkZUZ3lHYkVVaEVHWnBVb1Z4NXY5?=
 =?utf-8?B?dmZtUk54a2RCbTVCMUQyOGVGZ3hoYTYxaU5FTTdWenlVd1AwSDk3QTFRTWRn?=
 =?utf-8?B?UFZQc1BRVlJhQnFENDV3YjdXMWJFQ3htSUtGRlBzSWtWdVVUcUNqeHhJcW9I?=
 =?utf-8?B?dU84ZVA3c0x6bWo1RENvNTZzY1JoMkN3amNCRllGRkV4UkZSc2FncThCZFJ0?=
 =?utf-8?B?VVRKWit5SndJLzMwbytoek12ZE5sTU82Ymo3M3JDSjNFWWhtM05acVdiN3dZ?=
 =?utf-8?B?Z1E0dU11Nk8vZFpaMm1PNWpwTHg3UmkrV3VJc2V1d29zVktUS1Zneit6VW9P?=
 =?utf-8?B?QURpNTUrbWo2UmVHaVJKdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5293.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVFTYUdtaVQ1c1VudGZIRHpDRTVCQ2REVWdFRXNONnZCWXR4VjVLSzdNcUVh?=
 =?utf-8?B?YVBLUS90UEFvRE12SEZEdit5dFhVM1dUT3RYYzkxbXRlZU1uMG5GRjA4RGE5?=
 =?utf-8?B?Q2FuNldlQzJjeENZamVPUi8wTGJIRUM1V3JuWWIvZkE5RzFiSWd4ekVMaE9s?=
 =?utf-8?B?WS9PbkpnU0VtSTJYOWl0MkNkeS9IS1RicGp5Y2pBOWlpcXVockYrL3lRL2Rq?=
 =?utf-8?B?WUJtSlhoeFVtcGd5OExmcUxPeVo2N1VoUEJYQTNCMGhaTnNVbFBQc29CcUlV?=
 =?utf-8?B?WDZTazg0YUpFV2F5cVZYQlZhK1RUNWdUTmJreDczNUdkY1dYTWNWREZJRHJn?=
 =?utf-8?B?RTYvT2hLaWVrV2lNNDUybVEzampTTUtXcUNqbHQ1ejZVM1NHT1V6L2hFSFJa?=
 =?utf-8?B?U1ZPOFpZL281cGxJcE1OQUc5OG40YUUrd0NGMzkyMm5JdXhSNGorbDF5bmd6?=
 =?utf-8?B?TUtZVUZTcDBjV0JVQk9JQWhPVEZXRVdWazVLdmM1R29kMDZhNlg1MmYyT0NE?=
 =?utf-8?B?aEg5RG5EakNYQldwQ0FEdVZMTmdvZ1k3V05lQy8xM2tmZC9YWnF2NzVtZDJN?=
 =?utf-8?B?RVQ1eGk1TjJwbVcvTGprUDNQUk1PUVZrUTZCTGhrMk1UY0ZTdGhNQ0JYNUdz?=
 =?utf-8?B?enIwdmt2eUpFbXl1UkMxNDhQQVdTR0xDdjJuUytUVk9kaGNKbHZMejNuRWhn?=
 =?utf-8?B?REROZDU2Y0VwLzYrZEgxcmhTMEVpN3BOdGNkMk1ha25OZjJSZUdZSGFJWkN3?=
 =?utf-8?B?azlaZnFMRis3L1A2YVp6U2RNQm9mTGE3UHdyYXJ1RkwrenN5Z2VnekpRTlVQ?=
 =?utf-8?B?eWxMSW5PcFF6d0dnRFVSZC9iUnF1ZzJKajRVdllLNUpPdnJ5bC9hWGhYclZH?=
 =?utf-8?B?TVhPQnNHSFZsS1BLS01JbEVTV2FWQVFLY2NpRjVzS1J5N29adWphbFhVQnhn?=
 =?utf-8?B?ZHdaNTNxTlVMcjdnL1o5Uk9OQk84UnplVjdEcnBCNmphL0NPSE1HaFhsQ0pX?=
 =?utf-8?B?Mk9ESGRSZC9sdzZmSmMyNllMcllBMi9vQ3JDK1BYV0FqTVVJRDRIKzBtRVZh?=
 =?utf-8?B?QmJaNkFybXFxeHdLeUcxWVdSeUFQeFo1dVN3QTRmZFdMVVlDWVZaYkFIWjZz?=
 =?utf-8?B?bmRLZVFNSU9QVTBSMnN3azdCOXZaWTBXV0dYZHp6ZEo1bERmaVhhTnA5YXM2?=
 =?utf-8?B?a3h0eG1kei8yc0ZJZkNOUHo1eEhMV1pyL015N2k0Si9VNGdoK3NZQkVQOVZY?=
 =?utf-8?B?U09yajFkVElRSjdodnQ4M3M2OTRiUWxHZXk1cVNIdEtxbjlnTzBtN0xTTmlU?=
 =?utf-8?B?L0tDWWFRdVMxdE1FcE5Ic0FwWWloNkw3RVpWYlRSNlplRTFrams5YUkvSXI3?=
 =?utf-8?B?YTFEekc1TDBMTUdocExVakQzT1NsZDlwR2RoaE1FLy9hQVk1TTNFTmZMdTVn?=
 =?utf-8?B?dTFqQ1pxNHZYQVg5LytGN0V3NHlNR24wZVhVZytmZENMT3NSOFdZZHBoUzNo?=
 =?utf-8?B?ZndlN2I5MU8vazZrWTM1YzNTT0VtZ3M0NEZSeVNyaUJ5cmpyL0YwM0hOdHhl?=
 =?utf-8?B?M05SNXJhaUdKL2tPRnN6Zlp4eUNFaW1wKytVZk10U3UzcmNzZHY4T3I4Sldj?=
 =?utf-8?B?T2xtRGZTbVNuMEVtZG9BbnNnbm15Uml4cHp5L2w5U1h0NS8xczIzWEN6RHh3?=
 =?utf-8?B?cjlPbUZTQVFJWm9lcmQrT1hNWW55b3dxNGJXWXJDVXZtcUtheW45MUFMYitS?=
 =?utf-8?B?T2hMaGxzVkpaTEkwVE9EM2wwdnBkcmFFVllCcmptOE9ySUhjRTFkSGxhd3FD?=
 =?utf-8?B?UkQva0MrYzRTczRGTVU3eTM5TzFrZStHWk5xcEpRT09kOTlDQndaZmdWd1I2?=
 =?utf-8?B?WTRXMjlKSFdPQ2w1ZEpUTENPaktCcWlaNnR6djVNTUFBNnRrdWxXVmhQRVRC?=
 =?utf-8?B?b2xzNFBkRTdURERaLzJnNCtoeG5ERWFiWkowNkNRbmtJNDdJbC9PdUVpeWtr?=
 =?utf-8?B?ZDBsZktoZFp5TmJpU1BaNXZ6YWQ2RHRMRHA2dmQ4a2RaeVd0R3BLNUFnS1VJ?=
 =?utf-8?B?bjBkQndXdHpVRDJkRThLMjVtL2NIcUZ0Nzk1RnB0WDlPa1lYTlo0Vm1KcmZL?=
 =?utf-8?B?WXlYenE1VHpmNzBMT3hKNko2bTJ3bEFodDVCZ0xpVG9FVWVWNCtEOFpQRW1S?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da56e6f2-dd3e-4e29-d706-08dcb50f9aa1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5293.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 05:29:40.7490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6wifh1MdYA6FHyYli5TwrpDliIQ1shJvKPksNZIEoiFEp2NiExxBeySW0dQRhUGj0B8FK7SNM103Wld2f3sAl/P0XWtTZAg8RCSWLILgoq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4912
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

--------------5IXU0OLK600Hej2DPQdm60p0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 31-07-2024 23:26, Emil Velikov wrote:
> Hey everyone,
>
> On Wed, 31 Jul 2024 at 09:31, Bommu Krishnaiah
> <krishnaiah.bommu@intel.com> wrote:
>> The `tweak_perm` function now uses `continue` instead of `break` when
>> encountering non-existent card paths. This change addresses the assumption
>> in existing userspace that card paths are contiguous, which may not be true
>> if cards are dynamically removed.
>>
>> Problem Description:
>> The test fails after running the `core_hotunplug@hot*` subtest, where card0 is missing.
>> This leads to a failure in the subsequent `master-drop-set-user` test.
>>
>> Command sequence for reproducing the issue:
>> - Check available cards: `ls /dev/dri/`
>>    - Output: by-path  card0  renderD128
>> - Run the test: `# ./core_hotunplug --r hotrebind-lateclose`
>> - Check again: ‘ls /dev/dri/’
>>    - Output after failure: by-path  card1  renderD129
>> - Run the test: `# ./core_setmaster --r master-drop-set-user`
>>
>> This failures on both XE and i915 for above sequence.
>>
> The commit message is still a bit strange, but I'll refer that to your
> colleague who already gave you good tips.

tests/core_setmaster: Handle the test even if cards are non-continuous

Although most of userspace assumes drm cards to be populated continously,

this assumption may not be always true. After hot unpluging and 
repluging of card

the card may be non-continous.  To address such scenarios where the 
cards can be non-continous

modify the tweak_perm function to loop all possible 
cardnumbers(card0-card255) to confirm are they populated or not.

Problem Description:

The test fails after running the `core_hotunplug@hot*` subtest, where 
card0 is missing.

This leads to a failure in the subsequent `master-drop-set-user` test.

Command sequence for reproducing the issue:

- Check available cards: `ls /dev/dri/`

- Output: by-path  card0  renderD128

- Run the test: `# ./core_hotunplug --r hotrebind-lateclose`

- Check again: ‘ls /dev/dri/’

- Output after failure: by-path  card1  renderD129

- Run the test: `# ./core_setmaster --r master-drop-set-user`

This failures on both XE and i915 for above sequence.

> Fwiw the "existing usespace" refers to mesa, Xorg (both server and
> drivers) as well as gstreamer, if I recall correctly. There may be
> others assume there's no gaps.
here I am referring to IGT, may be as you said few may be continues, but 
this change works for continues also.
>> Signed-off-by: Bommu Krishnaiah<krishnaiah.bommu@intel.com>
>> Cc: Emil Velikov<emil.l.velikov@gmail.com>
>> Cc: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>> ---
>>   tests/core_setmaster.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
>> index 9c2083f66..a2758e2f2 100644
>> --- a/tests/core_setmaster.c
>> +++ b/tests/core_setmaster.c
>> @@ -116,9 +116,10 @@ static unsigned tweak_perm(uint8_t *saved_perm, unsigned max_perm, bool save)
>>          for (i = 0; i < max_perm; i++) {
>>                  snprintf(path, sizeof(path), "/dev/dri/card%u", i);
>>
>> -               /* Existing userspace assumes there's no gaps, do the same. */
>> +               /* Userspace cannot always have continuous card0...N due to
>> +                * dynamic unloading or removal of cards */
> Is this "dynamic unloading or removal of cards" a relatively new
> thing? Back when I wrote there test, unloading DRM modules wasn't
> supported (I believe) hence, it wasn't possible to have gaps.

I don't think dynamic unloading or removal of cards is new

core_hotunplug test verifies unloading of i915/xe driver module

>
> Or does this feature/work that only affects IGT and normal day-to-day
> userspace will never hit this case?

as I mentioned in commit message running sequence is not done before

Regards,

Krishna

>
> Should probably mention a word or two about this in the commit
> message/inline comment.
>
> HTH,
> Emil
--------------5IXU0OLK600Hej2DPQdm60p0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 31-07-2024 23:26, Emil Velikov
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CACvgo52=CF4Ms3eL16k_1yOJykvS6AMWvicW2NVF1cmrh_-1Fw@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">Hey everyone,

On Wed, 31 Jul 2024 at 09:31, Bommu Krishnaiah
<a class="moz-txt-link-rfc2396E" href="mailto:krishnaiah.bommu@intel.com">&lt;krishnaiah.bommu@intel.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
The `tweak_perm` function now uses `continue` instead of `break` when
encountering non-existent card paths. This change addresses the assumption
in existing userspace that card paths are contiguous, which may not be true
if cards are dynamically removed.

Problem Description:
The test fails after running the `core_hotunplug@hot*` subtest, where card0 is missing.
This leads to a failure in the subsequent `master-drop-set-user` test.

Command sequence for reproducing the issue:
- Check available cards: `ls /dev/dri/`
  - Output: by-path  card0  renderD128
- Run the test: `# ./core_hotunplug --r hotrebind-lateclose`
- Check again: ‘ls /dev/dri/’
  - Output after failure: by-path  card1  renderD129
- Run the test: `# ./core_setmaster --r master-drop-set-user`

This failures on both XE and i915 for above sequence.

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The commit message is still a bit strange, but I'll refer that to your
colleague who already gave you good tips.
</pre>
    </blockquote>
    <span><span class="ui-provider a b c d e f g h i j k l m n o p q r s t u v w x y z ab ac ae af ag ah ai aj ak" dir="ltr">
        <p>tests/core_setmaster:&nbsp;Handle the test even if cards are
          non-continuous</p>
        <p>&nbsp;</p>
        <p>Although most of userspace assumes drm cards to be populated
          continously,</p>
        <p>this assumption may not be always true. After hot unpluging
          and repluging of card</p>
        <p>the card may be non-continous.&nbsp; To address such scenarios
          where the cards can be non-continous</p>
        <p>modify the tweak_perm function to loop all possible
          cardnumbers(card0-card255) to confirm are they populated or
          not.</p>
        <p>&nbsp;</p>
        <p>Problem Description:</p>
        <p>The test fails after running the `core_hotunplug@hot*`
          subtest, where card0 is missing.</p>
        <p>This leads to a failure in the subsequent
          `master-drop-set-user` test.</p>
        <p>&nbsp;</p>
        <p>Command sequence for reproducing the issue:</p>
        <p>- Check available cards: `ls /dev/dri/`</p>
        <p>- Output: by-path&nbsp; card0&nbsp; renderD128</p>
        <p>- Run the test: `# ./core_hotunplug --r hotrebind-lateclose`</p>
        <p>- Check again: ‘ls /dev/dri/’</p>
        <p>- Output after failure: by-path&nbsp; card1&nbsp; renderD129</p>
        <p>- Run the test: `# ./core_setmaster --r master-drop-set-user`</p>
        <p>&nbsp;</p>
        <p>This failures on both XE and i915 for above sequence.</p>
      </span></span>
    <blockquote type="cite" cite="mid:CACvgo52=CF4Ms3eL16k_1yOJykvS6AMWvicW2NVF1cmrh_-1Fw@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">
Fwiw the &quot;existing usespace&quot; refers to mesa, Xorg (both server and
drivers) as well as gstreamer, if I recall correctly. There may be
others assume there's no gaps.
</pre>
    </blockquote>
    <span><span class="ui-provider a b c d e f g h i j k l m n o p q r s t u v w x y z ab ac ae af ag ah ai aj ak" dir="ltr">here I am referring to IGT, may be as you said few may
        be continues, but this change works for continues also.</span></span>
    <blockquote type="cite" cite="mid:CACvgo52=CF4Ms3eL16k_1yOJykvS6AMWvicW2NVF1cmrh_-1Fw@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Signed-off-by: Bommu Krishnaiah <a class="moz-txt-link-rfc2396E" href="mailto:krishnaiah.bommu@intel.com">&lt;krishnaiah.bommu@intel.com&gt;</a>
Cc: Emil Velikov <a class="moz-txt-link-rfc2396E" href="mailto:emil.l.velikov@gmail.com">&lt;emil.l.velikov@gmail.com&gt;</a>
Cc: Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
---
 tests/core_setmaster.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
index 9c2083f66..a2758e2f2 100644
--- a/tests/core_setmaster.c
+++ b/tests/core_setmaster.c
@@ -116,9 +116,10 @@ static unsigned tweak_perm(uint8_t *saved_perm, unsigned max_perm, bool save)
        for (i = 0; i &lt; max_perm; i++) {
                snprintf(path, sizeof(path), &quot;/dev/dri/card%u&quot;, i);

-               /* Existing userspace assumes there's no gaps, do the same. */
+               /* Userspace cannot always have continuous card0...N due to
+                * dynamic unloading or removal of cards */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Is this &quot;dynamic unloading or removal of cards&quot; a relatively new
thing? Back when I wrote there test, unloading DRM modules wasn't
supported (I believe) hence, it wasn't possible to have gaps.</pre>
    </blockquote>
    <p><span><span class="ui-provider a b c d e f g h i j k l m n o p q r s t u v w x y z ab ac ae af ag ah ai aj ak" dir="ltr">I don't think dynamic unloading or removal of cards
          is new</span></span></p>
    <p><!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-IN</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
  DefSemiHidden="false" DefQFormat="false" DefPriority="99"
  LatentStyleCount="376">
  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 9"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="header"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footer"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index heading"/>
  <w:LsdException Locked="false" Priority="35" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of figures"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope return"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="line number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="page number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of authorities"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="macro"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="toa heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 5"/>
  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Closing"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Signature"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="true"
   UnhideWhenUsed="true" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Message Header"/>
  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Salutation"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Date"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Note Heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Block Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="FollowedHyperlink"/>
  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Document Map"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Plain Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="E-mail Signature"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Top of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Bottom of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal (Web)"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Acronym"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Cite"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Code"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Definition"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Keyboard"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Preformatted"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Sample"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Typewriter"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Variable"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Table"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation subject"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="No List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Contemporary"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Elegant"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Professional"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Balloon Text"/>
  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Theme"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" QFormat="true"
   Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" QFormat="true"
   Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" QFormat="true"
   Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" QFormat="true"
   Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" QFormat="true"
   Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" QFormat="true"
   Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" SemiHidden="true"
   UnhideWhenUsed="true" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>
  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>
  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>
  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>
  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>
  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>
  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hashtag"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Unresolved Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Link"/>
 </w:LatentStyles>
</xml><![endif]--><!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-fareast-language:EN-US;}
</style>
<![endif]--><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:Calibri;mso-fareast-theme-font:
minor-latin;mso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Times New Roman&quot;;
mso-bidi-theme-font:minor-bidi;mso-ansi-language:EN-IN;mso-fareast-language:
EN-US;mso-bidi-language:AR-SA">core_hotunplug test verifies unloading of
        i915/xe
        driver module </span></p>
    <blockquote type="cite" cite="mid:CACvgo52=CF4Ms3eL16k_1yOJykvS6AMWvicW2NVF1cmrh_-1Fw@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">

Or does this feature/work that only affects IGT and normal day-to-day
userspace will never hit this case?</pre>
    </blockquote>
    <p><span><span class="ui-provider a b c d e f g h i j k l m n o p q r s t u v w x y z ab ac ae af ag ah ai aj ak" dir="ltr">as I mentioned in commit message running sequence is
          not done before</span></span></p>
    <p><span><span class="ui-provider a b c d e f g h i j k l m n o p q r s t u v w x y z ab ac ae af ag ah ai aj ak" dir="ltr">Regards,</span></span></p>
    <p><span><span class="ui-provider a b c d e f g h i j k l m n o p q r s t u v w x y z ab ac ae af ag ah ai aj ak" dir="ltr">Krishna<br>
        </span></span></p>
    <blockquote type="cite" cite="mid:CACvgo52=CF4Ms3eL16k_1yOJykvS6AMWvicW2NVF1cmrh_-1Fw@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">

Should probably mention a word or two about this in the commit
message/inline comment.

HTH,
Emil
</pre>
    </blockquote>
  </body>
</html>

--------------5IXU0OLK600Hej2DPQdm60p0--
