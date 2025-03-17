Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04519C28B28
	for <igt-dev@archiver.kernel.org>; Mon, 17 Mar 2025 11:10:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E8C10E0FB;
	Mon, 17 Mar 2025 11:10:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IjEito/u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B16710E0FB
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Mar 2025 11:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742209822; x=1773745822;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NvrUGk2TVTBXKMToNgYm4byAxUSkYb/+rr09sYKHT0k=;
 b=IjEito/u9Gid8l/8EF/r/By5GCcefhRBTjx7eW6801c1xjUHgdLec9IG
 N/wblNvPbghDl8ZG9rIjiWcFFivasSmbJESOmtPztrRW21kQbU7drXuMG
 eitD4rTCdeWoRxFVpkuxzUxi1Xfnt1wImEs9vSfaHwvYyusSTBWfibFbp
 2961Y/5PA06phBeP9nNJqRjRbmkrlO6TQxoLVsPTRgkmiZagGZ8uPPJnr
 A0QgbaFhiCJz3HSvTS0V46eMiiTaDXduhp5FHrn1mQv+zPRu4EdrtRV3m
 /TWEKoHxwrmriS310Mc8SqOZMCFAHV/Q6VCmAz067vbAAjAoB80B+9bMg Q==;
X-CSE-ConnectionGUID: EB3wBXxiQqqmLdTAUf9BPg==
X-CSE-MsgGUID: +kwAwpZQRzeGEB9oonoQ9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="47074161"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="47074161"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 04:10:19 -0700
X-CSE-ConnectionGUID: v8eUozw9SDePRRUeFHDm9g==
X-CSE-MsgGUID: SJbRNgQYQzSua8FJ09N+hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="126989539"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 04:10:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 17 Mar 2025 04:10:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Mar 2025 04:10:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Mar 2025 04:10:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VMdhGhkPpEKsIjwc+MGZ71AvctdvQVs8tugYiTgsF0kq3CmIFeZtCDYiUE8W/H9yybjTg6nCv+Vkoe4EfUi9lEftaCXOvOuIkeUcto1C8Y67sNnG5sqK1uoa0hglvydhsQlA+e1NSFOppSOysjPR1PBs9Smms8JzZyIOg0+r4J6GHdltsUIlQJMndlhc/81t67U+5Hz9jW+Nc3ShMJkGZLxVtGfM/q701vxLVcgKlUqMGRYdPjpni2BcefTAffReTwaYVzIpBmLPKdUryJdMw+clysCDNuwpgZIf251MFpl4/2BU9WNlfUNZddtvFiJhXtKMqLKjUitP6twQBetYtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=deSC4yLrUMRuoWHXe0q8rfaD+9EI6paivbnF8CLSm3U=;
 b=A1otzi+NIT02g265LMafhDDXX4NMWu1ArojFCXatTJrb0JUpeOon138l3CIFbFfCbLwDNhsO86QjgKkGsMNKXx8XP4K9MZ7unRfRxkY8Q18L6YZcQFS3YU8N3Z5Rt6Z+ky3YhqTOM9d38pQcNh7kdAYsmMCfNKeUQnSs9ikowLf7hP7U1WT6jpBdEy2a3pJnP2AVSwpNFaPWm+UMumK0rKrjVKI6AzOQBiJPz79SAX2PHwxw1SXb7tJD/AO/CyVapVQgbcOF/8IbaPAhN940j1CyigHP45BPRRswbkcAPjktoaBn7vpmMYRksoai+tpUL/KhZ0auO+iQhfy2jp/6ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 DM3PR11MB8759.namprd11.prod.outlook.com (2603:10b6:8:1ac::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.33; Mon, 17 Mar 2025 11:10:16 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 11:10:16 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Mika Kuoppala <mika.kuoppala@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH i-g-t] lib/igt_core: reinitialize log_buffer_mutex in
 child process
Thread-Topic: [PATCH i-g-t] lib/igt_core: reinitialize log_buffer_mutex in
 child process
