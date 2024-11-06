Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66367D59F75
	for <igt-dev@archiver.kernel.org>; Wed,  6 Nov 2024 22:09:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D9C10E798;
	Wed,  6 Nov 2024 22:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TWeR8D/N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577A810E798
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Nov 2024 22:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730930983; x=1762466983;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=A26It41tgVVZXpVHOYlTYLa/Y2ZjCQSNPB3Mx45TiTQ=;
 b=TWeR8D/NC2P1CKdKim98BryEohAYG4QH2ANNQa4bKjLyT3rEfeOplSTG
 9JhbumPz5h17zLiDfkswES45j4zXVRyc3wNi+QcxQScfyHhtGupJ/7TVt
 6zfu4RtqV0nd3CqxvsqDKp59Ql0vREs9tNbx4aOJKYWO/ZxlGCLiE/BQE
 KC/MotO8hxJT4d4Smnw4bYK1gkVHlcrw7RmeFyzjmfhS0UFqOP81i+NbG
 45SvQukC6wLVUi2cBo6+KuXWolWEZRjb6PmCO6C2FMLAJuTRvLmGD/7uX
 hdT7tevK28LMcsQaJ/26y+s1XrpkP5iDHzRu8UkbHqHcw547JGc9ESBNT g==;
X-CSE-ConnectionGUID: faNXb95iSmmRxli+/B32cw==
X-CSE-MsgGUID: oSLJQsB2TNqtiw1kxe9qyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30523025"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30523025"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 14:09:43 -0800
X-CSE-ConnectionGUID: tThaNrQ9TciMJexdhdkLrw==
X-CSE-MsgGUID: 2b0sRha/QWyTftktQvkG9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; d="scan'208";a="84889047"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Nov 2024 14:09:42 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 6 Nov 2024 14:09:41 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 14:09:41 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 14:09:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yp7IN6J8lOh3LDPya6x3WRoEkCpuMD2ImQXu+Cwyvx/rmGpgk7TXcQ7uSftfAU5khhnU914aONf7H63G4eLo6w9Sk4qMHSK77oBJ6NIRrE1hjUUnWIa9tNgs0jKWbdt1tPgA8T0xrhq8OUitL2hOsPpQkGFMCvDX/Iq8TXNMy30jwYedVMppsFwz2OlWn4/nq+BgSswR42Gxe9nZoIopbQFrj8JZQqVjGvTZIxojjdQyKkJacmueVjoVOVQkISNAC6MiGF39Twwy7/FWwcNAWJTplNP02BZZSKf1mzXY0j8uk77qi1cnlBgsvLSs4SIAtYa5fbplapdbEyiqHBWhIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A26It41tgVVZXpVHOYlTYLa/Y2ZjCQSNPB3Mx45TiTQ=;
 b=dzCGF+NJ/kIQyIIqdh839OQ4oAtiNEaA5Ui5n1SaHX7avYTPYAp5lWQN9mMd1yu2j5RPS17yzxu4ZFvP95SOSMabnKQ1iJajTYNn9ypiHnDYAbTTYaNz+C8PklVG39WnkRxLTSurZUIzn4NYxDL4dtLOEwNkCGFg4gU2+hJcbuVcLPxq6xNjouARHsWj7BFHALw7/RCL6ngM8vkCCExd9Y8gXApZ6eecZYda1Tl3A82msF8YjUjdnmmib7r4UYlGW/SGryUuwb5lTMrQQDsNkq4O0T4WsImkTnIQPt3fR1B3Gb0DO+rmheWV9pPIgmHff/ySu0WmERTr6Kzkz+9t+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN0PR11MB5711.namprd11.prod.outlook.com (2603:10b6:408:167::22)
 by SA0PR11MB4765.namprd11.prod.outlook.com (2603:10b6:806:9b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Wed, 6 Nov
 2024 22:09:38 +0000
Received: from BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::4137:d45e:2206:50aa]) by BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::4137:d45e:2206:50aa%5]) with mapi id 15.20.8137.018; Wed, 6 Nov 2024
 22:09:38 +0000
