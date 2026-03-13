Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987C5105F7A7
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 12:56:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4734B10EBE0;
	Fri, 13 Mar 2026 12:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QUS+/HAB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2495510EBE1
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 12:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773406606; x=1804942606;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hiGJi4xpTaOBo5BmHxCGBIOXMglothNETNsN2aHmMXA=;
 b=QUS+/HABLtBbMfhNxulhQ2FT8O6PDMWtWoMUDMjffxwiSBm7MBnfUhOz
 oWY28iWbP81Js6Hud3qPXDxoPzlgBLNi9xQqDXJcgrUMtm4iz5ySg2O63
 vrg95qQjhxYzdZlVW/NscifSRwYQquCPDsLd+TJLve76obRp1OB9JtQ+R
 AgTnHX+4QdzHow/yikKlrvZV0TJaT7KmmDmBwf89c17yhR/eAA4RYDZWk
 YVHFyYZcsJ1uJ1t0U86o2fbwE2g6RL7ylUpznbXb/fQPzJkowd1O9zTwQ
 K06BrbWR6PWk9xy/n1L7egkg79iXoAf55PkGHbvHY7j+DFnX+uMXpUQKQ A==;
X-CSE-ConnectionGUID: 2Ada56mpQxmeFuwpHN/L/A==
X-CSE-MsgGUID: 6ZZ10typTQOGVQxRrlp3Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74624323"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="74624323"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 05:56:46 -0700
X-CSE-ConnectionGUID: tjw5cANcSgOhgr4fEX5TSQ==
X-CSE-MsgGUID: lEob1NBUTuCViHl7bld18A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="221098956"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 05:56:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 13 Mar 2026 05:56:45 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 13 Mar 2026 05:56:45 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 13 Mar 2026 05:56:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9miWnI3CNMFuB7QOk8vqRZOYjhoTl6/JcTGRu1DOwlJjGepX5XQZho1DnZdTkYANi7tUPQE/PiqiSuBxZbg/JhbvpOGS3nnqBVOlVBBR13gH1ZVI0WWtURCBsVOB7gygz0vfWngxvro1uvvgdjNU4GfQluYYqYTPPiPoEgI4x8UXnRoFGwbz+K8NFH/N+4GGLkz9psrwMRY7yB5vIMcQRCGEjuQmYxoSzd7Bgu0K8Oi2Xbk3LVTEAx6rcHzkhmdKzE+dV4kThqPFcNpO2kd49qvic5KZVB2uO0u5T9g4EhHMZEfKpSEmtGMZ/NSH+cZ1Cox8RNVxPFXf4DykGC6Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hiGJi4xpTaOBo5BmHxCGBIOXMglothNETNsN2aHmMXA=;
 b=Cmn+JzzHZVmi2fcW+PnQWA6gELQcC8RLN4Z9+jDtEMOnyna7+uHXFwzzub1n3jrxYh8mDAcILDeg+l7Ueme+Fx2RVxK8xMyoBNmeWQD1K5wLGBd1OjQh93tc1B6Wd3M8D0Zd55QoPxLUQx5jPTrwP29vjO6HH4zCGb59mWX6OhCDbv2uFjTB4JCa7lYqlnjVTBTVXHudqCdgXdG9eK7oZViNrdOpMIYEzvaxUwPtoHyLf/kMO+NZeF7VMg3iFrQd0EZgmWp6yrvRQxutoEvgXCY9fIvGW/DM3OR7QOwbAjyKdbXjsjk858VqK4m8CYXnryQSiCfWjJcLaW1hRl6xgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::28) by IA1PR11MB6076.namprd11.prod.outlook.com
 (2603:10b6:208:3d4::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Fri, 13 Mar
 2026 12:56:42 +0000
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::c241:4530:b5a1:30c8]) by DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::c241:4530:b5a1:30c8%3]) with mapi id 15.20.9587.017; Fri, 13 Mar 2026
 12:56:42 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Nikula, 
 Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_cdclk: use igt_next_crtc()
