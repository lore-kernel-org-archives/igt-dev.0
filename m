Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3F4C79FBB
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 23:16:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8B210E337;
	Thu, 10 Sep 2026 23:16:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lbjoU+fB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C6B10E337
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 23:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789082169; x=1820618169;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=ZmbYUqnBjWynJL1XuWVTpe1HkDuV4PYD7hZ8OSd/Ymg=;
 b=lbjoU+fBTTCH3o2Xe3I24+IlWHdliL0hYe+/T2MD3gw5m6B4lqnhRClM
 w6Xbufo17TQwNBxAcVMSp63RCTdkrbu1jQDGoV82KGcfqkHCWlAW49jC4
 Ad+xlR/VKQCVDRbXAk8hMZfOrCl/7ZjGhFOhjxV9oTLHPqPIUDDiMStkz
 jBZ01jzetQydDgVSWVEuwTFcAlcm4bB6hphYTrf/tn4gpHLQzxGcqneKh
 yYyRb3d4rLHLX+aQzc1JH8SKHT3Zu0x6IBciE+F3j59njZh87zbn3Fbc3
 9y4YzkFCN0l+GEcB/MgjRAmbuX6R2wE6MgQ56K2chfYUFTDSwzrZlArpn g==;
X-CSE-ConnectionGUID: 8LKFcRwTQUmbI6V3ENwimg==
X-CSE-MsgGUID: YBafRSBaQWqSmetWbb1VdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="107060969"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="107060969"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 16:16:09 -0700
X-CSE-ConnectionGUID: XvjbhKrDT8KA8ERJ0DmFWA==
X-CSE-MsgGUID: iVo3FLH9SAWLPftyucPv5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="275543849"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 16:16:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 16:16:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 16:16:07 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 16:16:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nAvAJZQT+7TkFXsE86guwky6Rp+eyQAMV3U4Jqf646QWuuHA1qmHAvuXWrnpR1bMAp1JkyHG9yivWyZmkN9yDDZxOBAmuCqvuhdD3mJHX8QW0/d/Zz58krEcI9jDt0EFyKhg89imiKhvoKtOOFDe8jFj/Sr7olLOvuCKpnYd8TFRmCT9p33CZwmFHz4f5RVPPH7/zhXUjek4dqnQBiQwhZ6DL27wPXL6UNt5vaN5DpikFf1ACNCdEfnK5p26bxoBdDbrJPiVGiI1S9Gh7w43ufyQrXA4+1+pXjU3slz9pNz8Kx/cpDTm7CTXn1L65bB5c8sexiWKQRQQEeYpXUSfRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmbYUqnBjWynJL1XuWVTpe1HkDuV4PYD7hZ8OSd/Ymg=;
 b=WY6xP2toqU4pFY2MMX1BT3F5zmhJ0+oPcQ6w58Lwsn4yK37hdx4C0kCanF5X24CBS/BxKP/R4U+GipHyfiog//dK8JVj/hvOmhy59RgkhTXPKcX9g2tHo9wX/YnNLmsjM8dWAJYgoobfb0CdWSVdaZAeVARoo8S8EnbtY8jz8f+lOir26QnurvAEGdrAeA17Q4ughhUFLJaz5PR1NwdSYlqN4qAEApikZBFv56EkFA8gDQ9I8U6Qo2u14FWmui5L7B3oxboNnAW5pC91h91YhYunQaSyGpJh+6Vm023lzpNESVAAAHgWBePo+AUDdjQwrP/J2sLmmzr5f3BfdOsfhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LVWPR11MB9883.namprd11.prod.outlook.com (2603:10b6:408:3c0::11)
 by PH9PR11MB810756.namprd11.prod.outlook.com (2603:10b6:510:3e7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 23:16:03 +0000
Received: from LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e]) by LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e%4]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 23:16:03 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "Filipchuk, Julia" <julia.filipchuk@intel.com>
Subject: Re: [PATCH i-g-t v2 3/3] tests/intel-ci: Allow PXP negative testing
 on CRI.
