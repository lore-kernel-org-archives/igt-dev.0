Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E038D262AD
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 02:43:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B5B10E1E3;
	Wed, 21 Jan 2026 02:43:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GE/pCS+D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB09B10E1E3
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 02:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768963421; x=1800499421;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=U+7uoatQsVUZofi47eBCYbGiQtFhj3+TVPS9EdtrM/Q=;
 b=GE/pCS+D9QDNQooAMEYbce1uk+QCzMtqYLzXQbDnbZSSqDP+cxtkkaz8
 58uSpGff6Jp0Bf4cH1i1KfLtFVQTk87zKBbHAsInwmkdz1K8qDNN1Metu
 55/VpaahDrSdYCpPHk06lmY854FnZI4RRwrrdwPLCNDu9V8gG5FvpUegM
 IM9VEzd/m6O8XkADPlIjs5rNE7VeKlPpg0PQ1NiqrfRSni2jLfmUChNRC
 81aMKJCsxlXm9B9mkVKT5w4QenVop6RaIqAFA/uv72xijOrNsurDgSKsi
 Ap9Wv9tKpfLsdDzzbbYIk2X/IofnQ+KmeAqfRUdleviWg5LywB2MgVBUI A==;
X-CSE-ConnectionGUID: 36UeKtx0S36npJHCFjMoBQ==
X-CSE-MsgGUID: /kgkMXY/QM6CaxxtgGnTsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70277361"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="70277361"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 18:43:40 -0800
X-CSE-ConnectionGUID: IZDKluEtQVa4vjJ1PxJAXQ==
X-CSE-MsgGUID: EL6u4myvT+OzXGAAvcOxYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="205432949"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 18:43:41 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 18:43:39 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 18:43:39 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 18:43:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uhuzwB2KPuWfP86vNViQkW6Vq1BHqi5UORng+r6suUiGyFs82SBZ+dr5e3WHouk/hocBneDFDNO+oZ8wgvTel3mJGfRCKExWI847R0JFZKdUdVdsjViVjhX7bXPIwu1nZl0pba/z0VlkTlqm7uitNDOtReOGPdwDxojr1KPeSj2wRdxHDaDcEZHspUxYKrfwyHMuUKLr+DgSn5UBo4HbjUaiShHsY792FG0NASz9YBOKoMbezbbah2f7Q1dgwWCM69EEfHDHXA9XkRH6oricvd4gw0IllwWT1rdXG/hDNgUQB2MfSC4yh9fWWGshbafRH+xZ8AKrXRWvXQwzA0l27w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=daMCyPm5PNvSmlIPNldnYFvB7K+DZnvHa8GsBw+tfzo=;
 b=I48tOZiYEjr2EDLfipTtJpGzBFN9MapFiVOguHIi9JcsWLgTC2838A6qlmcirtFIrfJO7PjBPsDOwA+VS84oWrkobQQ0XnWIdxSnHMtmGssQI4JVQzXj7mL6KQFB83egkT43Z1Rc2r524cfAtPFtrE3olso1K1ePKNbEXYGBsGlCwTV5tDFbhILYTADIf9X4SAnUspCHkyrOzjbW6mpfLY6bMh/aZEy/kpqa/a+Q9iKp/db+siVB8JHC98ystrZJfn5YhNDikNk5wDS+FH0gu8QCJwGTpKJxWZGzGSwxFPMlNWYahiLuXc4RdcQ0EWXMrpTZ5QnJ6eVBhSyDU90vBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by DS7PR11MB6296.namprd11.prod.outlook.com (2603:10b6:8:94::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 02:43:37 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 02:43:37 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] tests/intel/xe_fault_injection: Close drm fd before unbind
Thread-Topic: [PATCH] tests/intel/xe_fault_injection: Close drm fd before
 unbind