Thread-Topic: [PATCH i-g-t] tests/intel/kms_cdclk: use igt_next_crtc()
Thread-Index: AQHcr+EjD64jF2iTFUutI0OXIjNEDLWscc6w
Date: Fri, 13 Mar 2026 12:56:42 +0000
Message-ID: <DS4PPF69154114FA11469126489B246BB51EF45A@DS4PPF69154114F.namprd11.prod.outlook.com>
References: <20260309162311.706849-1-jani.nikula@intel.com>
In-Reply-To: <20260309162311.706849-1-jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF69154114F:EE_|IA1PR11MB6076:EE_
x-ms-office365-filtering-correlation-id: 694a66db-c452-49cf-12fd-08de80fff95b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|18002099003|56012099003|22082099003|7053199007;
x-microsoft-antispam-message-info: yL3CdaUPSwur/r2kEa1BOE6z67bLIkLD2XpFkJiyktPlqaHQsjvrX5bcNygt0VNML6aITZwzWXscBe8HadmcWKA3RiGrZo92eC3ufUMSezKh0raUaWhgJVt7weE7QTMu6/3BDp9HiMscakixO2R388JSvNUJyOrq+nioreC/zToqxYS3eKgB8UvrbVvL8i/b8US1dCIB8GSVfBnqtuGZezdY8bVMU53ZUds+xGVnnkVvb2ZbD3n1rWe1Er3OsZkRMTHc0tq9ahyf9BVhWOn82rdKpKKgwWF9t4+O8s8GTOFviWTZnnZRTtZjG0UGbIsb55UuK88/XqdVzV8dYKL5JHpYumA10d3288bWz0Y0P4K29xzcgsL+XgPmWyxU9P5j8Rv+dzyLxQeVS+Oi8tzoQRF1o4jAq92C/r5vY0t0mmYFrRP/C+JX7zbjypPdlcAUcCqLTdllCqk9PALrbuUmkRJtzMusRB1+/Q7vGrlu/lcHXehWwGZjACtbWOFubqD4jMYRI1tZIPABOQyF+FvD+NYSNxLJZlp3Xbz4bKDuzBblBSWEY0NL+tUwQzpBDAx19zMshvL0+X4uK3bJZbvoUG4DcUqDbY934zE8aRz7h1JWToSPQQPDK/0E+TPCnGRiYfq+0B0jqI4KB1NQmWzzkkw3CCKMtTYpX95MxUUlJMbX4iE4PQQ72vEDBTD6fkQqwdWMSkhB9LRgKUU6MaiXuEiLwCnyumlaEefj2GD3rsGSGpIO1lmkq+apqfgd2lGtkfSwxlmBBU0V2IWPk43Xm88WlHLNbq5fCMSMyTvyG9g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF69154114F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(18002099003)(56012099003)(22082099003)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2JjSXNTYkZQZDdkUGIzK3Q1djhuWm5nWGlsaXdEK0pxNDNOckcxWXZ3RENY?=
 =?utf-8?B?NExmMWE1WFQ0akFZTXJVM253OGdjUE9lMHBHbXRaWmUvMDBlaStSemEwNXEx?=
 =?utf-8?B?K3ZSamR1LzJzenhYSDBBZWlFRTN4elN1Z015NDc3S2d0SitQclJlTStIbCty?=
 =?utf-8?B?S3BwVjBUbzN2dVVsZ2hPcFovRjdIU3kwTG8yWHVHU3VkdUc4ckNTQ1FmcTVr?=
 =?utf-8?B?L25EMFRWSittblRrZkpBN3VvNTc0b3pteU12RXkxc28wWGFXRU5qV2w0ZkY4?=
 =?utf-8?B?UG5KUVE0TjVISVhoTXBBcnFMeFV1ZUZuNk0rZi85cndiOW9IdkZHclE5dUJV?=
 =?utf-8?B?ZEoyZS9iVXNtaVNWMUM0OGtOeGVKeXduZkFrYzlsMkZqYnRMSjdmcjR0NEZG?=
 =?utf-8?B?c0wyT3F2TXFLS3RvSWZnTm5HdW5FMUZzYkJXNmFlQzkzQ0pvNGh5WFVvMVJv?=
 =?utf-8?B?WkVYdkxWQ2F5TGVvSmhjdXkwOHJpS0NacDRIbXZFU2IzTFEzTHB3SkhvTFIw?=
 =?utf-8?B?Q21vUjdzN0dZY0cxRUtwellydEU2MHFSRlM4ZDVwci9URmRMT01pWkkwN3hE?=
 =?utf-8?B?UWFHS091VXlpM2VPRmhlOFMxNXVScGE1ZytySVlLakVyVnZRaEJCQWlGYkJF?=
 =?utf-8?B?WjRYaDVoOG8rcURLQmlrKzlTZTYzTGRUSmFGRitBb0pCTUcyTEpUMmxMRTJo?=
 =?utf-8?B?cXYyUkdUYno4c1duUklNc2VTcVYycDd1eGRRYUg1MFUyMzVzeWlSQWpIcnVT?=
 =?utf-8?B?VTZzaGsxS0pTemlUVG5rTVZNNnV1cDFsdDU4WWZCSmxpeFgvRWNBVFJuUDFG?=
 =?utf-8?B?WXF4L2Npblh1Rk5HRFZhemd1eXl5WGRuUS9hdWIyMUVJdnpBQ0JibVBxbFZX?=
 =?utf-8?B?eGIxT1pndnlha0ltSTlKZEZBQWJKenRQVmJaR0xNSEpwR1Ayb2cxcVFQejJB?=
 =?utf-8?B?RGY3Vnh3WFQraFgvV1RKQkVxeGhHa3QxYUZOU24xRDJXU3MrNEhyRVg5REZs?=
 =?utf-8?B?YUhlajhoYytncDM1VTJVdW90OVF0UFRjeGRhSk5sR25SOThJcmJneStSSFVP?=
 =?utf-8?B?NmhJREpkQnU2UlBEalBTMWczSGNUQSt0dU16Q1VPQmx0S2VsdzhqYi92YWJu?=
 =?utf-8?B?OFJzSVE3NS9vVVF5MjBvT2xyREh0MnFxUWQ3QXU2VEVPMnBMOC9GM3NGRG9G?=
 =?utf-8?B?MHgzRUJvWmt1VTJCYlFvVzRmQi9xc0thZ3ZZMUU2SjRhQWFqZEtOZTByRmNy?=
 =?utf-8?B?Q0VYQ0QrdHhyaitKNnA3WGF3c3Q5L3Q4T1lRTnlpbGt5dkdSUzY4RXd0L1hm?=
 =?utf-8?B?MWZ2dERpZWIydVZIOE43WFV2b2p6b3c0Wm80VllCNldXRFNrdDg1Y0k1a2E5?=
 =?utf-8?B?bThmVitHWmMvSFNxWnNTc1IySmVmMlJJTXFXMW9sTG9EZnBPSHNPUVpMNGNC?=
 =?utf-8?B?eVIyNE1sMXV5Tkt3MktGbldjakZGdU1ZbkxJdkc3K2Jsbm5Mbi9JenBzcXVI?=
 =?utf-8?B?bUlXRFVNc1d1WmlUTWJCL2ZYK1V2dThlMGhETXRWS3ZBWGJJZGx4TmVBamRo?=
 =?utf-8?B?UFB4aURTTUZkL3ZmOVVZczM2dlFaWEt4eVBKRGNlT29qRkRFZHhGZ3pNUHh4?=
 =?utf-8?B?bGM1S0NOUUYybUFkUFArcVdsTGdHU2ZqcnJ6ckJDTmVacGtuRTNVL0VydHl3?=
 =?utf-8?B?TXk2TWN5eFRqUnduNFlZSW9nQkc1a3BwTmYvVkp1djRteTR6eWR0Qk90bzl5?=
 =?utf-8?B?VUxIUitnWWI3WkJsMVZCc0NFL0NTbTh3Um1CeHJlbjE5ckpXeENWOTBFS2hC?=
 =?utf-8?B?Y2xZQ1ZqUTVhYnBXTHdUWXJFbjdoc25jNVhKY3pSSWNDR1dSZkQ2eUxEWmZr?=
 =?utf-8?B?WFFKN243NS9sbWdML3B3dU1UZ1Z0d2VRMk40R3FGM21vaTJTeWI0ZVYwWW1t?=
 =?utf-8?B?WHAxa2ZhMmF5dnM0WHBQUmtKLytCWU94T2gzUzZIckJVcVRnY29WZjJkOGRD?=
 =?utf-8?B?cjNFdXg2OHljNHg0c0RaNXdwN2dmb2gzWVRFZWlpb3krN2VrdTd4WXV6WlVS?=
 =?utf-8?B?U3c0QnF4OE9uelFwWko3dnZhTEtMc1QxSDNEdExOenpBek81bmV4WW5JT1hW?=
 =?utf-8?B?dThvRU9xZlBVK2p5SUg0MkhEUHJjWnFHa1dzUWRVSVYvcmdBdGRrSWRWVFVt?=
 =?utf-8?B?WlFUK1dwajJ6bk14dWljaWg4RmpwNURaTUlqK2NQNzlkakJWU1JQKzduMEZQ?=
 =?utf-8?B?ZXQ0K3RtVkxIaCtBdzIyVnFRVE42MmNrZmg5SGNrL3VWYkJvTjl0SlJKRldI?=
 =?utf-8?B?bTdkOFlxNGFDampNdTlNb2JSd2dFSXc5NUpJRFljQk9jNy81RHM3UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: uAy4CP0s0C9TYYi1kJV1gbmKesb8W/38OjSS0i5MVZ45q1BTHMXVybuwh4EI7srrbGrQ1emui592SSyz7hcr9r54KHtMAR11HElrhNN66DGn+ToapqNonAkMSmmUtNThtFei2uQGoohhPHBuoDRGM5aCE5PmhvdPqko85aWVNnPqL+XpsDlgKblJ53reJeZW7QpS+3rnjgfNCHga2qCoFoTlbIE0ZGrmHSLfTIE4O81g0KP76xpjqMrgrLhqR9BCUhOvAVDYpRTdM7YB+pGY3kTxli59FgMUn5knX43B7OsZFLOSB2qAbMO9TYdu6nzrO99ONYxT8zs15wUQY0c5hg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF69154114F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 694a66db-c452-49cf-12fd-08de80fff95b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2026 12:56:42.1196 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qVutSrgIwb0was0CcHLh17yjI6FbJr2pO7nad5WHXibT+RLgw0uLodKa6vVWVcV93V0a7YMuwvTBCn7BgUU18A==
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSmFuaSBOaWt1bGENCj4g
U2VudDogTW9uZGF5LCA5IE1hcmNoIDIwMjYgMTguMjMNCj4gVG86IGlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+IENjOiB2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbTsgTmlrdWxh
LCBKYW5pIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCBpLWctdF0g
dGVzdHMvaW50ZWwva21zX2NkY2xrOiB1c2UgaWd0X25leHRfY3J0YygpDQo+IA0KPiBUaGUgdGVz
dCBkb2Vzbid0IGNhcmUgYWJvdXQgcGlwZXMsIGJ1dCByYXRoZXIganVzdCBhbm90aGVyIENSVEMs
IHNvIHByZWZlciBpZ3RfbmV4dF9jcnRjKCkgb3ZlciBpZ3RfY3J0Y19mb3JfcGlwZSgpLiBUaGUg
aSA8DQo+IGNvdW50IGxvb3AgaXMgcmVhbGx5IGp1c3QgYWJvdXQgY291bnQgaGVyZSwgbm90IGFi
b3V0IHNwZWNpZmljIHBpcGVzLg0KPiANCg0KUmV2aWV3ZWQtYnk6IE1pa2EgS2Fob2xhIDxtaWth
LmthaG9sYUBpbnRlbC5jb20+DQoNCj4gU2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEgPGphbmku
bmlrdWxhQGludGVsLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9pbnRlbC9rbXNfY2RjbGsuYyB8IDEw
ICsrKysrKystLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwva21zX2NkY2xrLmMgYi90ZXN0
cy9pbnRlbC9rbXNfY2RjbGsuYyBpbmRleCAyMGI4YTVmMGEwMTguLjY2MmJkYmU0MzllNSAxMDA2
NDQNCj4gLS0tIGEvdGVzdHMvaW50ZWwva21zX2NkY2xrLmMNCj4gKysrIGIvdGVzdHMvaW50ZWwv
a21zX2NkY2xrLmMNCj4gQEAgLTI0MCwxMCArMjQwLDEzIEBAIHN0YXRpYyB2b2lkIHNldF9tb2Rl
KGRhdGFfdCAqZGF0YSwgaW50IGNvdW50LCBkcm1Nb2RlTW9kZUluZm8gKm1vZGUsDQo+ICAJCSAg
ICAgaWd0X291dHB1dF90ICoqdmFsaWRfb3V0cHV0cywgc3RydWN0IGlndF9mYiBmYikgIHsNCj4g
IAlpZ3RfZGlzcGxheV90ICpkaXNwbGF5ID0gJmRhdGEtPmRpc3BsYXk7DQo+ICsJaWd0X2NydGNf
dCAqY3J0YyA9IE5VTEw7DQo+IA0KPiAgCWZvciAoaW50IGkgPSAwOyBpIDwgY291bnQ7IGkrKykg
ew0KPiAtCQlpZ3RfY3J0Y190ICpjcnRjID0gaWd0X2NydGNfZm9yX3BpcGUoZGlzcGxheSwgaSk7
DQo+IC0JCWlndF9wbGFuZV90ICpwbGFuZSA9IGlndF9jcnRjX2dldF9wbGFuZV90eXBlKGNydGMs
IERSTV9QTEFORV9UWVBFX1BSSU1BUlkpOw0KPiArCQlpZ3RfcGxhbmVfdCAqcGxhbmU7DQo+ICsN
Cj4gKwkJY3J0YyA9IGlndF9uZXh0X2NydGMoZGlzcGxheSwgY3J0Yyk7DQo+ICsJCXBsYW5lID0g
aWd0X2NydGNfZ2V0X3BsYW5lX3R5cGUoY3J0YywgRFJNX1BMQU5FX1RZUEVfUFJJTUFSWSk7DQo+
IA0KPiAgCQlpZ3Rfb3V0cHV0X292ZXJyaWRlX21vZGUodmFsaWRfb3V0cHV0c1tpXSwgJm1vZGVb
aV0pOw0KPiANCj4gQEAgLTI1OSw2ICsyNjIsNyBAQCBzdGF0aWMgdm9pZCB0ZXN0X21vZGVfdHJh
bnNpdGlvbl9vbl9hbGxfb3V0cHV0cyhkYXRhX3QgKmRhdGEpDQo+ICAJZHJtTW9kZU1vZGVJbmZv
ICptb2RlLCBtb2RlX2hpZ2hyZXNbSUdUX01BWF9QSVBFU10gPSB7MH0sIG1vZGVfbG93cmVzW0lH
VF9NQVhfUElQRVNdID0gezB9Ow0KPiAgCWlndF9vdXRwdXRfdCAqdmFsaWRfb3V0cHV0c1tJR1Rf
TUFYX1BJUEVTXSA9IHtOVUxMfTsNCj4gIAlpZ3Rfb3V0cHV0X3QgKm91dHB1dDsNCj4gKwlpZ3Rf
Y3J0Y190ICpjcnRjID0gTlVMTDsNCj4gIAlpbnQgY291bnQgPSAwOw0KPiAgCWludCBjZGNsa19y
ZWYsIGNkY2xrX25ldzsNCj4gIAl1aW50MTZfdCB3aWR0aCA9IDAsIGhlaWdodCA9IDA7DQo+IEBA
IC0yODgsNyArMjkyLDcgQEAgc3RhdGljIHZvaWQgdGVzdF9tb2RlX3RyYW5zaXRpb25fb25fYWxs
X291dHB1dHMoZGF0YV90ICpkYXRhKQ0KPiAgCQkgICAgICAiTnVtYmVyIG9mIHZhbGlkIG91dHB1
dHMgKCVkKSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0byAyXG4iLCBjb3VudCk7DQo+
IA0KPiAgCWZvciAoaW50IGkgPSAwOyBpIDwgY291bnQ7IGkrKykgew0KPiAtCQlpZ3RfY3J0Y190
ICpjcnRjID0gaWd0X2NydGNfZm9yX3BpcGUoZGlzcGxheSwgaSk7DQo+ICsJCWNydGMgPSBpZ3Rf
bmV4dF9jcnRjKGRpc3BsYXksIGNydGMpOw0KPiANCj4gIAkJbW9kZSA9IGlndF9vdXRwdXRfZ2V0
X21vZGUodmFsaWRfb3V0cHV0c1tpXSk7DQo+ICAJCWlndF9hc3NlcnQobW9kZSk7DQo+IC0tDQo+
IDIuNDcuMw0KDQo=