Thread-Topic: [PATCH i-g-t v2 3/3] tests/intel-ci: Allow PXP negative testing
 on CRI.
Thread-Index: AQHdP/H6EVN0lcFIpEuqP5pktMrKq7bH5YGAgACPRQA=
Date: Thu, 10 Sep 2026 23:16:03 +0000
Message-ID: <e4caa78baf45ee1cc255e3977b0a2f220fc7433f.camel@intel.com>
References: <20260909002705.431136-5-alan.previn.teres.alexis@intel.com>
 <20260909002705.431136-8-alan.previn.teres.alexis@intel.com>
 <20260910144309.67bggi2b2ow6rtum@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260910144309.67bggi2b2ow6rtum@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LVWPR11MB9883:EE_|PH9PR11MB810756:EE_
x-ms-office365-filtering-correlation-id: d347d09f-63c6-469c-6599-08df0f917c2f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|38070700021|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: KO/1RR7/+ta1S9el1Bmm7GXecJnYi26c7Y2IecrzQl1i/tJH1Svv4bb3s2NVEebzsi62PCk0JHrQvVN/UDkQNRIcAcL8q5zSTxiKzEQAGo92qzLh8Pm8t3g7CRNlF7/ZzxnBVFA1psXunYBXywLq+nswRhMz8XCj6YknPSFb3WlXzUQl6Jg0wO5juAI/Viyr0PzmPShdf1CDf7CkoDuC5ZCGQZe94dw2Pkh3gG4HPjbUatjf6d6mhXnyAd6amVjUfk7rF81P+wJLSZvYBmhj6kXb/uNu5rjCZ38G0HShCz7c4EstDxZI+rn4k4drgR4sINTxtWkgWt3XP3fQvT6RnAgIAQyfJV9PUXyeW5wo0wqsyFiqjDgu15ztKw/IJ4nuwRHla3fuNC+JuHXmCOmH6QfYo/wV5Kk5bw52xFb69/VeIaacmzTwBcjF0MJHwmJsuo5x4EGqSIxaSZTlDJKrz67JFj8zP3Q6euaPb/W8ZgygXSK9IbBBe2G+E8/lAGkHEYGlxuTJeITtOFs7GdizB8C/vP/KEvHeQzQtT84O7OSYwdDypEgS13nlZ0UwxC2ZCIVsI5AuHNqNwEd/yuZCwoBgp/umo1EM8TTnfXzdGJfgfIMq/V6IxLwtiKH3zwN7fH24AaaR2endj+oaJBxkTDyUEEkcNhaF81kgJHMQay7Ytttw8fqpCvpD+QYMSZGzvDxWOF3pehpVNEGDFVqcSFtGtU7tntCc7x+C/hoX4e4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LVWPR11MB9883.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3ZsbGFtMmFYTVBUZ01YQW80NWc2WElNRSsyN3lYandFVjFLTlNqQmUzNi9n?=
 =?utf-8?B?SkV4aVl5dGloTWlGRi9HLzNTYW8rUFIzRHFIVmRIY2NtS1JqNXJvRjYxNFpa?=
 =?utf-8?B?eTNHaGRBekZXblBOd3FlZTQrZmFPdUFSVHlRN3J1Q1RrRHBzbk9VRDNva1J6?=
 =?utf-8?B?NFNVQmJSMy9yNllSQ3hodno5QU5pNTRyN2Z5TGxOTDIrZ0VaY2NVWUJURVJK?=
 =?utf-8?B?aVVXSTVWaFoxN0RuK25QMHg2R2graGpnYWNmbDlINGJicnY2NkxIaFpQV3Rw?=
 =?utf-8?B?WVZLZ2FMOXRaSFViMzh6TVNhRnArT0hIam05blU1YjR1TFEyMU1JdTlOa2di?=
 =?utf-8?B?ODkxUTFhNU9FOGRONjU5ZWlVYzRLTGJ1MzU2SFRXd28ydG1yNkVNRStkUTUv?=
 =?utf-8?B?OHpSUkd0Z2VZeVNrUERLVjNtcFRUdm1sUW14SitxcGRwbHlBd0Z0MHY1QXJW?=
 =?utf-8?B?bmlwR21jdk13Z0E0RVV3NXNCbEJzbTI1ZnZtRnRZVGRIWk1VL3pQT2ZWL2Iv?=
 =?utf-8?B?SVN1T2QwOU9qOVE4alVXVmtCb0ZKQ3Y3eHgzZ0xzRmRpcmpPZE9kOE1HL2R1?=
 =?utf-8?B?WlhSNVVtbVhiTTdZOTZTNHRTUkwwbEMzMnhsRnlDV0MvZmZ2dG5Sd0dkc0tP?=
 =?utf-8?B?eGY4ZVFvV1lmb09OOGRkKzltNXpzeDNtelhWdThoQ1NIdzRwalUxM250VGJS?=
 =?utf-8?B?WDlWTndXMzlRMHppZXp6NWNkUFFKY2VaM2czZ0g3RURRc1dKWFNwTGdFcE1r?=
 =?utf-8?B?NjdZZExFaUl2UGRZV3dhKzVYdlBNYm0wRGVuaE0ybFZhNlpwMjBlWHpMeXRr?=
 =?utf-8?B?TzNVQURmakpZY1dIc3dqMzB0L3VoU2Z6a1dWREVTcFpvTGhyTC9GTFZLMTh3?=
 =?utf-8?B?TUxsL0xTa1ZTYkVybmFMdjhCSWdMOVRSK0dsY0szajJacGZnYTlsSXdicVRr?=
 =?utf-8?B?cjJNUmZCNlV6Q3Z3Z2tnYkltRE5oYS9tWHB2SFl4QXExL09ZZVJqY2U0OHFh?=
 =?utf-8?B?V3JJZ202NlBwR00vclhiTWtxOVVZRVRYZXlGakMvRk5Rb1EyWGdVSE9Ralh3?=
 =?utf-8?B?RnJnOEZGeFowbE5xbWFDVmh4VzRrUGMyVHlRMFVLSHlJMUlZR29weVF5Sk5p?=
 =?utf-8?B?YzlEWHppRnFZU3RJWHBXQWozS1dmc0VpaDB6ZEZ0enIwQXFVV0tsTHRYUVNM?=
 =?utf-8?B?V3JCNEpWT3hhV056SnYzWUtENVUvSmJOOHczd0srekZNL3FyQmdNci95b2lM?=
 =?utf-8?B?U2VDU2ZQSlVxdlREbThnRlE2TTd2NFNrTVUyKzJsY1l6RnExSjBkV0ZCYzVp?=
 =?utf-8?B?UVBJaXEvTHk2eTBvbmtGQVFiQjRTQVpha1c2VmJYY083UWVXdGMzUXorRnUr?=
 =?utf-8?B?NCt5aG5XOTdoY1ptRFRRYUhrdkpyZ3pHL0VMWlYzWVRLdzc4ZlZXMWpFUUlZ?=
 =?utf-8?B?bGhDeC91VEpOTXZmZ1FNWUFjOUNRTzNtWVpkYkJJWk4wWkNTRmJwcHQ5bDQx?=
 =?utf-8?B?K1JUSytHaWZWSldxTFY2SnRyVU41bk1WZXRocjFDNnY3Smh4TnJkWHVqSUI3?=
 =?utf-8?B?SjlvNmFEVGFiSW5SeGdwODZ2UERRTlBCMnVXN1ErczVPQUJQZGJmT1dVUG1K?=
 =?utf-8?B?SVBmSFFVV1FSL0hkS2dGMHNaMlB0dFdZZnV3QU54UVdGY2Fkc082cHRJaEpu?=
 =?utf-8?B?MHFOZmhjc21mWHorazkrTmJCMG1ZNWFYREVZTUhkZ0lzMU1CQVBWT3V1bnBs?=
 =?utf-8?B?eFVTVWRBam9OWGo0VUdtVDhkTUxYd3k5NzArUFE5SVZ2R1EzWnVrYytDcTQy?=
 =?utf-8?B?RmJrZkx0dU80aFV0RU52OFdrWGxvWmI1R2tyd09JRUNKc3JpTzU3ZHlSM3dW?=
 =?utf-8?B?cmVOSEdDaVVILzFmYVdwakZpMGZrdXlaV1RFZSt2RnY3NzJEMXVUWGhRQVYx?=
 =?utf-8?B?ZDRuK3RWOERmUjJDY3NHQVdQN1Uzc2lydmZIVUFSKzFPenRadk1JT0pvdmcr?=
 =?utf-8?B?L2lYdmFuazFUSDc1Zndwa0Y1NTJnNFdyRDVURTlsT2NVRElrSnAyZDdoTjQ0?=
 =?utf-8?B?ZFRYNmd1bm53UUNRR1ZmcnA3TFZYQ3dCTHhSS0UrSjIvKzBuemRlN1IwbFhL?=
 =?utf-8?B?YzE0R1JXd0NyYm1ScXNoRndlZ2RGV3FDcnhSUXN6dUlQV3BlVlp2VHZFam9I?=
 =?utf-8?B?bm9TWjRobGhTYzU3a05jRWk4eHc0ZHVmcjNNWGJsbXVvUU56dnBpY2V3STlU?=
 =?utf-8?B?RFY5QWFlTWtOU0lwazJlSWNpUlh5N3h3N2pGTzNQZkNzcWFuVkFqSWhXV0hi?=
 =?utf-8?B?OHJkeUIwZXZJa3IwYXpFdzR3M1V6Ymhsa0lhTUU1Z1d6YjM5cDlCdnlxcGZq?=
 =?utf-8?Q?S1mG8WbeykdyQVE5foJiDIAOO5LSyzzPEKnN8?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <993A114D70746F499FBB5607FE845F95@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: lzF4Nw83AfpuOFW7+SjwIeADCiUzvZjHeH6Zqt6ueQZZCIWq6p90yHI+IO2ZTYh94tDODDhsH02DDAla9g+qGsKgzgAkv4WETMz7K1Q6hPDihQaCvWaJItNrfsCJwaXJ3akDaPVMcQO156RvyvYlk8w+WQrUp1xfsk6lRIwUffxIwpXp5JbQIv2+4cYsSIL5gqfoL9XJRIbdLNrt2T/xg6a3RMaswME2FEy/xg4A4CoaG9+mNq8bdvzsdpnzxlnZzPWa1dVPB1Jlt8XNAnBS/P1+y1kxz1KIroux4s/xQjVwOb6seUyV13c9zGP2Le90s7/s1r9lwU6BFb0J0PYdlw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LVWPR11MB9883.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d347d09f-63c6-469c-6599-08df0f917c2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2026 23:16:03.7115 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BRh8ZRWyZSApo4qcAJnzDNCgUoY1km1gW/a4fi3RezdMvJcUf0IJ9flJ166OGl7MjRQENubapzQLJ1WGGz1rEmJny+sRlYJTJ7FRy4KHW2fm94vXcB6z3PWO1FMZpRWz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR11MB810756
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

