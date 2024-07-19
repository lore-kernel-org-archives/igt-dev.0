Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AF8C3DA59
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jul 2024 14:16:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A4110EC34;
	Fri, 19 Jul 2024 14:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HPzmgbmK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC0910EC34
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jul 2024 14:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721398581; x=1752934581;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pskQAPITrhN1ud9msP8i+d3uVyR8Ss6FG4zzt8tKpt8=;
 b=HPzmgbmKJdM9bE/8yT2/+6FcsOpdJG/dg5nOjlygi9V6RQenpSHmTVfd
 /c33gnRPWmmsJF7rS81+9KrSGAMYkzuzj9gpe6T9uGvn8ZPYSrpqBnlzK
 M/qhTNCj8Hd05lSquJCYZFW1E3z7CfdUV10vfw/ty4dr0lPc35rNtEfs9
 LJdupN07rH5v6HjBuIfpjNdR6DGMQW6b9auo4EtxclCKWtYchYb9Q5d8i
 kmd1+as8o9NbA89dWLcnqtINyIQ7NP44KxvwLp54SMtUakyDd88XFFiPh
 x6Sgto8MLbd8iJEWa/g60+A8xRi0znJt7iakCmhEseBsPbzbwMyK++SiK g==;
X-CSE-ConnectionGUID: LEacLTjASQaj6sOz62ApwA==
X-CSE-MsgGUID: z8S8o/wkR/uY8fwvAA5/0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="19157124"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="19157124"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 07:16:21 -0700
X-CSE-ConnectionGUID: WldP0xQjRT+Ro5AUd54qVQ==
X-CSE-MsgGUID: wdHsWXMUTV6cMo81nr29Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="55964245"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jul 2024 07:16:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 07:16:19 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 19 Jul 2024 07:16:19 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 19 Jul 2024 07:16:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S5gJgA3sTRxb6+pDCdMbgId8EpLtvy6naHXmMq/6oGrAGjXCxq06/nF6i+GiwgLrlvQ2dqEBxQnr0P97QgvOWENSg66ql62u5Dtzvn4m8e3z5QAm9LWlougw1InrvHczykyHHv5MkE4LaBNPQd5GErWBsEbzruU95K4v1QC/c4z9xn9i702aSNfB9ruyuYm0cvy2PmpvP+GgFQ9thKdFR2K/gVcOqggBPq3+ToiEh3EgIt6AgvEYrUU95BThTMPEGkQBnHXdZJA2/pszX7JJuLyIvul/70UO+7z2q5/T/vUjHMDc0QXhv0o4YTJ+6gKUL68ZKpxdQxKbAzl7f262iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pskQAPITrhN1ud9msP8i+d3uVyR8Ss6FG4zzt8tKpt8=;
 b=Li1Co+I9+waeIE9HCPTfIf+aRUk9OCxgqN3Q5RyiBE/EH4qqLK1skjrbEwLcpgqBiG+FDtm16vZUOvhzAEFTB9uFKAcFPYBr8hVvJlU1DZVLD1PrnTkJNwD6URz7xImUyRN4aEelI6R2mgQt4MN34sAGWN50KKy/lUvJ9zfiP+4bqj37xeYouwMD+4/KGN9oJraAeTT3p5H9dZNUluDqv9Ugb+mqXTn1oHetycfoLfEuGIcGwoyPdY7XcabY03PrIw79tLxJ2J88lOTZUqtvHhTkaK9n5Mqa3yXhiV7Rag77/hYNuVXz1mUs3GhglcS8QXMDYTKrhN28mtAhdC2HXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Fri, 19 Jul
 2024 14:15:59 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7784.016; Fri, 19 Jul 2024
 14:15:59 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t 1/2] drm-uapi/xe: Sync with topology query uapi
 updates
Thread-Topic: [PATCH i-g-t 1/2] drm-uapi/xe: Sync with topology query uapi
 updates