From: "Taylor, Clinton A" <clinton.a.taylor@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [i-g-t,1/9] lib/igt_kmod: Remove unused module_ref
Thread-Topic: [i-g-t,1/9] lib/igt_kmod: Remove unused module_ref
Thread-Index: AQHbMJhKE1yUriXXAkCWyhyl5lDfhrKqz/KA
Date: Wed, 6 Nov 2024 22:09:38 +0000
Message-ID: <b622f6105e24386fdc6e42681a37947075bde709.camel@intel.com>
References: <20241105061845.2486557-2-lucas.demarchi@intel.com>
In-Reply-To: <20241105061845.2486557-2-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR11MB5711:EE_|SA0PR11MB4765:EE_
x-ms-office365-filtering-correlation-id: 43f973d0-65cb-4a02-a097-08dcfeafb4c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NjFpZm5GY284MnNLSmhJNW5ZZ1NUN0ZROFp6QklXM1ZXMVJGdlUxK2NiNzdE?=
 =?utf-8?B?ckExdmR2OEROM1ZSMm9QNllNRXFOZlpnUCt6a2QrbkVUTndJNkF4bGRtODJT?=
 =?utf-8?B?eVJqZWg0SC9DWDM5S1k0NkJhb1ltWSsweUFwRzduUzVhWmxqUFBlaEROOWVj?=
 =?utf-8?B?d1JBWG9KRE1UcUJZWm40UUJ0bTFVSW05eE9qczRCd3QwOVowZHhZOEd0N2ZU?=
 =?utf-8?B?M0luK2liV0krUzV5QWYyK0FVS0JlNXVLWWV4Y05kdlpFK05tWENBalBaeTlL?=
 =?utf-8?B?Qk9MT1A0dms4VnpZSkxvenN2ZzFWYTN2VExZeDQ3Z3lBanFGdWkyckVubWI4?=
 =?utf-8?B?bWtHcS9NR2dPUGJtVlM3VjI2Y1VzOUdPV0NTeE5OOGRvM2ZQa2kzeWZUTExm?=
 =?utf-8?B?SzhsKzh1aVY4UVNRVFFGSi9wbjBwZkJKY0lOaWkrR2tlZll0dXpKWDRPQ1ZJ?=
 =?utf-8?B?OGNqYXdKM3czMHU1ZmdUbWh5L0RrUW1UcUtSdFJjZFhBdVkwU0tJUXcwa0pk?=
 =?utf-8?B?WEsreHcwSTdKeE9GQjJrRGQ3WU1MOUlRbG9DcTBqYS9xSUFMbHhOZlF1S2xM?=
 =?utf-8?B?VDJYODNPRVp4YUNUenZiV09pSklDN1h0ak5peWxSdFJvTTY2azNTOG84OVdU?=
 =?utf-8?B?aVR1OHdWaWZPNk1RejhpNmRBN1dCK3czTHdJbUNza3VtYURlang0Z2VuT0Rk?=
 =?utf-8?B?UHVEdW9ucGw5cDU4cnhFUW1pYmQ5OFFOSVZtZ1pWd000WXc5bzArVWFsRVZG?=
 =?utf-8?B?V0N2Zm9YajZwT3JwRW9tY2ZQcDNrb3JXZ3VmSVg3RjBHREt6SjNiVXpRS1Y3?=
 =?utf-8?B?S0pxV3VVaDd2NnFRYkk3Z25jZnRDUkVaWGJNNC9wQUZyemxZUElUcGtrY2x2?=
 =?utf-8?B?RVJjQWU2eGxVNkV1Y29UQ1MzMEhTTFRnWGdLcFBDNlZEbXd6VUF3RldOazNz?=
 =?utf-8?B?eERmSFJRVSs1SENOaWkvdTlxS1NYc1RUNEZiVFRNZnc1MzBnZGRWZ3BFK0VE?=
 =?utf-8?B?UzZWTGxUaUNZWDY5QzljUklZUkduR1hYWUdINXdlSXkrdlpSaVRXa1BKRldW?=
 =?utf-8?B?Z0JISXZZZHowZE5yYUlzQnRVN2xaRWVZVnU4V0VueWFxTE5ZVHFsaW5YelhV?=
 =?utf-8?B?RnZ2RXkxREUrNDJDaEd0U0x2Nm1OQWgxbFlhMllrMzhlM3BVd0c2YVFWbCtY?=
 =?utf-8?B?S2N5MWQwY0prdlpFNWlBd2NCTEF4ZHB0TjNFUzYzdEhJTVc5KzhGa0VuWXc4?=
 =?utf-8?B?U2VYOVNCRzVldy80YXI2aWZwNmhHc0hIelZOUERWYktRbmtUek1ybVhmaE96?=
 =?utf-8?B?SnJjT2lkSzRqWGlKeVF4aC9CeUlTeXBKQkRIZDNRRVJqU1dUSDJvaG90dmlu?=
 =?utf-8?B?STJTcjFEVDJqanFzZDdBZ2l1eEt1RWxYb1NMZjRxazBhd21oVU11a0ZKOXRi?=
 =?utf-8?B?YkpUVlQvb0wvVmNtUUlvY1laeFJKemJ6aHhiRFRkdnRTdWM4Mkk0Q3REZ0NH?=
 =?utf-8?B?dm5QZGhMNTVzSEJhUGlkeWRTQVQ3aFc5LzFiQjhxU3FYZk9uY28xbnM1OG5I?=
 =?utf-8?B?a28zakVJbjhzNG0zM05sdDNPMHcvWlkxK09uYlVRNmpFanJsbXorRFhTbjcv?=
 =?utf-8?B?aVo4eUZDTWtNNkVGcFcxcFcyOFdVWkZqM0JuYWhTNWZOZ1piSTh3SHZ3SmFm?=
 =?utf-8?B?YnRKOEYvZFhhOTZFcnZtZ2ZwaWlVSEExQ3g4WlFIVE1EcXdzY2xrdkJOaHJv?=
 =?utf-8?B?K2REMWR0a05RQjRQWDNBZlhZZFV3eWhockwvRzltcTFpU3JiUVZXL2JEbFZa?=
 =?utf-8?Q?HM9aPEttRmelsmK5p78ccMYwyUZ14KLjAOL1o=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUVGbDgvZ0tTeGRGek14YkVTVUUwMzhPRmkrTk9zM25ISWtUVXlrSEYwcWRF?=
 =?utf-8?B?V3p2S2hxS2xUR2JkUHh0STkvNXRwRG96OWQ4czRrYVFRbHlPOGYyWXAwd3Zz?=
 =?utf-8?B?L3hERDZPdHU1M0c2Zytlb05GVnY3RjdxSndBSThqelFEeGZQS21HWXYrTktU?=
 =?utf-8?B?eXd1TDQ5YnRsYUF2R09SbkNLM3NzWWxZQ0F6Mld0bXpWV0UyTVAvcTh4S3N6?=
 =?utf-8?B?NHVlYXVhaE1yaDRkbFNnUm9nd1dGRDdrODF2ck5kU09QcElRMXBVbWxOcy9a?=
 =?utf-8?B?Y0dqUGc1d0pFZTBzbjhqVm9WOXM2Q3o2clhyZ1ZhWXR1WllrTi9NWWxtK3NZ?=
 =?utf-8?B?TWNOUE14UGR5czlLWEZDdUVPRkI1YWNuVms4T3lmZXFKcnhoc3BiU3NHRm9W?=
 =?utf-8?B?cHd1RW9lVGZSN0hjK1dLVGdYVGhUeFBzbTVmTXljcVBGNThBL2VYcEx2TEdn?=
 =?utf-8?B?MmhBNGtUbXVmdDJtSWw2ZitwT3E3QlRsU2dXS2dXR0lxUnNuZ01SMXZuZm5y?=
 =?utf-8?B?cW5CWkNadWdia3ExN1lHTXpWQysxdHdyTSsyUzkrK0JnbExyY2FBVWNEVUNO?=
 =?utf-8?B?Qm9tbWZ4QUpqTi9YWUdmTmVJMlRkcmY2QzNHaEZwdmJURFVlSUFkRFVqZzBQ?=
 =?utf-8?B?VEY4UmtqQXZoTnRsUTlQVjUyRFdJcUQ2MndsVkd5R3VWdjVoY1dMVERsV3Iz?=
 =?utf-8?B?d2NZdGFpSjFwb3hreWx2Mm1XeXJ2TzNkWkhNWERxb2ZXc0FMMHVvK3ROdDVK?=
 =?utf-8?B?UGxZSTNSZCtsN1R0MXRDc21FeXphVkZBQnhGMWduVDRQZzEyL3pVWjRtTFhI?=
 =?utf-8?B?SnhxcDhzdy96TnIzcGlkYUdBWFZkdTU5Smw5OVFyeHBHZVVXQkNUaFB1UzhC?=
 =?utf-8?B?c1dYZ0hDTGRsRnozMVVBMG1qVTY5bC9VNnMyeGo3RXQ4aVZPV2xUTmZNSGxw?=
 =?utf-8?B?MDFOeFE4WVB2aWN1TVNvakdOTDhGa0NSNXVMeDdOTSt5UExhZ09iTzMyZlBi?=
 =?utf-8?B?QmFTbTk2N2dPNGxWTFREUmZLKzZXY01oOThCUmpBL1IvSWFBOEZySWtXYWpo?=
 =?utf-8?B?b04rNk1BQTVPZTRleTVRMzlFdjJ2RGpyK0FBRjE1ZDVqL28ydVliZ2xUVlVB?=
 =?utf-8?B?bFhqQWdCcSt6ZGFSajcxSnp4TkRsa0FYUlFqdGlCTHlMUCt4SzRwa1NSQ3dq?=
 =?utf-8?B?RituNFRBLzBvbG0wd1d3eHZ3alZYd1N3cnByOXR1U0R4SENCRjdkNFpScWlp?=
 =?utf-8?B?RG4yeVhpZ2FwZy8rUlM0VnROOWZtS1VuSzB0Y2I0MUk0c1JpZi9rU2ZZMVMr?=
 =?utf-8?B?UEgxSDRQK1ZVeU5qU0pnaVBNWkNZY05KOXcxN1RZOFMrQytXQkV1T0dISEVt?=
 =?utf-8?B?UVVZU1laWE9iSkpLY2ZVMTdWYVJ1VXZLT0FPUHRBV1pzSWtsajQrNVJHcG9B?=
 =?utf-8?B?MEltb1A0ZVB6RURnb1ZXbWVjalAwOW4vNCtpQmNUTUljZmk3UzlFb3BYZnA3?=
 =?utf-8?B?djNtSXhKZ3ZtRUkzeWJaRzMxN2Z2TWg5NlVhQTNUV1ZCRXQ0Zk9xMmJubkFy?=
 =?utf-8?B?bEZDaE50RDVsMmxBTzcxcHF4LzN3TEt4dlJpV0JyVW43WEp5M1RwYWFwYVZK?=
 =?utf-8?B?TU00NFQzbVRhdHhtTTdBSTE4QjZLbytMVFN0d3k1SVhSS1U0elBLNGNuSDRI?=
 =?utf-8?B?ZHlzaEIvTHlZYytTZ0trdDB0M094Y0FNYldlK1JRNWtkR0pqelRIUkk0TWto?=
 =?utf-8?B?UVJNbTFkZzZTMm9VVXR4d2xrOS9hQXVjK1M1elZoVHJkWEZBT2hLRENqQ1h2?=
 =?utf-8?B?a0tzc0lpTzNvcE5NbWdHOUpFRDM5c1RGZ1dwTDByZ2pyRHdGUWkwQndTQUdS?=
 =?utf-8?B?TUJSdjRhRkNLNjJPaDlJSElhSVNOb0JBVzl5QWF0UXdXNUNSdGY0aXJ1R2R3?=
 =?utf-8?B?a0hvWTljN21abXoyMWdoTnA2Ni9wWWs3NEg1V2EyeTh3UndWUHNsbnY1d1Ay?=
 =?utf-8?B?VkQzRHRhb05udVVySDZpdkNUSTFUOE9rRDFKVWJVOW5PSVBPVzhaN1RVV1ZQ?=
 =?utf-8?B?WXA4U091Q3RTdmxIYnlEMjhRRnZjNE9tWTZZSjRlaGxUdnVSMFVnNTlPRktr?=
 =?utf-8?B?U0xwOXY0d1FYOE05YjdZMVZlSlh2RDJCUlVJVDZkQzBKeWNMTzBDTFNLNXFJ?=
 =?utf-8?B?Z2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0487583C6B256E49A9D0590503FBCCDB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f973d0-65cb-4a02-a097-08dcfeafb4c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2024 22:09:38.5241 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WaSF1yd7YCl9HDnNwlNUxO408cAktGNHrfrCu6dXhKfQ/CbbP9UqiOrJP72OD954fU2dq18ZsI/wIZ7C06jw1GuODUBe2xriqpa6OpUUnTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4765
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