T24gVGh1LCAyMDI2LTA5LTEwIGF0IDE2OjQzICswMjAwLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6
DQo+IEhpIEFsYW4sDQo+IE9uIDIwMjYtMDktMDggYXQgMTc6Mjc6MDYgLTA3MDAsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiA+IGlndDp4ZV9weHA6cHhwLWJvLWFsbG9jL3B4cC1xdWV1ZS1hbGxvYyBz
dWJ0ZXN0cyBzaG91bGQgYmUgcnVuDQo+ID4gb24gcGxhdGZvcm1zIHRoYXQgZG9uJ3Qgc3VwcG9y
dCBQWFAgc2luY2UgdGhleSB3b3VsZCBwZXJmb3JtDQo+ID4gbmVnYXRpdmUgdGVzdGluZy4NCj4g
PiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMuYWxl
eGlzQGludGVsLmNvbT4NCj4gDQo+IEFwcGxpZWQgd2l0aCBmaXhlcyBpbiBjb21taXQgc3ViamVj
dHMgYW5kIGRlc2NyaXB0aW9ucy4NClRoYW5rcyBLYW1pbCBmb3IgdGhlIFJCIGFuZCB0aGUgZml4
ZXMrYXBwbHkuDQo+IA0KPiANCj4gDQo+IFJlZ2FyZHMsDQo+IEthbWlsDQo+IA0KPiA+IC0tLQ0K
PiA+ICB0ZXN0cy9pbnRlbC1jaS94ZS5jcmkuY29yZS5ibG9ja2xpc3QudHh0IHwgNCArKy0tDQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4g
DQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsLWNpL3hlLmNyaS5jb3JlLmJsb2NrbGlzdC50
eHQgYi90ZXN0cy9pbnRlbC1jaS94ZS5jcmkuY29yZS5ibG9ja2xpc3QudHh0DQo+ID4gaW5kZXgg
MTIwODVjNGRmLi40MTcyZjA1NWIgMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMvaW50ZWwtY2kveGUu
Y3JpLmNvcmUuYmxvY2tsaXN0LnR4dA0KPiA+ICsrKyBiL3Rlc3RzL2ludGVsLWNpL3hlLmNyaS5j
b3JlLmJsb2NrbGlzdC50eHQNCj4gPiBAQCAtOSwxMSArOSwxMSBAQCBpZ3RAZmJkZXZALioNCj4g
PiAgIyBWYWxpZCBza2lwOiBGZWF0dXJlcyAvIGhhcmR3YXJlIGJsb2NrcyBub3QgcHJlc2VudCBv
biBDUkkNCj4gPiAgIyAgIC0geGVfaHVjX2NvcHlAOiBObyBIdUMgc3VwcG9ydCBvbiBDUkkuDQo+
ID4gICMgICAtIHhlX29hQG9hLXRsYi1pbnZhbGlkYXRlOiB2YWxpZCBvbmx5IGZvciBvbGRlciBn
ZW4xMiBwbGF0Zm9ybXMuDQo+ID4gLSMgICAtIHhlX3B4cEAuKjogTm8gUFhQIChQcm90ZWN0ZWQg
WGUgUGF0aCkgc3VwcG9ydCBvbiBDUkkuDQo+ID4gKyMgICAtIHhlX3B4cEAuKjogTm8gUFhQIG9u
IENSSSBzbyBza2lwIGV4Y2VwdCBuZWdhdGl2ZS1weHAgdGVzdHMNCj4gPiAgIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+
ID4gIGlndEB4ZV9odWNfY29weUAuKg0KPiA+ICBpZ3RAeGVfb2FAb2EtdGxiLWludmFsaWRhdGUN
Cj4gPiAtaWd0QHhlX3B4cEAuKg0KPiA+ICtpZ3RAeGVfcHhwQCg/IXB4cC1iby1hbGxvYyR8cHhw
LXF1ZXVlLWFsbG9jJCkuKg0KPiA+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCj4gPiAgIyBWYWxpZCBza2lwOiBtdWx0
aWdwdSBydW5zIGluIHNlcGFyYXRlIGNvbmZpZw0KPiA+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCj4gPiAtLSANCj4g
PiAyLjQzLjANCj4gPiANCg0K
