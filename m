Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51EDCCF9E0
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 04:17:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4D910E097;
	Mon, 27 Oct 2025 04:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gF1wK/BZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580C510E097
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 04:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761538637; x=1793074637;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MjRw3TrmOWtHjXHTTfO3Usovio5ppKlFf36Wd5BUBAI=;
 b=gF1wK/BZwHDMQ+Ufq5kiIasl43lAmKlYTRzFZL+rBy3eK9+0bc35vozU
 8BFsip5PyG6DmyFBfHqmWpLA+zchU3UX5aW73YtFbehGrU8IpRqQ0AhFv
 Cm20JuK2lj5NTSK6uBuRJtZmde8wazVQJIgii7oouOjrfJi7alxzRXDyQ
 Wl63FX7GseQzAZV/09QtzDOvayGRUuc9e/eEsZwRJm8Nt89TkJ7QG1CpE
 ecjr5L+++aYFZnq1YFF/q1nGMb68ViyCOHfhVPwAD5WaYNBNUl0z2P0qZ
 ean/MS82jGxEZdKwpuiU0WivxWNbF4kf9uIoNuvguQpHj5CMy641nPmkq Q==;
X-CSE-ConnectionGUID: zIXeBajYRWGJINSeaIQtuQ==
X-CSE-MsgGUID: c/mdBNqST9qrbGLD6ENAAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63514398"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63514398"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 21:17:16 -0700
X-CSE-ConnectionGUID: dgddxbNWTvOcnV1XFMwMaw==
X-CSE-MsgGUID: GXoewKn0TzabonzhOg+agA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="185407489"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 21:17:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 26 Oct 2025 21:17:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 26 Oct 2025 21:17:15 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.27)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 26 Oct 2025 21:17:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mq+voIjNUR18kzSYGofmz70C4PoDO0GpaiVK3CGxXN/Wi6NHsURH9Z8tV0PBg8kZy9PeX4MGGUpxGz2fffMzc2ZZ+ytyZbFZKtXbKn4aUVMUBF6LkPsI8p9MVMv0haYTk0KgXD+QxmftaTS8unAk4knT+u7KoR3tkatR0FzbqiSjMUdm6sU61zDm3TmKaKuCoxubQNkyu2JgCvMvVgVUnHit9yTm/VT0TGczKQsGz4A6QO+d3kPE5UIy3km2Ka3NKdPvmmZoxfaNTir6yzOlKnFKe83kYezy/UFULUoa3P7dB2PsxVtzbuC2uMXIiAXbOZNDS30mb8x3ChRtutXXUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6njqCvZHYfXcyRh+0kRk/vdUjvI9B9h/j8M9RjPrnuI=;
 b=c2sf/bYYqmbXfDSqKbippk3qWu2O0HLC8dJKEClTsb3JqZmbXISobMk4KnomLRnsglSjOYgquCeldJJPpI8N/8oRmPLh3YX3ORyscb2dooRsRBgx2ErDBBPD2GH2YgS3Iqlt2CBE081I8lISZDOG7DlDXq27BQc2Pf6HoHxoMljoxwZiaPv+zu4OvttjkXHhmzdf1i4NrTdaX/b3Vzw77oAGKoxLDzyXaIAMBryawZA38qlBlOqDxDN+65g7cuzfO7rKQYm+SkJ0cpCJNaVvwBMd38A99yPktIDF9dFOBF2UOiTkvm9RnXxlVzmXqxyRyH/2/M7V+t/ZVy9xsdSR4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by SJ0PR11MB6718.namprd11.prod.outlook.com (2603:10b6:a03:477::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 04:17:13 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 04:17:13 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Samala, Pranay"
 <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t v2] tests/kms_atomic_transition: Add info meassages
 for skipped subtest
Thread-Topic: [PATCH i-g-t v2] tests/kms_atomic_transition: Add info meassages
 for skipped subtest
Thread-Index: AQHcP1yhJZStAZj7dEKUQ/uvz0v2OrTVbiuAgAAD6xA=
Date: Mon, 27 Oct 2025 04:17:12 +0000
Message-ID: <PH7PR11MB6796EAC3A4CE045DCCEA91BDE5FCA@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20251017121055.2960836-1-sowmiya.s@intel.com>
 <DM4PR11MB6312E9297975D96AB1365DFC90FCA@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB6312E9297975D96AB1365DFC90FCA@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|SJ0PR11MB6718:EE_