Thread-Index: AQHa2d9/NG9tS2Ht7E6c300F8u/v57H+F6Qg
Date: Fri, 19 Jul 2024 14:15:58 +0000
Message-ID: <CH0PR11MB5444B70BDA34EA77CBD6F886E5AD2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240719132748.3382266-1-lucas.demarchi@intel.com>
In-Reply-To: <20240719132748.3382266-1-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM4PR11MB5327:EE_
x-ms-office365-filtering-correlation-id: 20e230db-6918-49de-d4ca-08dca7fd4ffc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZkI5Q1JIRUtmVnI3L212RHdqc2hmdGM3SVkrN2VGSWlnU0lyaUZsVjJpSVNj?=
 =?utf-8?B?S2hGeHUzMnVISzFlU1ZXcHpCTnV1cnhqaHpnVmszL3JwNnl0MmhwcktSRW95?=
 =?utf-8?B?NUxSd2p0TUhOa1ZldnhUNS9GNE03clk5dDJYK21wVS9BRXpKU0lucHo1Smg5?=
 =?utf-8?B?Vk5MU1NNS1F4M25zZWZXMU5kRzN5RGFJaWM2V1JtQmo4VytIWE1zN3N0eURs?=
 =?utf-8?B?SkJZVGRmNjVKR2k4dTEyOUtPY1NxenJ0TWtQODd6WlBQLzRsRTdMWDgyQUsw?=
 =?utf-8?B?NTZYVGRFL1NRMFNWbEphVXNNMDQwVG9USis3c1VFTzlhSG9DQi9OSjB1cG9w?=
 =?utf-8?B?K0VzYWl5MHpHQ0lpN0FSc3EwR3FMVHJFOGlGR1ZsbmtobzdVQ0FxRzNPT0Jl?=
 =?utf-8?B?WDZVd0krSURLZWU1Qkc1dk5oYUtWYkRpTmh0YzdEeVpBU092SHJRa2lXM1Nv?=
 =?utf-8?B?Y08wYTJDL0lac0RqU084WmIwOE9rd3I1ZzBiL0NRZFZVWXdIWEkyeExTdkRD?=
 =?utf-8?B?cFU1YkxSUWJpNTRIZHBNZDFPSDFyTEhpYlBkSFZzTFBsR1h2bDU2WFdUbGFZ?=
 =?utf-8?B?WXBVdDNhb08yREs4Umd2NmxMNloxNGN6VFdtWTdzMmkyS29HalpqalYvLzMv?=
 =?utf-8?B?U2h1dm1IdWVFSE9hOHlVMnVxTExKNnhhTStEODVObUhQT0d5UG55QzhjaWVO?=
 =?utf-8?B?QzkzaVVTTnRFTWZIMzg4bm82ZDN6NFZBVVdjdmpQRXNsZ2swa2Nob09zQkNq?=
 =?utf-8?B?SVhQM0wvMWRONHovZjNKakcvTVRVWW5JWFF5YjB0TExqR0xMa0ZqZldxZjVj?=
 =?utf-8?B?NzJZeCtxYmtYaGU4bnVqNnNDT0x1QjdtZHVOSVIxRS9DUk9oT2hVaVV4Z1Fz?=
 =?utf-8?B?S3NjY1REV2NFYVRUdnRjZEVGWDlma2FGQlpnRjZ4cEozOGNKUksvL2NkQU03?=
 =?utf-8?B?MEEwZWFnZklFa3lSSTZQZkVTUTV6WkthRHRWV3VrY0VrbDA3cVNaeGt1ZklV?=
 =?utf-8?B?MmtnMk9HRnNNeG14QUZXaUQ3ZEp1N21RL1pxd1pYazhtNWRNRkRsWHVKdjMw?=
 =?utf-8?B?YllYU3prWmpBdnVjQXl4ejVXMWs2MXJ3aVJxRlFZemQ3VUhwUmlxUkRSWG9F?=
 =?utf-8?B?dmNuVkp6MlJRQnFLTGg0OEhvTEZGOEtJdVdtOHlsbWhjZnVQMTRaVUN1U3BL?=
 =?utf-8?B?TGVkL2RsYjZtWVdWV3Jia3FwRWlKTWMwWG51THFuWnZxd2JMSmpOek5HZ2hi?=
 =?utf-8?B?bjBiZmhlWnRzR0JBRDYyTnJNK1RkdjVQendQcytwOWNnMnBud1F5ZmdsWllW?=
 =?utf-8?B?SkZFQVVtYlRRVWNpZ3BoeTVreTV3dzRpL0FJbnBCemozRk5BbGlqZDJzYThK?=
 =?utf-8?B?Z2JSaFdYVXp5Nlhlb0gzS0laSUdBYk81SzFERWo2ZE9zWDFZQndQQmtsOEk4?=
 =?utf-8?B?czByQWh2U1ZQK2NYeU1iR1pEVXp4M0tTWnloRG1hTHJ5dkhXOVVjcVFod3lG?=
 =?utf-8?B?bS9XYnF4NUp1Q1hJSlAwN1BxRnhvbzVmdVdYUHd6aStteW5oZmVhUkg5OVRZ?=
 =?utf-8?B?SU5ZcE0wMUExRlJMNmtRWllsWTcralVmU1lwcTRUR3FvTFFpQUphUEdpVkkx?=
 =?utf-8?B?NTZGTVBTekhra0F2ZHFuazltcjFjKytob2NxcmRVc0hBd0hPMW1yTXpESkow?=
 =?utf-8?B?YUhLamJaTDFsN0dzYllHcGo5aFkva3BwN0w1V2NadmhjUkMwa1Uvb1YxMFpQ?=
 =?utf-8?B?ZFljZ28yQUlJeUFJdzdlQUNqVVdTNWZYRXdkcXhZb2s3K0w3YlpKSnZsMk8z?=
 =?utf-8?B?ZnFwTVBwa0orMGtmdXk4WEdUYVNtK3NHWE9RSjVlekl5ODlRV2twMTZKY1l2?=
 =?utf-8?B?cmxMTlF1emswZ0ZqVXpkcFJmTUgyQ3NxU3B2TjRqSUlpVFE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3pzZEc2bnJxZDgzZDA5Vzk0WnM0MjZwaGxHUVcyWWNVWDZDcytSRHBEUXk4?=
 =?utf-8?B?a3RoeFJ3dmRjYVpvTGw0YmlCSWtrc2M5OFBBZW02anNXN3Q4Y25HTW4wZnlr?=
 =?utf-8?B?NWpROWN5OVFhUDh6SEZUaTI0VEp4bXlRRmJhMXFCZkR6ZndiM3VvWTl1N21s?=
 =?utf-8?B?N2s5Y1JwN0g3aEdFYWhFeE85Vis5UlNFYnVWZXdYL1RTejg3eHZnZUJRQ3JF?=
 =?utf-8?B?TTBoQkloeGlkVGwxT09YUUdubTdRY3VzNzFjVzY0QmV2T0I1blZKalpOZmdE?=
 =?utf-8?B?WXova0tVdXRPQmJtenkvZ3FDc1R3T0pzcGhwTXd1azJTQm11YWVpdCtBYmxq?=
 =?utf-8?B?L0lJalg4Tk0rVXpjNWRrVmhueDhoOEY2c2VTTUlPMW9xOWo3QTZhOU4rcTNL?=
 =?utf-8?B?cEE3bnA3emFnV29RMkMwdGVLcXM5WjRCdlhpVXJLWnRJM1U0Wnd0NVBVWno3?=
 =?utf-8?B?NkZUV1pPdm1BYUYvdEhabHE4UEZyRENLRlNtWDlqWHFXVzlXbEFBYUphOXNr?=
 =?utf-8?B?SmVmR3lhUFhyNkptMkNWcStrc0hpRStjZHlBUWhUaEpoMTRaVUUrSDFIZFph?=
 =?utf-8?B?RWoxRmdQZ21jQ0VFZTBYMXFzSmk3VVRKMS9PdjJIVkVaaXFsWmZ2ZnVURlo3?=
 =?utf-8?B?VktLcXR3MzRERTlmM1dzNW41SnBJZkhpRExTd1ZBVHVlQ1FGWUF6K2VoOWJO?=
 =?utf-8?B?eFFiVGp0RHBGS1VjVGNmUVl1bnZjc3dKdytxNE5Ybmo1Y0gzdDJJSTRydzJG?=
 =?utf-8?B?Y2lEUGw1QUROMVdMZEoxMzVvSzdOcWp3TTlUMWE2Wlg4ZEhtQlVmUUVVTXNq?=
 =?utf-8?B?N1o1WFVPQVlEZkRoUlR4OG5RSXFqSW1iMXpEbnhWeTE5ejlEYkdlamlpYlIx?=
 =?utf-8?B?YStPS3BkbUhPYUFUMW92WUk0RmVNL01ZZ3pFMnA2MkdFSGxkbHVqWldXR01R?=
 =?utf-8?B?b2JEcnFINVgwaSswcWZhc3JIZmQzbWJjeUpnMUt5RTRlZHg2OU1SUlVQTkFx?=
 =?utf-8?B?ZzlDKzV2clY2RHVLSnhUejFqTTIyWndycWF4T3Z0TWhaRDVGcFNiTjJDM3hl?=
 =?utf-8?B?K1FKUmg0c1hJOXJlRG1RYnU0WVNMcFBmWWk4S25iUENqUzF1dkdzTzFUekM4?=
 =?utf-8?B?dHJaTlhsRnB6SytMenlSNmhEMjFQdHI2MFM1ck5RQnlHRzIzT3NEVnE2ajVB?=
 =?utf-8?B?ZTY4Z3JkZGRhbkRlSGVVK1VTT2dSd2JSajhzS3EyOEZvNEUwU2NOWEtHTWFv?=
 =?utf-8?B?QWw2dTRoSXR2T3pHMU5pQWx0dzBQMm1nZVRiRmdSK0Y4ZGo3dzl1VnJRK3B1?=
 =?utf-8?B?TVd1VmpPeG9KY0t1SjJZcG40bzRnOXhZYXhvVUxkZHViRDBYZ2NVclZvSk1Q?=
 =?utf-8?B?TCtqT2l0dmFJeWora2d0aFNEdnZUTTlrWkZWTTVEWkRBNUlGdTNTWExQdUFN?=
 =?utf-8?B?QVU2YThtbzhBOE1HeW9ac1RNbUkrbWdHWkpOb2hNbkkyaEdVa1hpbG9VOG4y?=
 =?utf-8?B?V3hEY2M3bE9kMGhpbTFsd0U4OGtBbit5c1ZDeHFaaE04OWdiNXhZaXJBb0l4?=
 =?utf-8?B?L2l6Sjg0NTROai85N2NPZmMxbHozbDFaeVMzNDhxdURqVzhpM2dra3BjNnFj?=
 =?utf-8?B?OE14L2kybjZpeXgyTlRjU0NnQmlUaWRqUXVBZng4U1E2R2lRVndtczR1TUFZ?=
 =?utf-8?B?bWJYUmxlcFUvNWxDYTJGWUxPNzE1RG0zNTNTZVJkODVFTHlLN0N5cm1vWnhV?=
 =?utf-8?B?dSsrT2FsZWRvQmxzNlhRYkNsVGNDTFZBdFdNaHFOZnJQVTAzNW40UVZhOUMy?=
 =?utf-8?B?WXJDRXJNQlFUVHdHODZBRk1ET2VaOXJhRTUvUzZTemRoallOZ1RPTTVOOVM0?=
 =?utf-8?B?NEpkbEhUWmxIQ1ZKVGN6WnVNNHc0MDA4KzBEUVVBM0pPYlNielc5VTUwMTlW?=
 =?utf-8?B?RlVHNGVreWNpQllSMG11WEpzTndVT2NxdzZzY3hJcjF1Y2pFNUpocC9QbENK?=
 =?utf-8?B?UEZCMVNGNUU3NW1KZ2pKcm1FempFTVMrN2FvOUxIQlE2WVdwYUh0YUVMMnkr?=
 =?utf-8?B?QWNtWFc0bWhiS3M5TFB2bUNPYW5CaXp0czE1bGJmVHp4aTQrZXlnTktqeGx3?=
 =?utf-8?Q?tf8Ap2lzb42/m5iTrz6rk/xbF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e230db-6918-49de-d4ca-08dca7fd4ffc
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2024 14:15:59.0107 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DzpUVmUhUvRMUtIFQXBT+mutWCvH9DZ14DRXk8652vbBKOqGu+65CF2reAsBkB2skQZwwT2H26S9fYjdvG/i4ldF53ZrJka5c1NA1Yrr/po=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5327
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGlndC1kZXYgPGlndC1kZXYtYm91bmNl
c0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBMdWNhcyBEZSBNYXJjaGkNClNl
bnQ6IEZyaWRheSwgSnVseSAxOSwgMjAyNCA2OjI4IEFNDQpUbzogaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCkNjOiBEZSBNYXJjaGksIEx1Y2FzIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5j
b20+DQpTdWJqZWN0OiBbUEFUQ0ggaS1nLXQgMS8yXSBkcm0tdWFwaS94ZTogU3luYyB3aXRoIHRv
cG9sb2d5IHF1ZXJ5IHVhcGkgdXBkYXRlcw0KPiANCj4gQWxpZ24gd2l0aCBrZXJuZWwgY29tbWl0
IDcxMDhiNGE1ODljZCAoImRybS94ZS91YXBpOiBFeHBvc2UgU0lNRDE2IEVVDQo+IG1hc2sgaW4g
dG9wb2xvZ3kgcXVlcnkiKSB3aGljaCBhZGRzIG9uZSBpdGVtIHRvIHRvcG9sb2d5IHF1ZXJ5Lg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRl
bC5jb20+DQoNCkFzaWRlIGZyb20gYWRkaW5nIHRoZSBEUk1fWEVfVE9QT19TSU1EMTZfRVVfUEVS
X0RTUyBtYXNrDQp0eXBlLCBzZWVtcyB0byBiZSBtb3N0bHkgYSBjaGFuZ2UgdG8gdGhlIHZhcmlv
dXMgY29tbWVudHMuICBObw0KY29tcGxhaW50cy4NCg0KUmV2aWV3ZWQtYnk6IEpvbmF0aGFuIENh
dml0dCA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT4NCi1Kb25hdGhhbiBDYXZpdHQNCg0KPiAt
LS0NCj4gIGluY2x1ZGUvZHJtLXVhcGkveGVfZHJtLmggfCAyNiArKysrKysrKysrKysrKysrKysr
Ky0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0tdWFwaS94ZV9kcm0uaCBiL2luY2x1
ZGUvZHJtLXVhcGkveGVfZHJtLmgNCj4gaW5kZXggM2JhYjNmZGFhLi4yOTQyNWQ3ZmQgMTAwNjQ0
DQo+IC0tLSBhL2luY2x1ZGUvZHJtLXVhcGkveGVfZHJtLmgNCj4gKysrIGIvaW5jbHVkZS9kcm0t
dWFwaS94ZV9kcm0uaA0KPiBAQCAtMyw4ICszLDggQEANCj4gICAqIENvcHlyaWdodCDCqSAyMDIz
IEludGVsIENvcnBvcmF0aW9uDQo+ICAgKi8NCj4gIA0KPiAtI2lmbmRlZiBfWEVfRFJNX0hfDQo+
IC0jZGVmaW5lIF9YRV9EUk1fSF8NCj4gKyNpZm5kZWYgX1VBUElfWEVfRFJNX0hfDQo+ICsjZGVm
aW5lIF9VQVBJX1hFX0RSTV9IXw0KPiAgDQo+ICAjaW5jbHVkZSAiZHJtLmgiDQo+ICANCj4gQEAg
LTEzNCw3ICsxMzQsNyBAQCBleHRlcm4gIkMiIHsNCj4gICAqIHJlZGVmaW5lIHRoZSBpbnRlcmZh
Y2UgbW9yZSBlYXNpbHkgdGhhbiBhbiBldmVyIGdyb3dpbmcgc3RydWN0IG9mDQo+ICAgKiBpbmNy
ZWFzaW5nIGNvbXBsZXhpdHksIGFuZCBmb3IgbGFyZ2UgcGFydHMgb2YgdGhhdCBpbnRlcmZhY2Ug
dG8gYmUNCj4gICAqIGVudGlyZWx5IG9wdGlvbmFsLiBUaGUgZG93bnNpZGUgaXMgbW9yZSBwb2lu
dGVyIGNoYXNpbmc7IGNoYXNpbmcgYWNyb3NzDQo+IC0gKiB0aGUgYm91bmRhcnkgd2l0aCBwb2lu
dGVycyBlbmNhcHN1bGF0ZWQgaW5zaWRlIHU2NC4NCj4gKyAqIHRoZSBfX3VzZXIgYm91bmRhcnkg
d2l0aCBwb2ludGVycyBlbmNhcHN1bGF0ZWQgaW5zaWRlIHU2NC4NCj4gICAqDQo+ICAgKiBFeGFt
cGxlIGNoYWluaW5nOg0KPiAgICoNCj4gQEAgLTUxNyw3ICs1MTcsMTQgQEAgc3RydWN0IGRybV94
ZV9xdWVyeV9ndF9saXN0IHsNCj4gICAqICAgIGF2YWlsYWJsZSBwZXIgRHVhbCBTdWIgU2xpY2Vz
IChEU1MpLiBGb3IgZXhhbXBsZSBhIHF1ZXJ5IHJlc3BvbnNlDQo+ICAgKiAgICBjb250YWluaW5n
IHRoZSBmb2xsb3dpbmcgaW4gbWFzazoNCj4gICAqICAgIGBgRVVfUEVSX0RTUyAgICBmZiBmZiAw
MCAwMCAwMCAwMCAwMCAwMGBgDQo+IC0gKiAgICBtZWFucyBlYWNoIERTUyBoYXMgMTYgRVUuDQo+
ICsgKiAgICBtZWFucyBlYWNoIERTUyBoYXMgMTYgU0lNRDggRVVzLiBUaGlzIHR5cGUgbWF5IGJl
IG9taXR0ZWQgaWYgZGV2aWNlDQo+ICsgKiAgICBkb2Vzbid0IGhhdmUgU0lNRDggRVVzLg0KPiAr
ICogIC0gJURSTV9YRV9UT1BPX1NJTUQxNl9FVV9QRVJfRFNTIC0gVG8gcXVlcnkgdGhlIG1hc2sg
b2YgU0lNRDE2IEV4ZWN1dGlvbg0KPiArICogICAgVW5pdHMgKEVVKSBhdmFpbGFibGUgcGVyIER1
YWwgU3ViIFNsaWNlcyAoRFNTKS4gRm9yIGV4YW1wbGUgYSBxdWVyeQ0KPiArICogICAgcmVzcG9u
c2UgY29udGFpbmluZyB0aGUgZm9sbG93aW5nIGluIG1hc2s6DQo+ICsgKiAgICBgYFNJTUQxNl9F
VV9QRVJfRFNTICAgIGZmIGZmIDAwIDAwIDAwIDAwIDAwIDAwYGANCj4gKyAqICAgIG1lYW5zIGVh
Y2ggRFNTIGhhcyAxNiBTSU1EMTYgRVVzLiBUaGlzIHR5cGUgbWF5IGJlIG9taXR0ZWQgaWYgZGV2
aWNlDQo+ICsgKiAgICBkb2Vzbid0IGhhdmUgU0lNRDE2IEVVcy4NCj4gICAqLw0KPiAgc3RydWN0
IGRybV94ZV9xdWVyeV90b3BvbG9neV9tYXNrIHsNCj4gIAkvKiogQGd0X2lkOiBHVCBJRCB0aGUg
bWFzayBpcyBhc3NvY2lhdGVkIHdpdGggKi8NCj4gQEAgLTUyNyw2ICs1MzQsNyBAQCBzdHJ1Y3Qg
ZHJtX3hlX3F1ZXJ5X3RvcG9sb2d5X21hc2sgew0KPiAgI2RlZmluZSBEUk1fWEVfVE9QT19EU1Nf
Q09NUFVURQkJMg0KPiAgI2RlZmluZSBEUk1fWEVfVE9QT19MM19CQU5LCQkzDQo+ICAjZGVmaW5l
IERSTV9YRV9UT1BPX0VVX1BFUl9EU1MJCTQNCj4gKyNkZWZpbmUgRFJNX1hFX1RPUE9fU0lNRDE2
X0VVX1BFUl9EU1MJNQ0KPiAgCS8qKiBAdHlwZTogdHlwZSBvZiBtYXNrICovDQo+ICAJX191MTYg
dHlwZTsNCj4gIA0KPiBAQCAtNzgzLDcgKzc5MSwxMyBAQCBzdHJ1Y3QgZHJtX3hlX2dlbV9jcmVh
dGUgew0KPiAgI2RlZmluZSBEUk1fWEVfR0VNX0NQVV9DQUNISU5HX1dDICAgICAgICAgICAgICAg
ICAgICAgIDINCj4gIAkvKioNCj4gIAkgKiBAY3B1X2NhY2hpbmc6IFRoZSBDUFUgY2FjaGluZyBt
b2RlIHRvIHNlbGVjdCBmb3IgdGhpcyBvYmplY3QuIElmDQo+IC0JICogbW1hcGluZyB0aGUgb2Jq
ZWN0IHRoZSBtb2RlIHNlbGVjdGVkIGhlcmUgd2lsbCBhbHNvIGJlIHVzZWQuDQo+ICsJICogbW1h
cGluZyB0aGUgb2JqZWN0IHRoZSBtb2RlIHNlbGVjdGVkIGhlcmUgd2lsbCBhbHNvIGJlIHVzZWQu
IFRoZQ0KPiArCSAqIGV4Y2VwdGlvbiBpcyB3aGVuIG1hcHBpbmcgc3lzdGVtIG1lbW9yeSAoaW5j
bHVkaW5nIGRhdGEgZXZpY3RlZA0KPiArCSAqIHRvIHN5c3RlbSkgb24gZGlzY3JldGUgR1BVcy4g
VGhlIGNhY2hpbmcgbW9kZSBzZWxlY3RlZCB3aWxsDQo+ICsJICogdGhlbiBiZSBvdmVycmlkZGVu
IHRvIERSTV9YRV9HRU1fQ1BVX0NBQ0hJTkdfV0IsIGFuZCBjb2hlcmVuY3kNCj4gKwkgKiBiZXR3
ZWVuIEdQVS0gYW5kIENQVSBpcyBndWFyYW50ZWVkLiBUaGUgY2FjaGluZyBtb2RlIG9mDQo+ICsJ
ICogZXhpc3RpbmcgQ1BVLW1hcHBpbmdzIHdpbGwgYmUgdXBkYXRlZCB0cmFuc3BhcmVudGx5IHRv
DQo+ICsJICogdXNlci1zcGFjZSBjbGllbnRzLg0KPiAgCSAqLw0KPiAgCV9fdTE2IGNwdV9jYWNo
aW5nOw0KPiAgCS8qKiBAcGFkOiBNQlogKi8NCj4gQEAgLTE2ODQsNCArMTY5OCw0IEBAIHN0cnVj
dCBkcm1feGVfb2Ffc3RyZWFtX2luZm8gew0KPiAgfQ0KPiAgI2VuZGlmDQo+ICANCj4gLSNlbmRp
ZiAvKiBfWEVfRFJNX0hfICovDQo+ICsjZW5kaWYgLyogX1VBUElfWEVfRFJNX0hfICovDQo+IC0t
IA0KPiAyLjQzLjANCj4gDQo+IA0K