Thread-Index: AQHblys9OH29+2tWfUK823H4+oB9srN3KX4A
Date: Mon, 17 Mar 2025 11:10:16 +0000
Message-ID: <DS0PR11MB7264B0C7AD4FC97849F24E12D9DF2@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20250317105610.556587-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20250317105610.556587-1-zbigniew.kempczynski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|DM3PR11MB8759:EE_
x-ms-office365-filtering-correlation-id: 5fd2ec6a-f503-4f5d-d93b-08dd65444c0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?+pNhlzSADRzR8xEXviriJQVODWaaCehpFfmzaafi4tM3KWTekJjCUpSrxr?=
 =?iso-8859-2?Q?opzMcgAhPZjlb37dT6EcAiwtwfifOxnAInSBYtccgR8y3IHI9zY4Xx21LC?=
 =?iso-8859-2?Q?K4e4VtEvgKhh6anIFoQ0unOH3U3zTg2la811CIotshtQiI8xIeWaBr5b8J?=
 =?iso-8859-2?Q?eosrz+fjY6bYyjf/PktBfG704zH5WkYss9ZhQM8LWMTlh9gWbwilps56JQ?=
 =?iso-8859-2?Q?OMIYzC1sm8KIQym7nyWKfJEhDKWOBCF3s9pe/kN9EgTHFtGOzOPlc7VRAg?=
 =?iso-8859-2?Q?ACiTmPJTLM7H4lYacJ4ktKGRr7rSEI0MA+my4JxM0rzY1xAvPvjmdpOWDS?=
 =?iso-8859-2?Q?N6E+IVK1+THlNMaLOOiC4KYpIz10tAHyq4UWx6NdvwmE6S0QnXV8KJV2RB?=
 =?iso-8859-2?Q?2wZEJY4HskUzXJHjcFGP6bJ0OKJ+WlBW7p35hBWmGeGVHREZl9eIz5FYmE?=
 =?iso-8859-2?Q?lom+Xw/4qfuCGDh5vgeN/RytMuOMydP5XRc07RWZ02hgkDJ281x/5P5X0n?=
 =?iso-8859-2?Q?EwKkJlGq1XoMEeGmmVpuifYhhnGYZc2SCfg7leSwKAUvImG57KOfPtvWQ6?=
 =?iso-8859-2?Q?XQ2y+oKRCmUMDzSCof/Qb28SMi49oXQULTE6Hu5WM9vA3NLCjJ0q1S0LZe?=
 =?iso-8859-2?Q?oxHAgAylYNohDETYk4goDZHlTRrgsL/dNFervt/anMgJ2zGL5A3+kZFxh2?=
 =?iso-8859-2?Q?dZW+jLxK6MgIuvlfyghQRAW8SDbGScoJNlBs3IZ7cVrds7JiHT/xDrkC4l?=
 =?iso-8859-2?Q?lTfTgBeXZylzRUCYMorHwbQ2WYhAwV1NNpfmBpWsIjLnorAhDx1BaOwZeQ?=
 =?iso-8859-2?Q?yPJ+DxOA8/crBDXLP90v5q7GhObL93LU1Bw17upLLW1yPX6q+nOVvRr0nN?=
 =?iso-8859-2?Q?kLM+1+nmKvK0pGXatN3fOLvos8WlvOYe/H6+92cY6/WYpLfmfMdExhvc6b?=
 =?iso-8859-2?Q?M2hVuL0DonctUiJUI0Ces8Y/9wQ2IVXiFIPfEyEF1HAIqeiiEvNofLm7II?=
 =?iso-8859-2?Q?uUVNLR8wJk9XfVZGA8Dqqe3JJM54l11uyq69am5gD1Tj18qruwfjYb1tIW?=
 =?iso-8859-2?Q?r0kBy3y6yFZw/ufTNnzw0bkW1cMwqxCQMNJzYk7fhUgaxGhY7Sb4fMcHQz?=
 =?iso-8859-2?Q?+AGavPns0PN3bvFgkEkUhPwScJ5qRZ83K0ge3YiXWcVMId8yr06yVwOMzC?=
 =?iso-8859-2?Q?N8wmiD0fzxSwpKffhHhGNxZpTUrdpnJRcAgGuy6vb2F2e0BtZICgMtLnnR?=
 =?iso-8859-2?Q?y0JulbvCxW1bjnCOgp8OVVghqtUzXs6I3xDHFLszLi/vwFfs4P980ajIiL?=
 =?iso-8859-2?Q?b/3MC34kfPcK+vrE1V5KEvX+KSNbKKpKoFJxgpr9gqCCNektLCWNB1smcv?=
 =?iso-8859-2?Q?+dpUT55rNKQXsH3KIeIXD3KRdkWYtgvt/qwW2hcOnd7jE3YUcem01hDBPM?=
 =?iso-8859-2?Q?hu6q6TKTeUrg69TjYWWYAN9ipI7FESTO1WinHKACAhfRNDutfgqYQ/dfST?=
 =?iso-8859-2?Q?dXM9OGYlqiPpUyBqEGESCK?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?2+HBVkhK0s/doY1vJWePQoiElpukEhs/Oa+ggbQl0vEbPNU4Jfr/KZX61P?=
 =?iso-8859-2?Q?cO2Kjcz1zadP+qLFKnTOiGrG+99MhGbEp9xsdlvpnfs/T57eUZgnyqgxpR?=
 =?iso-8859-2?Q?LcR751JRqyZAe//B4GRJfBbd8gs+2ivstc9m5Xs5m/GMA6I4Xy2ab9/nq+?=
 =?iso-8859-2?Q?URH8V3mzg2qvjkYoeDoL+AhixEwBN+evF7Uqj7z9iwRM5zbVPBFtpvkPuO?=
 =?iso-8859-2?Q?6XXDNRUcbaGcOD5Sa/hf36rNN3VNUanYcuyV5ymK5wGHb+gRyxsnQ93lZJ?=
 =?iso-8859-2?Q?DuRpcpBv3cNOMuwxTlvUgfDyk9pw0UeKQ94HNVFFud81mdYdvLjAJoomub?=
 =?iso-8859-2?Q?VAYCSq2TVx+K0i3GytkTkK4E4e65jW/HDwMwpXoFEPD9++iBPU/Z2Xbx2u?=
 =?iso-8859-2?Q?L7Tw3lQ9mgq/EvC19dwPJOytrfk4uqjmBFINqRPF0qWuwBIH2Xj+lUUZU5?=
 =?iso-8859-2?Q?u182rKRikLpWf2ZP1Q62gcc6LtEutS10bZed7dffRhEIia0yc1ZXu83xwy?=
 =?iso-8859-2?Q?ImKSYl+xfqPnyZ8ShVjxi9ob3Y2GtK0fMcbPi/HVQpeDkHAnVJaoFl+r5m?=
 =?iso-8859-2?Q?2oKOyjL9438kVzpBvE2iGRVMx6dP9PSfgKzq5anfwM2mDlLrO2lWCAlMMi?=
 =?iso-8859-2?Q?GpvOvtsRDw4ZqWMAKC9JrpF+UykYGUi0Yn542EI2n3p/aF47de7YHxNCZT?=
 =?iso-8859-2?Q?Xq0ErUqYEmgE+eO40JJ9cLNfDhBQceI3m8WZnSxvE19pmGQq8ZYl4CG9QN?=
 =?iso-8859-2?Q?t6ChZgOOScdNT2rnE50AgkiwAYB5auE6zubfkHifHI7e2QR6SkVXT+Ezpn?=
 =?iso-8859-2?Q?X5Jb3khPcsbyNl7g3GQRy83c70UPcs8DjoVa3yRVpmWDSbdEX6+nhBhyB2?=
 =?iso-8859-2?Q?7WneFf9W8e7OyxupV6AH3n56o6S6yRxl/WrzWNv/xYZPKiAocOOnQgT89Z?=
 =?iso-8859-2?Q?JKybQ+kPikNGXcvUYtmFaa0UNFQWu3qDeyjFogVZE2r14gXxMxiZYPihde?=
 =?iso-8859-2?Q?Q6R37lqLZRASh3fvHf1bup/jIgRgE7zBA9DFBzwLUPcmw9btjX6l5h19Em?=
 =?iso-8859-2?Q?CN5SdYSixNgSVTcw39NRPTVdbPjAaXlD2898FYT5d6JGTWtaCg+6JNqle3?=
 =?iso-8859-2?Q?yo2elepXqX2lANUIBsceWM6tjh4FMdmA/0VrtiIRUOA8I883PH6QngK2vk?=
 =?iso-8859-2?Q?SLUxHCLY1B4PSIsGZWgPZfSJATA0yN8BNJc4tQ8/EdTwPQo/J7I+hwqK4J?=
 =?iso-8859-2?Q?opKLH/O/8n6RujGBpj8NxGcc2BTREEgWqF1ax9fqIo2EJwuisssjFjtC46?=
 =?iso-8859-2?Q?wS5XlqyGQH+FduBhPtNEAbek5I/fQGe/t8wR/ue+/LVoSSAbX5ijye2AK2?=
 =?iso-8859-2?Q?ngS4choo/y0L9ujubSL4XqJ7x+Wid/x0NFYeD2dQXD876EYGoI+/poOGFQ?=
 =?iso-8859-2?Q?xNMHqDig3p+Y/xJvx0JlK8lIUBYIAH/aM1JbPYWk3kfPARRMQKuducBEUJ?=
 =?iso-8859-2?Q?u/LY7GtYueh7F2uoc7/rzYujKc6TwHbjb/dgxBjl7zfHcahyBrVQJ98H2c?=
 =?iso-8859-2?Q?W8JBVB6ieLEYuox6yP1J9qqa31fnFR42mHLjWcHmmQ+TKr+iNaPvU4Nrkt?=
 =?iso-8859-2?Q?wTfb1nvHS5XdmuLeusSR75rSzpmrSQr9yxBaAP6iSlTBVy05kctW71CQ?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd2ec6a-f503-4f5d-d93b-08dd65444c0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2025 11:10:16.4211 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yaQQrw/z5XL6zEALcBMKs3puHZcILGPNFZgWZ/qRSq1QhgZZiL0YD1IpT9SvQlKUNuGm5HgYfOhtUZaCkxe7pFRCtFyO1k1c/8u3XIntRelBxGdFnJvWjeM9FueykotV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8759
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