UmV2aWV3ZWQtYnk6IENsaW50IFRheWxvciA8Q2xpbnRvbi5BLlRheWxvckBpbnRlbC5jb20+IA0K
DQotQ2xpbnQNCg0KT24gTW9uLCAyMDI0LTExLTA0IGF0IDIyOjE4IC0wODAwLCBMdWNhcyBEZSBN
YXJjaGkgd3JvdGU6DQo+IFRoaXMgaXMgdW51c2VkIHNpbmNlIGNvbW1pdCAwMzcwNmNkODQwOTkg
KCJsaWIvaWd0X2ttb2Q6IHJlbW92ZSB0aGUNCj4gY29uZGl0aW9uYWwgYXVkaW8gcmVtb3ZhbCBj
b2RlIikuIE51a2UgaXQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBEZSBNYXJjaGkgPGx1
Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gLS0tDQo+ICBsaWIvaWd0X2ttb2QuYyB8IDggLS0t
LS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2xpYi9pZ3Rfa21vZC5jIGIvbGliL2lndF9rbW9kLmMNCj4gaW5kZXggZmI4M2YxN2MwLi5k
MDMxYmZlMTggMTAwNjQ0DQo+IC0tLSBhL2xpYi9pZ3Rfa21vZC5jDQo+ICsrKyBiL2xpYi9pZ3Rf
a21vZC5jDQo+IEBAIC01OTMsMTQgKzU5Myw2IEBAIHN0YXRpYyBpbnQgaWd0X2Fsd2F5c191bmxv
YWRfYXVkaW9fZHJpdmVyKGNoYXIgKip3aG8pDQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+ICANCj4g
LXN0cnVjdCBtb2R1bGVfcmVmIHsNCj4gLQljaGFyICpuYW1lOw0KPiAtCXVuc2lnbmVkIGxvbmcg
bWVtOw0KPiAtCXVuc2lnbmVkIGludCByZWZfY291bnQ7DQo+IC0JdW5zaWduZWQgaW50IG51bV9y
ZXF1aXJlZDsNCj4gLQl1bnNpZ25lZCBpbnQgKnJlcXVpcmVkX2J5Ow0KPiAtfTsNCj4gLQ0KPiAg
aW50IGlndF9hdWRpb19kcml2ZXJfdW5sb2FkKGNoYXIgKip3aG8pDQo+ICB7DQo+ICAJLyoNCg==
