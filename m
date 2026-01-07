Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB422CF6BE4
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 06:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D79A10E562;
	Wed,  7 Jan 2026 06:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B39oogP3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE2D10E099
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 06:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767767077; x=1799303077;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z0l1v5jNS2Jc9LRQFvcVH7HttC4C6JR5/PWmX41iV5I=;
 b=B39oogP3Ay/cBKgeh3hJJjGI9kcYKvzvqcvGs/7cPummgh4Tj3lg0Gyk
 HYmsPukSHfCopNoUNovncAnnT58gENZQZXc9rJO0KFD28ycpFBvCATQG/
 RbLmJIn5YGI1E/CqhvT2yIAHLk7d+221IYtRR/nSfxMmUflu3eemA58vB
 c/zFVaOAjfZXNmmGtskjHEhIq53kIeHJmz+upsjXbU6/trIhhy8S2edsM
 /Ho5qmXBzBBk8BUafG+m7n5QHTsrUNi1+wqb15SMxV37ezfwHc2DmRE8l
 VUA8m46SJfyZfQArsH9W4lhtgycMPk85/tAmh/Fe9wKPoWicKEgUkwCg0 g==;
X-CSE-ConnectionGUID: ag5HygdsQVSh283kILsv+w==
X-CSE-MsgGUID: rLz8vGPORYma2Lwt/31bgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="91789420"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="91789420"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 22:24:36 -0800
X-CSE-ConnectionGUID: DJcviEr7STaDAGtf2XEjPQ==
X-CSE-MsgGUID: 4aB4jivQRjCzmbCQpksAFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="207900110"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 22:24:36 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 22:24:35 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 22:24:35 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.70)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 22:24:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ULNbimxiBK1G+XpAJA0JooQj0GgwD9/DhC+iYDpVvBt80ZFAi/FWLYdxXvHMU78q74cMDBGjoqr2c6tEvaCMn7SEykbnd6bvPumT7mvX9Bjc9rY+rJOu9BtHsoCqIuTVcRdmpEe/N+t5+E0t1x8zqeD/gA4n6dbdVUxzDoVuQ1hK1s49lMX+a1BUGUhigb+wy8Fj1qb+zjxlcKdCaVBbLktJLATp7Imy/vbOlZAGoAJlLZOMVwtyybeir03Xh5Cv89RxA56sSwxn+Gd9Fq8M7He6diPSjvgwKR7L/hvs+pDh8teFkE8kQuZ/6JaiFKjca7lSMnaDke/0jiULao1K1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9NJ9iKq+kU+KccyeSEi2nJk83Culjoxh7S4xQ5J0BjI=;
 b=JYhkjixYnAC7B0eXmbL4NrflQPdKxv9Dpp8WUZg1MQO7ad76/roD3/QB1n60Qli7CNL+QQM+XKjkf1L4uhzdVsEK+RTihs/rUc7XfU7Cf1lCrLqo0gue9D+u4D+BZfiPbH9Z2hLlVuDdY/wWA43YrOjTBBGsxwPXO9fARs7kYI6tOOMroGpjTzZ8LZM04Z/uiFnK3hl5q8SmVjJnLcCi/s9PYt5a/ktCYhzKOxEZgyRUqnoquEVLunjSChTFWxmphO7je2hTihecaG8VXdr/Q8CnwOnzPWGGhQZ9+V+QW3THvjDP3MNzubKx+dIsizoH9riQoEZxfnpEfZ19SDrhsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DS7PR11MB7886.namprd11.prod.outlook.com (2603:10b6:8:d8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 06:24:32 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 06:24:32 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 1/7] tests/intel/xe_exec_fault_mode: Add multi queue
 test support
Thread-Topic: [PATCH i-g-t 1/7] tests/intel/xe_exec_fault_mode: Add multi
 queue test support