x-ms-office365-filtering-correlation-id: 68a6c014-bf93-49af-6e4b-08de150fb481
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?luiKNJxV7whSuv2Sg1mXfo/oqkgUU49/NxYQHFkYzvdBtaxGM/xQ9s7p9FCs?=
 =?us-ascii?Q?qtmCIvFTBZ68go6Sn2R2HAC/oynMturZ7NWwvnUpkwf1bLVep2er1qFspnIc?=
 =?us-ascii?Q?1PDsgwFg2+0f2c99cpKivtTLCyd8wKBotVTFW9AUncQos/M7DaWu+pwVsn/8?=
 =?us-ascii?Q?V9wamDgRvzv4Y0mhAoj/NQpAF6eCotID+kUyVjv/irMpwdgHzQ+mbL0MyYUl?=
 =?us-ascii?Q?9rAC6AWDKkE8Cvp/QUKvP/58QFuYOXCd8wU8Vs4gQOWNpen3zqGoAUN+ripN?=
 =?us-ascii?Q?XY6tprrAowfvPycRHPwFBHY9y3HUTaDP+n3cQz0PXoJkFZNXLK+yO32uvPip?=
 =?us-ascii?Q?iH/Ml/PAtyA3yCVTK1Gz64syaciicMhqFp/6DnYvtJQca3KHS3xkJ4TwTu0o?=
 =?us-ascii?Q?PQRnSJZ9rxUUwEbYfhZu/hZQH8s8sZ7gkM5cgN8JkMQ0jiuDr0Z94nnF9B9P?=
 =?us-ascii?Q?ZJ+OZjlWxytQZhDPNKhqH24hkmbUc3Y136iuu08NFXZu1Mk1LKQmxGo6+Ygf?=
 =?us-ascii?Q?jA0uLpUyooQVqptcnjUy6RIMs7C3GZLX6o3MhVBzXAml4wYWj3VGHb8cqh+i?=
 =?us-ascii?Q?8UlUP9iU7ThSJMtFHQqL4EZlftfa42iiEt1DSnmje/PLoUPkZUmmmafdwaqC?=
 =?us-ascii?Q?wLnisie52YE1WBRm22CVuXJiU2ZkUeXTUQHkB5geWSayjV7MGG8EyRbHC1rf?=
 =?us-ascii?Q?yrr+TksntCmjBJ8wlHIAOcsKWWjO+JL6BtiM4seaspUa4ArZjAgpzr/L7Rt0?=
 =?us-ascii?Q?XESAgHIR6mlCpBc+R2xqWtUWlWoPl9/YkY8A8RwMLKYLkMVaxQvThHXAab8V?=
 =?us-ascii?Q?jYL/O49Zy0fm5lWX338iuucDFz+EqTn91/vZKPod5U+bg+XzHKRGKpG5HO1k?=
 =?us-ascii?Q?WqevAchhbrxOsSc4LO3S32iRdQd3XKJTF02AUoQe3vYDUqXKP5xUpEE0wwUv?=
 =?us-ascii?Q?S4J8oSXdLOM9AnriLnTSjl5Xxiw1sBA0EKgsmEL83J1zEnNqZ46Ru4zqE38U?=
 =?us-ascii?Q?VHE4HHY9QpZ96NXhF5f0+iTAQpoUcOOUAenSwQI0McBtOsofbZ23T2hdsPWu?=
 =?us-ascii?Q?n6257TeoAAqQHiZ1HTCIrH11EYVoESSG6qVx4sorFK5knH8XlOuIqU0wyExn?=
 =?us-ascii?Q?sRozyFoyJ+NcAr/lyXyhgNKJj0a8ewin0RmgTvM/zc1avsy6jOm88aLcLSlt?=
 =?us-ascii?Q?5uW4QACdAOxO1gCCJOJbVySnYZzW83dxiF3iLywOMBpcFliIJZwXj+6RpKP2?=
 =?us-ascii?Q?WlzcpRhJfguBxsAJQHTO1U1eiz38gaIt2uKyP7bPGK57F8fjOKi+QjOrzFtg?=
 =?us-ascii?Q?j1JAAYNhyfHA0DK7dqZmcAx8C4ttHMQjVdHVr5FzeNfPXbRf5yfnn9D8D6IS?=
 =?us-ascii?Q?GnIv+WB8rlx/Y633IDvuExree6f9Mx21hzDoHb4uJ89tHnlrpqu6MhN7CjeA?=
 =?us-ascii?Q?qTAs2pmAn2Nh+xA6n9Q8KmMu6asy6JLp0KzOnm1l0IuUWM6S935XZE4+ewIG?=
 =?us-ascii?Q?XmXgOUXjB8HBWohUKP344FOnGwHcm09i4IGX?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6gIp1tbKvO1EWP6yiHQw20LMTKjRmF2xAQdsOeOPCwJxRJTiRPJBvkJFeEN9?=
 =?us-ascii?Q?v4W4l6Yk9BD47doVpVlxTWd8O6JM6mxPZ28up67Zl1B6BrDqNuz2CgabFgpT?=
 =?us-ascii?Q?dZDGyUcdujKwnfBITRvellkWlSuigFo3agLz6nDPtUxJgBOGG0jruaNjzSF6?=
 =?us-ascii?Q?QLLhiC2XJCJoJRV25EN6oc0AOO+AqEaDtkEOIOaUBYT2vFOtS5nEDDttHl02?=
 =?us-ascii?Q?FI4IyE0iNyMl5quonjZ64aHROlFhNTshbPgSodK2cM/lG1e8MW6UbEVWLCYB?=
 =?us-ascii?Q?2Va8RYQ2j60X+U41EH/k1jPap1af/DXNazGi0Sli/OkkdOFK6ZtVFjAXnOw+?=
 =?us-ascii?Q?ivNL8ZWmBVyhNPvjVMwSSZ5lfNiwlSwIaTdRMJkCCLM8NgFQJEKwes5sfy5m?=
 =?us-ascii?Q?HJfRRPXC5K3V1c33lstbekJRTANPEASEDV55ODG3NVfJKTaYrugbq1d5RwjM?=
 =?us-ascii?Q?SfkCQ9mW6m7GURaZfvp0OHlXcVkTMpoeVAV/1dDtVuFNVAKXhMQn01Ep8r6b?=
 =?us-ascii?Q?Ghz8JUq5DRD/B1tY27nv4tNYIYCiuwTQfP8oJRtARri7A+eXl1j1U6L+0xj3?=
 =?us-ascii?Q?TmUDbLY1/DnZUj0Hx56YQX4CyRSggJSjH43LYcyzVYqsPnN41+DthuVRdyPb?=
 =?us-ascii?Q?zAjkrXDL4wz1sLawyZB0ONGaBm/X5nrjXPeFI4Ey4sqc/wRY5WHohrMKxXQI?=
 =?us-ascii?Q?MighaEwdme6O1KtF7BEikVyj/fvLP2xYsuOVu1UwY5Rsv3/5OntRwql3Z2Kv?=
 =?us-ascii?Q?twa6BAO/Ch3DlomQvX5NulI8LW8TzrLewO6hY0KaZT0ABu7Lvb4HDTC2xc4F?=
 =?us-ascii?Q?gIGCLl5Oibdk6thEVORlqXpyCEkQLLgHO/sKyOKcOTg9XZvKsb6opAuijiTJ?=
 =?us-ascii?Q?BN/uecnm+2VLS7zCBc9aQlprn0aHenrOA+F6zRsd+XMtBn18chGJS+wIMFFj?=
 =?us-ascii?Q?YMP80wTIYP4s2hR3ia5jYt/SLTvmwRt57QilNq8cYeJxh59eJ+oQoEtZPam9?=
 =?us-ascii?Q?PF+H+9f8GZDzcjRmi3zyZoQ5AX3V+gehA+u4BbYtYoFxFJQ2dAD/B7+woUfN?=
 =?us-ascii?Q?EIdG1Po2bQoFxX+X1gFznA6/dsunlh53dteKsOms26RZA2/8ESLtsSz9ct8g?=
 =?us-ascii?Q?30CMiAsSbUggLkvoRAqpOqOQdIj2PbXA+xDmHUx+PqjDwPn4j24l16+IvoYO?=
 =?us-ascii?Q?/GYsIjeTz1s7UWJlV2+GmL6cbXv6hEStAPc4OU3UpiCLmpyw6SBAGV+BDuSo?=
 =?us-ascii?Q?IL9PIQAmmMxzBCzMZ6ZGyQTBCOFcEs/5KE2EWU6lF6YhdgWFauvABkbEAeTa?=
 =?us-ascii?Q?Gx2Y5OH1vmlw3k9a2bsQL+64EYDMc0B2AUbK+Q4SrcGbO1Goy6ZS9qu4sxoj?=
 =?us-ascii?Q?qO4Y/Aq2I1Da1A1U5WtwumZSvelTrlDp79L+796pyr0EYlzuk/NeTj5Vdomj?=
 =?us-ascii?Q?w7rlvK/OxcsnIVuqAUQZbJs6VwyUEDXBI7zqm59wMk2xbeYlwHKPYJBSHRQk?=
 =?us-ascii?Q?RJ/cT/O+UrsH6accCHte5myJvpf9ytP5hixVJxsBgq3VBVq6OTwTIeo3q3zc?=
 =?us-ascii?Q?3rbV6SvorSLHGadBlk7tDbcEjrragBgR3CLt2zpx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68a6c014-bf93-49af-6e4b-08de150fb481
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2025 04:17:12.9713 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qpRj8SaMG+sBznYgUeFp//qCfFFOoZK8wzyqUQF9jHH/HAhWC20Rg1tkeKamgEq/aQuC+m8JB71SOjfEPBOwew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6718
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