Hi Zbigniew,

> -----Original Message-----
> From: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>
> Sent: Monday, March 17, 2025 11:56 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Mika
> Kuoppala <mika.kuoppala@linux.intel.com>; Piatkowski, Dominik Karol
> <dominik.karol.piatkowski@intel.com>; Kamil Konieczny
> <kamil.konieczny@linux.intel.com>
> Subject: [PATCH i-g-t] lib/igt_core: reinitialize log_buffer_mutex in chi=
ld process
>=20
> For multi-process scanario intel-allocator is dedicated thread which

Typo: scanario -> scenario

> handles clients (children processes) allocations. Main thread which
> spawns chilren may hit point of time where allocator thread locked

Typo: chilren -> children

Otherwise, neat fix.
Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> some mutex. One of it is log_buffer_mutex used in igt_log(). Children
> which would try to call igt_info/warn/debug() family will stuck as
> this mutex is already locked.
>=20
> Reinitialize this mutex in igt_fork() to avoid deadlocks in allocator
> scenarios.
>=20
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Cc: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Zbigniew Kempczy=F1ski <zbigniew.kempczynski@intel.com>
> ---
>  lib/igt_core.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 9702a94177..c19689a51e 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -2600,6 +2600,7 @@ bool __igt_fork(void)
>  		test_child =3D true;
>  		pthread_mutex_init(&print_mutex, NULL);
>  		pthread_mutex_init(&ahnd_map_mutex, NULL);
> +		pthread_mutex_init(&log_buffer_mutex, NULL);
>  		ahnd_map =3D igt_map_create(igt_map_hash_64,
> igt_map_equal_64);
>  		child_pid =3D getpid();
>  		child_tid =3D -1;
> --
> 2.34.1