Thread-Index: AQHccN90qSHcyFIbQ0qM4kwtIU4chLU8PTGAgAoc/iA=
Date: Wed, 7 Jan 2026 06:24:32 +0000
Message-ID: <CH3PR11MB84344798DB1E83E457CAAC798D84A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20251219120154.695287-1-priyanka.dandamudi@intel.com>
 <20251219120154.695287-2-priyanka.dandamudi@intel.com>
 <aVV_yaxXWCfYkc4r@nvishwa1-desk>
In-Reply-To: <aVV_yaxXWCfYkc4r@nvishwa1-desk>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DS7PR11MB7886:EE_
x-ms-office365-filtering-correlation-id: f4fa8f85-0dad-412c-7df4-08de4db56b98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?wYNDoBDHpFluADweWnTF+N0Kh/e5MGKdqmiPp08uuVtstoNWwiQQLBix4HxF?=
 =?us-ascii?Q?q9SEMMbHxlcJ6JMSeb/kQh6JpPQlqBRwx63BZtNGxYTNOuJI7Bvh1JaXJ6AN?=
 =?us-ascii?Q?vYpVPyczEa4JGs4vXpRmLw5pCNjGRYdo4laOGuCckuXnVyuszrSPtpyjN1Zu?=
 =?us-ascii?Q?rQt9Xgqz5p5WvfPIGa/NPqLzYHg9ADwVB/VpbCmloJDY6a+kvOGhKlEC77rE?=
 =?us-ascii?Q?Mh6FzdiufukQnet31eBKKUC+Lc0EdQMj7mITKmSUDNSrV4E8BO935GOaeseJ?=
 =?us-ascii?Q?E34lFNfHdD2hrp/DHnUpF4JZEsE0p6QJXYySIah+HB2ziYpfxhLHDXNCFPZE?=
 =?us-ascii?Q?bIavw0H56kxg2gZlATVm8ROBlx01wmcW7qKXDxJTbF8gIlN3NDmQ6iideCJJ?=
 =?us-ascii?Q?a2681gak65zx1q3/UXqwkctgcVUE4X4UBT/NE9aptkumNloZJaMhNIdmGqX1?=
 =?us-ascii?Q?hxKTBeWfXPpMepxO8oB5oZhkDYKIu3linCCypsrJvKQBxCAug2GNxrXnJuea?=
 =?us-ascii?Q?BnKBx5YTU8lVJhyZ0a1Fq2NM6IW/x2Vcei5yY7evYBCq/yNhYjFpWRbGgH7Y?=
 =?us-ascii?Q?7BzkMhRg7FzmmgGW2aCYJ8lU7N6OsswKYlZQj/tP9rqBAR3ecVqcSn1vwahP?=
 =?us-ascii?Q?gvRRFmOWVOdS7D+85Qzqi3wPsJos3nCpGSStnB+uLZ0PffkZFFMudlVRDk5c?=
 =?us-ascii?Q?Su6qqzxCfRJbx5lXAcfT+iljQeIAMz9vD/ozhsdDZVhOY9WfJdLwi8atB3Td?=
 =?us-ascii?Q?7zcUxxOmEaUSbKKRQjq7Ba45OpDfAhwu5ufPmaYy4qON2Y4i+urlTnKKmIS2?=
 =?us-ascii?Q?ZiyBRv8ZJa9W3yQ6TK2etdv2tFPkm9E7sT54toXSM01XANy3Q9pSYFhb/HRw?=
 =?us-ascii?Q?+RGRg6I828y997surDZGNgjN1xFsPph3MgYH1a0r/swbXYc1vaFbrxShLDrQ?=
 =?us-ascii?Q?dKDdaIvcXFC1AWKr2eohKRWP1CCDTzJGNFPQRk0lcm50iIhK7G9BB8XnygrF?=
 =?us-ascii?Q?7ROl1+/iSCfcGsjqxdBHrTIoIYh9WV1kFksyPuMYOmam1jIv3IgTmvzl2brJ?=
 =?us-ascii?Q?FpoQPa4YZcLt788HdJuivHLygviEWB3w3KKIWzWFQMVVuybH7mXfMOPSuHzN?=
 =?us-ascii?Q?55/vs7SafONEblfyUpl5Kmw/XbyY0QTb/msUU12OdIwGESYvPEwuRpZjivS4?=
 =?us-ascii?Q?4a9RokIzNOv+Wv50GZJmz4d6LoYc48qmnZ6F1j0eRg2PWHjkdLK1qIe/IYOw?=
 =?us-ascii?Q?ftKZF/5uIPPGB0Vwf2OeZFh4YhAohVo79KhQJZyRPjW+eTQbMfrTa+6OGeXl?=
 =?us-ascii?Q?lDX9p3n1pR/wZ2lkoM0yy8AYo+guSd2vihk+rqCXxoN2O9pDniYZrTqH/tAk?=
 =?us-ascii?Q?q8satSZXa5uJwBVztHTDbfLXBFrE/tiWd4TF2FK3AuTGNjmduvEYxtubkmVb?=
 =?us-ascii?Q?7phVSMqf6C1GNSORaT3uVOB1E5ufrPQVtjo5KfIHjeWfSdoXz6T6HOX+764Q?=
 =?us-ascii?Q?70D8GZ70yuJTcLPBq24yLs2fOb6LOIOzau4w?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8KjW3g1PBvq/kVpLnStH+JVlfLhXoYQ8Sp5c8XFfxjcsjHlN/NuAweCpDWT0?=
 =?us-ascii?Q?aOydzUIPs0G/v1JBpn5b043XMBcc2/xUtGdqNwlHHA5W3SB7qRPlvcVUv1V/?=
 =?us-ascii?Q?eJrbffwxITPAy7hddsNip/avVUdl0HCdBCGeAmPafMG4DKXsO5CA2/qptjKX?=
 =?us-ascii?Q?MGkJ1hWr3nva3OjimQKj9AI4Vx56q6xP4VzKTWsGYD9oh/53DH6J804LtFER?=
 =?us-ascii?Q?0cEzsijOS6SfF7+AUoappcsAIhk7GyOw9OTJQCLGdcmYiHIalzdWc8znq8x9?=
 =?us-ascii?Q?2srdrqDNhDWoRO2zrdrVMV1fm9/Pf8RnXdmbFCXYrV3ls+79iC2wfTsU4Pnu?=
 =?us-ascii?Q?cn+zkS5Ghndjrg/Fm2QNfySXCDeH9O9MV/Np6TJY6DD6rRTR3K68fyo0GkO7?=
 =?us-ascii?Q?No+0cLjdppMvzJzTceI33xBr3xdrK9VJws5mJQGgbimsWcAmRdSZ9ma54ARJ?=
 =?us-ascii?Q?TFwzsGHZDDt5i8z6c9zwKny31KzCSa22kcLV5QxkkC7PzAn61uh/leM5Tbtv?=
 =?us-ascii?Q?8bcXOzd62emQGHrgVwX6es/xsPStWounvWB8taqNZtkqpNPCQysopo1lynfY?=
 =?us-ascii?Q?8eQoPafoYQV/7DOLaujTC7Bm6Fomp5kxLUZY6g1b+Djj6pcl4vl5nyGcvEak?=
 =?us-ascii?Q?R/ai7Jq7mC0qFw5gfkHKbHe5Fx1+cZh1E0YtbUjhn3eB9lsPR/P74aZ6Dx35?=
 =?us-ascii?Q?VjpvWNcU/y8NUFc/mHbyvPqaO0HghtZWQdAq6YwXce8fHLYnx5tRqw69gEQj?=
 =?us-ascii?Q?t65yT67hYgt/lQ+gcV0i1ulYvyptkQFWlH7d3pf1YakzgyBMTELoyI4FOB/n?=
 =?us-ascii?Q?ypirOmZR6cdlqeNA+rm1JapqtjrqB0qVpBGW7CGFl/KWEj6K+9TZFOek3SMZ?=
 =?us-ascii?Q?tWrNwWUah04PCmPAG3Hm48lZJxHVDPz7+2cXGlrsIQZLuKK+pMuq4UOD6mo6?=
 =?us-ascii?Q?tOZxiunvyLQ6RkimaecdwnP8tJGu+hUP03LpbrRBfrBHqIZlboTib8dOkva6?=
 =?us-ascii?Q?I2iSqD4JA4RuWKy36kntMoDQXMTzc39/Dmk/voT6j9UnexjfDElMwScEYZPq?=
 =?us-ascii?Q?tJBmiHrVZ+Z1DiZ/cGgdm+C3iC/zSiNMGBmruqeByQU/dPS1i3NBr7Fe9LS2?=
 =?us-ascii?Q?0Ff10rxG96dZ/qMAPQuyBMmi14H7VhhqlrEBBoJERWBqWYwARYFXfVyhd4j6?=
 =?us-ascii?Q?/2EHt33yRMWsgX/ZOXAClWKC2shxbXiFXvCcPhl0mT//xC5yyCwgZxZ2ug/K?=
 =?us-ascii?Q?4kGaxLTGsiQV0GaGrqXzQ2vnYE3Cts8LfEl4wvAxOZ2o54cXcZnIweTko1Lk?=
 =?us-ascii?Q?4iypr5d1pBoieucCc1alxubdY0SYxqz4RcPBCXLDUua4XApKemlo46kwMAQs?=
 =?us-ascii?Q?JHxnVUDn1qtVnC0cKsYEwozsv5DBJ4pTrgH1kscLPNNWHKYjWH5wgRjbV0oS?=
 =?us-ascii?Q?MR6LjzSF0ZyFgnqZf+eRq62cvwQk8zt4tE6ofHe5HmJKl57nRebI7tPztBAv?=
 =?us-ascii?Q?75/WCwux8p290/2vlP+A6kPlWwfYY9FJc89Fj1f6Aa+NtWLQ4kEa/nl2feDu?=
 =?us-ascii?Q?9kztjsmEBQl9Ubmy5TSduI0mc0VxDsedJjraQq4SCmmrViftZlYSJa+fT+Pb?=
 =?us-ascii?Q?/fzWf/Yq/qUtGj8o8iaCqQKisnbotjemh27sgExz17XEMir5+vuLPX1EJYxU?=
 =?us-ascii?Q?Fz0cMby9iks3G0tajNQp1Fa/spe5KzpaC6b2otZjBWeV2lvd1hyjEf4WYRu2?=
 =?us-ascii?Q?2Sps9UvERLH3Kbzl2PnFIymtFD/vaEE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4fa8f85-0dad-412c-7df4-08de4db56b98
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2026 06:24:32.2464 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sl8+CzrYfSjDTYkOqoSB0wxpQIjSxRIlzUDRIZn0p9CLgA7eHtdIUdI02g+i8iRJZuPMRDHz2aMzikXCnkPhIdKaNDah1s2LrT8+VqQtuk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7886
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