-----Original Message-----
From: B, Jeevan <jeevan.b@intel.com>=20
Sent: 27 October 2025 09:32
To: S, Sowmiya <sowmiya.s@intel.com>; igt-dev@lists.freedesktop.org
Cc: B S, Karthik <karthik.b.s@intel.com>; Samala, Pranay <pranay.samala@int=
el.com>; S, Sowmiya <sowmiya.s@intel.com>
Subject: RE: [PATCH i-g-t v2] tests/kms_atomic_transition: Add info meassag=
es for skipped subtest

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of=20
> Sowmiya S
> Sent: Friday, October 17, 2025 5:41 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Samala, Pranay=20
> <pranay.samala@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> Subject: [PATCH i-g-t v2] tests/kms_atomic_transition: Add info=20
> meassages for skipped subtest
>=20
> From: sowmiya <sowmiya.s@intel.com>
>=20
> Add info messages for subtests that are skipped without having proper=20
> info messages. This provides clearer insight into the reason for skipping=
.
>=20
> v2: Add switch case instead of if conditions
>     Also changed the flag name.
>=20
> Signed-off-by: sowmiya <sowmiya.s@intel.com>
> ---
>  tests/kms_atomic_transition.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/kms_atomic_transition.c=20
> b/tests/kms_atomic_transition.c index a13830965..032abf54b 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -1172,6 +1172,7 @@ igt_main_args("", long_opts, help_str,=20
> opt_handler, &data)
>  	};
>  	int i, j, count =3D 0;
>  	int pipe_count =3D 0;
> +	bool info_flag =3D false;
>=20
>  	igt_fixture {
>  		unsigned int debug_mask_if_ci =3D DRM_UT_KMS; @@ -1216,6
> +1217,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  		igt_describe(transition_tests[i].desc);
>  		igt_subtest_with_dynamic_f("%s", transition_tests[i].name) {
>  			pipe_count =3D 0;
> +			info_flag =3D false;
>=20
>  			for_each_pipe_with_valid_output(&data.display,
> pipe, output) {
>  				/*
> @@ -1224,12 +1226,16 @@ igt_main_args("", long_opts, help_str,=20
> opt_handler, &data)
>  				 * panels with long power cycle delays.
>  				 */
>  				if ((transition_tests[i].type =3D=3D
> TRANSITION_MODESET) &&
> -				    output_is_internal_panel(output))
> +				    output_is_internal_panel(output)) {
> +					info_flag =3D true;
>  					continue;
> +				}
>=20
>  				if ((transition_tests[i].type =3D=3D
> TRANSITION_MODESET_FAST) &&
> -				    !output_is_internal_panel(output))
> +				    !output_is_internal_panel(output)) {
> +					info_flag =3D true;
>  					continue;
> +				}
>=20
>  				if (pipe_count =3D=3D 2 * count &&
> !data.extended)
>  					break;
> @@ -1249,6 +1255,18 @@ igt_main_args("", long_opts, help_str,=20
> opt_handler, &data)
>  				test_cleanup(&data, pipe, output,
>  					     transition_tests[i].fencing);
>  			}
> +			if (info_flag && !pipe_count) {
> +				switch (transition_tests[i].type) {
> +				case TRANSITION_MODESET:
> +					igt_info("Invalid test for internal
> panel\n");
> +					break;
> +				case TRANSITION_MODESET_FAST:
> +					igt_info("Invalid test for external
> panel\n");
> Suggest to change the skip message for clarity.=20
> igt_info("Skipping test: invalid for internal panel\n"); igt_info("Skippi=
ng test: invalid for external panel\n");

>with this change code looks good to me. =20

Sure, Jeevan. I will update the patch.
> +					break;
> +				default:
> +					break;
> +				}
> +			}
>  		}
>  	}
>=20
> --
> 2.43.0