Thread-Index: AQHcgblsfMCfdbaX4Eais2bacAVhSrVb+4Hw
Date: Wed, 21 Jan 2026 02:43:37 +0000
Message-ID: <DM4PR11MB545620EA1B0F449402A31B0EEA96A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260109224047.2483497-2-shuicheng.lin@intel.com>
In-Reply-To: <20260109224047.2483497-2-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|DS7PR11MB6296:EE_
x-ms-office365-filtering-correlation-id: f9d86d49-1ea7-48fa-0923-08de5896e114
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|10070799003|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?zHy42s6ZRa/RbO43W2tTzFCVWwfLwYLx1V0W6gDsZiTj9vBwNlA5AFR3qwG3?=
 =?us-ascii?Q?0ZD7rUwJjOR1Hl1G7snxZ5GCs7UsH0bvitw9PsRHnwg0AzJ8OFsdWo6K4fZc?=
 =?us-ascii?Q?qKxHIGZEklAIcuT+qosMU2nuV/cOoOgu2oxESRfDW+z5UQ625flpTnVPO4kg?=
 =?us-ascii?Q?eJiXg86RrgG1J/KqZT/wVEyBEJ+K2eKJMKIuXraPQXvbL7LvDsH0zQFgJjn3?=
 =?us-ascii?Q?hmj4ZwSDgwKBERCSxAdchyT9R9hkSg84/Te6TM5/vuLzpyRMBqqIW3bI47nM?=
 =?us-ascii?Q?Fl4eiyg/1G3QR44kiWRi++dv7ysNvSSGzNKLv1nr7VyfDdDW+ivw9k/7Rk9s?=
 =?us-ascii?Q?F4wD30DOsEG32q/uabS0iy8H7+kDhpyHCS6TF6w3kZzaG6ZXaH3KPjlTKvDK?=
 =?us-ascii?Q?V33BeOaW63OrAKVr8tk+WTAGQ6dTWX23ulwx0WRsIyVT9+ljYc+V7K+VvN6H?=
 =?us-ascii?Q?T9hxe/sSSK0bKuiankJXQH6rIPw6/osZ4ySOQYxR789hvG5rznHoga6fBnCg?=
 =?us-ascii?Q?2sGy7mI2tq0WedwH4RZRtJqvMxg+BDxYIX/pjREDRNOMmT4BCCSQnfj1pL2H?=
 =?us-ascii?Q?Vh0sZ/ey5pNe/mOUZ6r+5DNSBC3bALqcNYaXoiP7CHleioUweGrtQ97eFk+H?=
 =?us-ascii?Q?pN7rL4JQ1gcesOj2uMywjHo1s2efloZfOu67ukOCPVrGeRls5wmADkk46zgE?=
 =?us-ascii?Q?BsHA/VnlZUaSSsXWaXX2c21I7gV3FRHkHjbcWJtTVFBH555pGCH1K99acUAy?=
 =?us-ascii?Q?F8CJkAUrtHkjm1qYTWiQJ8yWgO6R7oZ92irqYM+ufLJXtp2FHEnnLlKhMXBp?=
 =?us-ascii?Q?KzRk5dEO490/UuD65p6le6NCrVEPHgLXi8jvRGZ1coHLEuedFYkWDh7jUb3D?=
 =?us-ascii?Q?aKzFC0LJzHExUxPmLAY9ZARIrnCSFUogFEvocGgGumZjcO6zVFiqEYxJgV4z?=
 =?us-ascii?Q?1JWhQHFORlKj6yaWJYUuG+ayjXdX/CnR4o+Y2MwA6JIdK54/yCUcCqwg9Zvz?=
 =?us-ascii?Q?6UutXf3c6NIfBHI0xcCah+r1VSBoPZa5S4CRiyJhcp4PiMIStD+xkB5XkZtF?=
 =?us-ascii?Q?kqB6laKs2EoY+KxkDjaMvCkDDqG79CQitjxXdV+SuFlwWsWug5MBsVWXsmFE?=
 =?us-ascii?Q?SFAVjajGiF4FdVo0TDKaVjx8Y6jDmT1sNbK9qzfMEtffwQ/XCYuAumpmUM27?=
 =?us-ascii?Q?JFXIrKSTW4oLgocIbgHWNyIbMku5hsE4U3+5X1A4KFDMz51AUqTtxXlkXO5t?=
 =?us-ascii?Q?Cc+hl4lMBl6/tGTvw/NRqUAEk3hhZrLrF/lEByOJIqZku1LgDtEvkAUM67KD?=
 =?us-ascii?Q?g97YjPE3HrUkWTOAv5NtoKbAcbUKFEZniGdeJpi/pXAnz3H+fQZP8g9L4/jL?=
 =?us-ascii?Q?3OYFq0NDaemUugz9jfJy1j/omJE3FCHoMHZsOrQpn9TWsGnmody7qQHDRjJa?=
 =?us-ascii?Q?bCl+CSJ18oWAMorW5loxDmjIgAWv6Tks6c1V59w4yg66fJj49WF8SLciPAAp?=
 =?us-ascii?Q?bl+RmPNDq9fObZdA7fWuWaOy4qGdKBmKFqgSmgbO6+XWxl10lGXiqY/6R//y?=
 =?us-ascii?Q?Ar1g4oJLe5uAAYefx5jFPkVZ4+adhrCqlUCWV+AtbALhspz3kKAm7jzlthTy?=
 =?us-ascii?Q?ppdr7SOzZP1fpNiVuO3vvv4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jnVZg+4E4ua4KsyL/wbpT53L/y80ntLj4VzVwCNahYU8n1+cFzKRMx5aBpFl?=
 =?us-ascii?Q?fa8C4Vnlty0ybh6BgFvvtyTirpwSXdM+IRigysgoIcDkdxi8wR3/ke3Ac/qL?=
 =?us-ascii?Q?8GgeqlNk1P0GXrZgvyFOdtW4JbYcFwgTcvgybKXjcKwMPxfhly044UjixilR?=
 =?us-ascii?Q?qWY6bJwPAj//OJVtU+ORZ2E/Y+f3EwlAwMBOKM4LYOtpJ5Iqrd4qY7CQYpB1?=
 =?us-ascii?Q?vDhe2m9TV9+XN28Q5xc1wBL7aBwwCjiSOYs8msWTthX5rQ/PBGNErxDgDIRG?=
 =?us-ascii?Q?Ku9wlCH0nPERvsDRSZSoCJO934mizXxTLLYbevS994HaKsbHqjiJRrZ/b+Kf?=
 =?us-ascii?Q?HdduJ7Z+R6NyYTKu/ovHNQpwOIQH8fkIxskEBhkbOcjLRfiwBXAdaIaeHjve?=
 =?us-ascii?Q?gCW0RZ6pImzs84LwXl5EB/UM/4D1ofShpqRZLWWq3VdA3EcKzp5MA0KMkxib?=
 =?us-ascii?Q?RSrdSsbRcnwuXnL/NOjUCrRnJql0PoReOnJzmAqTkitRTdUw0wdNU//Vamn1?=
 =?us-ascii?Q?4OGCbsiuMKxkXu9uxcp2RNOkfcdUjdVMgvHhGAt2JB1XgHPR+IQll1l5u1CD?=
 =?us-ascii?Q?VMxwGqzII+T1LHxJVSXLKUALNXiQIpC5dIfp9mJsaFrD/JT9d1o0AmONs8dj?=
 =?us-ascii?Q?CNrqNtRcvII7St/SLxdYCvWQ/Kt8SO9BRZ6p+1KDAxQYtSx+iPAfRQQ392Pu?=
 =?us-ascii?Q?zDQc8xLYjQqe5dLYI6YmF3P432VoJqWLY1G41uz2B2kBNFC814U6mx9S0mtM?=
 =?us-ascii?Q?+CxMXM6M03MOUccVdQRTDVEo0v3XyIicDBA6Xfiwu+PHoCvVg9YhgAMP248d?=
 =?us-ascii?Q?hIrV5WZxb547T1j0JJ89FrC7O647GOtpjYiTrNlo3PcpOpY+mkZ+r2oYyMQL?=
 =?us-ascii?Q?IErA+t7McM1u2/Aeq5Y6f285NVCzEr4OhrJFaFzspsPdUqUmiYRs1w5KXtMT?=
 =?us-ascii?Q?O4GeX7lw22Vt7sZR/wRA1S39Whq8+Og1xizyT9mDN5N0zhLI/WNXY55A4Flw?=
 =?us-ascii?Q?UoNNAwEI1dnjomHaqq+iZ7g934punJgiBrd2NfkpR6BwsdM9Q8+w3OAG3qDo?=
 =?us-ascii?Q?iVC2pSV4fKWlnHBXM4Jqx9qW1+7iSWMbGds/GZBzyOZ5ph8Zx1oHFanfUCZ+?=
 =?us-ascii?Q?eYg/TXic3iTCH/yiOmpn6yHpwlkk/d5gf+wbDdkgr8/HvvkXmSuD65gSC0qm?=
 =?us-ascii?Q?m/IeljfQx7wuTOAcuDZsFeQzjRYfDC6969PNkTTlK0Ow78XFhhFuhSN981iq?=
 =?us-ascii?Q?ZXSg8RXLg92BafOSPe/QOM0smRbcWePjCiVhoR1uUfTHHj4o4xp2JFhlPm1/?=
 =?us-ascii?Q?xffptdN4CDKtzBzFmGPr7V1+Gzq4O59eedDp32XMAjn8WNLcpK0bSkVEoFT8?=
 =?us-ascii?Q?akq4BJDofdLzLGax+4kgmjJnpyI/x8Fz5tTRj50yRTY/k5a+BToT9MIb0WVd?=
 =?us-ascii?Q?1aDNZhOKX5kPFKLg4wnheCH83RXNKRphOhO9aN0UGcC89c3xCk/8yFOQ44EH?=
 =?us-ascii?Q?hRxJNUMr+lqrT9iXHEXdYVPssDJywp1GGr/b/59ptGYEEilaaz0l1eFEReoJ?=
 =?us-ascii?Q?wMyZT36L+6Li3ICTTJr6Ki4Y3bB7AArRK+I9K7w4ZsYlo+irhgS9Nv9oGiwa?=
 =?us-ascii?Q?L6JZvIhKReskQ7nKFu9Mz9iexkzV2Pbbvmz+II+KZdZia7y5wcr5npcuaCdA?=
 =?us-ascii?Q?LNNJJ8K831+g5cXjO3JWeeoffoIG1qVrdYSExqVciV3qBw9gRk5TIhPqZBLV?=
 =?us-ascii?Q?0hpB263UL46IyghtQoHFSpfzLJfkdy2M5w5jtimxRnQcZSNj4lW1VBLFf3Q8?=