> -----Original Message-----
> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> Sent: 01 January 2026 01:26 AM
> To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [PATCH i-g-t 1/7] tests/intel/xe_exec_fault_mode: Add multi
> queue test support
>=20
> On Fri, Dec 19, 2025 at 05:31:48PM +0530, priyanka.dandamudi@intel.com
> wrote:
> >From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> >
>=20
> Remove email ids that is no longer valid.
Will remove email ids.
>=20
> >Extend fault mode test to cover multi queue test scenarios.
> >
> >Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>=20
> Remove email ids that is no longer valid.
>=20
> >Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> >---
> > tests/intel/xe_exec_fault_mode.c | 140 +++++++++++++++++++++++++++---
> -
> > 1 file changed, 125 insertions(+), 15 deletions(-)
> >
> >diff --git a/tests/intel/xe_exec_fault_mode.c
> >b/tests/intel/xe_exec_fault_mode.c
> >index 5f42051a1..40612449f 100644
> >--- a/tests/intel/xe_exec_fault_mode.c
> >+++ b/tests/intel/xe_exec_fault_mode.c
> >@@ -35,6 +35,7 @@
> > #define INVALID_FAULT	(0x1 << 7)
> > #define INVALID_VA	(0x1 << 8)
> > #define ENABLE_SCRATCH  (0x1 << 9)
> >+#define MULTI_QUEUE	(0x1 << 10)
> >
> > /**
> >  * SUBTEST: invalid-va
> >@@ -109,6 +110,62 @@
> >  * @invalid-fault:			invalid fault
> >  * @invalid-userptr-fault:		invalid userptr fault
> >  */
> >+/**
> >+ * SUBTEST: once-%s
> >+ * Mega feature: MultiQ
> >+ * Sub-category: MultiQ tests
> >+ * Description: Run %arg[1] fault mode test only once
> >+ * Test category: functionality test
>=20
> Bit confusing as 'SUBTEST: once-%s' is already present above.
> So, the reason we are adding new SUBEST sections is just to specify Multi
> Queue Mega feature and sub-category.
>=20
> May be make it as 'SUBEST: once-multi-queue-%s' and adjust the below
> naming?
>=20
> Also, don't use 'MultiQ' instead use 'Multi Queue' that way naming is mor=
e
> consistent.
>=20
I will modify accordingly.
> Niranjana
>=20
> >+ *
> >+ * SUBTEST: twice-%s
> >+ * Mega feature: MultiQ
> >+ * Sub-category: MultiQ tests
> >+ * Description: Run %arg[1] fault mode test twice
> >+ * Test category: functionality test
> >+ *
> >+ * SUBTEST: many-%s
> >+ * Mega feature: MultiQ
> >+ * Sub-category: MultiQ tests
> >+ * Description: Run %arg[1] fault mode test many times
> >+ * Test category: stress test
> >+ *
> >+ * SUBTEST: many-execqueues-%s
> >+ * Mega feature: MultiQ
> >+ * Sub-category: MultiQ tests
> >+ * Description: Run %arg[1] fault mode test on many exec_queues
> >+ * Test category: stress test
> >+ *
> >+ * arg[1]:
> >+ *
> >+ * @multi-queue:			multi-queue
> >+ * @multi-queue-userptr:		multi-queue userptr
> >+ * @multi-queue-rebind:			multi-queue rebind
> >+ * @multi-queue-userptr-rebind:		multi-queue userptr rebind
> >+ * @multi-queue-userptr-invalidate:
> >+ *					multi-queue userptr invalidate
> >+ * @multi-queue-userptr-invalidate-race:
> >+ *					multi-queue userptr invalidate race
> >+ * @multi-queue-imm:			multi-queue imm
> >+ * @multi-queue-userptr-imm:		multi-queue userptr imm
> >+ * @multi-queue-rebind-imm:		multi-queue rebind imm
> >+ * @multi-queue-userptr-rebind-imm:
> >+ *					multi-queue userptr rebind imm
> >+ * @multi-queue-userptr-invalidate-imm:
> >+ *					multi-queue userptr invalidate imm
> >+ * @multi-queue-userptr-invalidate-race-imm:
> >+ *					multi-queue userptr invalidate race
> imm
> >+ * @multi-queue-prefetch:		multi-queue prefetch
> >+ * @multi-queue-userptr-prefetch:	multi-queue userptr prefetch
> >+ * @multi-queue-rebind-prefetch:	multi-queue rebind prefetch
> >+ * @multi-queue-userptr-rebind-prefetch:	multi-queue userptr rebind
> prefetch
> >+ * @multi-queue-userptr-invalidate-prefetch:
> >+ *					multi-queue userptr invalidate
> prefetch
> >+ * @multi-queue-userptr-invalidate-race-prefetch:
> >+ *					multi-queue userptr invalidate race
> prefetch
> >+ * @multi-queue-invalid-fault:		multi-queue invalid fault
> >+ * @multi-queue-invalid-userptr-fault:  multi-queue invalid userptr
> >+ fault */
> >+
> >
> > static void
> > test_exec(int fd, struct drm_xe_engine_class_instance *eci, @@ -188,7
> >+245,19 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> > 	memset(exec_sync, 0, sync_size);
> >
> > 	for (i =3D 0; i < n_exec_queues; i++) {
> >-		exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci, 0);
> >+		if (flags & MULTI_QUEUE) {
> >+			struct drm_xe_ext_set_property multi_queue =3D {
> >+				.base.next_extension =3D 0,
> >+				.base.name =3D
> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> >+				.property =3D
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
> >+			};
> >+			uint64_t ext =3D to_user_pointer(&multi_queue);
> >+
> >+			multi_queue.value =3D i ? exec_queues[0] :
> DRM_XE_MULTI_GROUP_CREATE;
> >+			exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci,
> ext);
> >+		} else
> >+			exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci,
> 0);
> >+
> > 		if (flags & BIND_EXEC_QUEUE)
> > 			bind_exec_queues[i] =3D
> > 				xe_bind_exec_queue_create(fd, vm, 0); @@ -
> 398,6 +467,21 @@
> >test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> > 		close(map_fd);
> > }
> >
> >+static void
> >+test_exec_main(int fd, int n_exec_queues, int n_execs, unsigned int
> >+flags) {
> >+	struct drm_xe_engine_class_instance *hwe;
> >+
> >+	if (flags & MULTI_QUEUE) {
> >+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> >+		xe_for_each_multi_queue_engine(fd, hwe)
> >+			test_exec(fd, hwe, n_exec_queues, n_execs, flags);
> >+	} else {
> >+		xe_for_each_engine(fd, hwe)
> >+			test_exec(fd, hwe, n_exec_queues, n_execs, flags);
> >+	}
> >+}
> >+
> > int igt_main()
> > {
> > 	struct drm_xe_engine_class_instance *hwe; @@ -420,6 +504,15 @@
> int
> >igt_main()
> > 			INVALIDATE },
> > 		{ "bindexecqueue-userptr-invalidate-race",
> BIND_EXEC_QUEUE | USERPTR |
> > 			INVALIDATE | RACE },
> >+		{ "multi-queue", MULTI_QUEUE },
> >+		{ "multi-queue-userptr", MULTI_QUEUE | USERPTR },
> >+		{ "multi-queue-rebind",  MULTI_QUEUE | REBIND },
> >+		{ "multi-queue-userptr-rebind", MULTI_QUEUE | USERPTR |
> REBIND },
> >+		{ "multi-queue-userptr-invalidate", MULTI_QUEUE | USERPTR
> |
> >+			INVALIDATE },
> >+		{ "multi-queue-userptr-invalidate-race", MULTI_QUEUE |
> USERPTR |
> >+			INVALIDATE | RACE },
> >+
> > 		{ "basic-imm", IMMEDIATE },
> > 		{ "userptr-imm", IMMEDIATE | USERPTR },
> > 		{ "rebind-imm", IMMEDIATE | REBIND }, @@ -436,6 +529,15
> @@ int
> >igt_main()
> > 			USERPTR | INVALIDATE },
> > 		{ "bindexecqueue-userptr-invalidate-race-imm", IMMEDIATE
> |
> > 			BIND_EXEC_QUEUE | USERPTR | INVALIDATE | RACE
> },
> >+		{ "multi-queue-imm", IMMEDIATE | MULTI_QUEUE },
> >+		{ "multi-queue-userptr-imm", IMMEDIATE | MULTI_QUEUE |
> USERPTR },
> >+		{ "multi-queue-rebind-imm", IMMEDIATE | MULTI_QUEUE |
> REBIND },
> >+		{ "multi-queue-userptr-rebind-imm", IMMEDIATE |
> MULTI_QUEUE |
> >+			USERPTR | REBIND },
> >+		{ "multi-queue-userptr-invalidate-imm", IMMEDIATE |
> MULTI_QUEUE |
> >+			USERPTR | INVALIDATE },
> >+		{ "multi-queue-userptr-invalidate-race-imm", IMMEDIATE |
> >+			MULTI_QUEUE | USERPTR | INVALIDATE | RACE },
> >
> > 		{ "basic-prefetch", PREFETCH },
> > 		{ "userptr-prefetch", PREFETCH | USERPTR }, @@ -453,8
> +555,20 @@ int
> >igt_main()
> > 			USERPTR | INVALIDATE },
> > 		{ "bindexecqueue-userptr-invalidate-race-prefetch",
> PREFETCH |
> > 			BIND_EXEC_QUEUE | USERPTR | INVALIDATE | RACE
> },
> >+		{ "multi-queue-prefetch", PREFETCH | MULTI_QUEUE },
> >+		{ "multi-queue-userptr-prefetch", PREFETCH | MULTI_QUEUE
> | USERPTR },
> >+		{ "multi-queue-rebind-prefetch", PREFETCH | MULTI_QUEUE
> | REBIND },
> >+		{ "multi-queue-userptr-rebind-prefetch", PREFETCH |
> MULTI_QUEUE |
> >+			USERPTR | REBIND },
> >+		{ "multi-queue-userptr-invalidate-prefetch", PREFETCH |
> MULTI_QUEUE |
> >+			USERPTR | INVALIDATE },
> >+		{ "multi-queue-userptr-invalidate-race-prefetch", PREFETCH |
> >+			MULTI_QUEUE | USERPTR | INVALIDATE | RACE },
> > 		{ "invalid-fault", INVALID_FAULT },
> > 		{ "invalid-userptr-fault", INVALID_FAULT | USERPTR },
> >+		{ "multi-queue-invalid-fault", MULTI_QUEUE | INVALID_FAULT
> },
> >+		{ "multi-queue-invalid-userptr-fault", MULTI_QUEUE |
> INVALID_FAULT |
> >+USERPTR },
> >+
> > 		{ NULL },
> > 	};
> > 	int fd;
> >@@ -478,26 +592,22 @@ int igt_main()
> >
> > 	for (const struct section *s =3D sections; s->name; s++) {
> > 		igt_subtest_f("once-%s", s->name)
> >-			xe_for_each_engine(fd, hwe)
> >-				test_exec(fd, hwe, 1, 1, s->flags);
> >+			test_exec_main(fd, 1, 1, s->flags);
> >
> > 		igt_subtest_f("twice-%s", s->name)
> >-			xe_for_each_engine(fd, hwe)
> >-				test_exec(fd, hwe, 1, 2, s->flags);
> >+			test_exec_main(fd, 1, 2, s->flags);
> >
> > 		igt_subtest_f("many-%s", s->name)
> >-			xe_for_each_engine(fd, hwe)
> >-				test_exec(fd, hwe, 1,
> >-					  s->flags & (REBIND | INVALIDATE) ?
> >-					  64 : 128,
> >-					  s->flags);
> >+			test_exec_main(fd, 1,
> >+					s->flags & (REBIND | INVALIDATE) ?
> >+					64 : 128,
> >+					s->flags);
> >
> > 		igt_subtest_f("many-execqueues-%s", s->name)
> >-			xe_for_each_engine(fd, hwe)
> >-				test_exec(fd, hwe, 16,
> >-					  s->flags & (REBIND | INVALIDATE) ?
> >-					  64 : 128,
> >-					  s->flags);
> >+			test_exec_main(fd, 16,
> >+					s->flags & (REBIND | INVALIDATE) ?
> >+					64 : 128,
> >+					s->flags);
> > 	}
> >
> > 	igt_subtest("invalid-va")
> >--
> >2.43.0
> >