x-ms-exchange-antispam-messagedata-1: 8JrNbVeNCrg1Iw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9d86d49-1ea7-48fa-0923-08de5896e114
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 02:43:37.7204 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IUUoQ9YyfS0D5+0Yn3GIou5hkR0PzEJ+ZkFgHX/V0X42ONYnyWbRcb/TI/BGJiV6OQfgN0mhBlEklPrkJbyeUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6296
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

Hi all,
May I ask review of this patch? Thanks.

Best Regards
Shuicheng

On Fri, Jan 9, 2026 2:41 PM Shuicheng Lin wrote:
> Close the sysfs and DRM device fd before unbinding the xe driver. Otherwi=
se
> the open fd holds a reference, and the subsequent bind can come up with
> different card/render minor numbers (e.g. renderD128 -> renderD129, card0=
 -
> > card1).
>=20
> Also drop the unused DRM fd parameter from inject_fault_probe() and
> probe_fail_guc() now that these paths don't require it.
>=20
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_inje=
ction.c
> index f3bfc4b40..76d1c6fa3 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -260,7 +260,7 @@ static void ignore_fail_dump_in_dmesg(const char
> function_name[], bool enable)
>   * @xe_wopcm_init:			xe_wopcm_init
>   */
>  static int
> -inject_fault_probe(int fd, const char pci_slot[], const char function_na=
me[])
> +inject_fault_probe(const char pci_slot[], const char function_name[])
>  {
>  	int err =3D 0;
>  	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n", @@ -
> 289,7 +289,7 @@ inject_fault_probe(int fd, const char pci_slot[], const c=
har
> function_name[])
>   * @xe_guc_mmio_send_recv:     Inject an error when calling
> xe_guc_mmio_send_recv
>   * @xe_guc_ct_send_recv:       Inject an error when calling
> xe_guc_ct_send_recv
>   */
> -static void probe_fail_guc(int fd, const char pci_slot[], const char
> function_name[],
> +static void probe_fail_guc(const char pci_slot[], const char
> +function_name[],
>  			   struct fault_injection_params *fault_params)  {
>  	int iter_start =3D 0, iter_end =3D 0, iter =3D 0; @@ -308,7 +308,7 @@ s=
tatic
> void probe_fail_guc(int fd, const char pci_slot[], const char function_na
>  		fault_params->space =3D i;
>  		fault_params->times =3D MAX_INJECTIONS_PER_ITER;
>  		setup_injection_fault(fault_params);
> -		inject_fault_probe(fd, pci_slot, function_name);
> +		inject_fault_probe(pci_slot, function_name);
>  		igt_kmod_unbind("xe", pci_slot);
>=20
>  		/*
> @@ -662,6 +662,8 @@ int igt_main_args("I:", NULL, help_str, opt_handler,
> NULL)
>  			oa_add_config_fail(fd, sysfs, devid, pci_slot, s-
> >name);
>=20
>  	igt_fixture() {
> +		close(sysfs);
> +		drm_close_driver(fd);
>  		igt_kmod_unbind("xe", pci_slot);
>  	}
>=20
> @@ -670,7 +672,7 @@ int igt_main_args("I:", NULL, help_str, opt_handler,
> NULL)
>  			bool should_pass =3D s->pf_only && is_vf_device;
>  			int err;
>=20
> -			err =3D inject_fault_probe(fd, pci_slot, s->name);
> +			err =3D inject_fault_probe(pci_slot, s->name);
>=20
>  			igt_assert_eq(should_pass ? 0 : INJECT_ERRNO, err);
>  			igt_kmod_unbind("xe", pci_slot);
> @@ -680,12 +682,10 @@ int igt_main_args("I:", NULL, help_str, opt_handler=
,
> NULL)
>  		igt_subtest_f("probe-fail-guc-%s", s->name) {
>  			memcpy(&fault_params, &default_fault_params,
>  					sizeof(struct fault_injection_params));
> -			probe_fail_guc(fd, pci_slot, s->name, &fault_params);
> +			probe_fail_guc(pci_slot, s->name, &fault_params);
>  		}
>=20
>  	igt_fixture() {
> -		close(sysfs);
> -		drm_close_driver(fd);
>  		injection_list_clear();
>  		igt_kmod_bind("xe", pci_slot);
>  	}
> --
> 2.50.1

