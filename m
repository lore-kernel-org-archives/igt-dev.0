Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBDCCCD184
	for <igt-dev@archiver.kernel.org>; Tue, 14 Oct 2025 11:25:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A0C10E209;
	Tue, 14 Oct 2025 11:25:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ETBg/9Xa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAECC10E209
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 11:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760441152; x=1791977152;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4LGNxePKSiPh4EDarapcs5i3PWcKYd7Lnokvm0jjqNI=;
 b=ETBg/9XaOhuB/2vE+MGjHQCMNi1pX3uXKsdQOBRbAntu0MWA0PHiu/EP
 NwNBdq6++WZbJtfvuBCjlRunywSBOkYhFTAovajF0AvgT4Zx2INVefXGw
 V6q6ZhoB8auFkZuG+SguFHrC1Lmj9gZcfa0DXFonNYr4HwkEzmgnngCqt
 aneSZzJKzrP1psGEgWS8WeI/f4XR+SRjpupxfpfg+i4SXUSvKiToAmOtM
 A01ytTo9YsKGspl5o7iCVGCFoI0A9vnbWu1Q8uuE3Op67rHWYCFQgrtXW
 rt3eEv8jo2jHhdPXlsKq+H4K4jZaiq8QNH22TbDi/eiXrbrHywwRWRjYn A==;
X-CSE-ConnectionGUID: kJktKv6KTpO2ZbgDrC8Crg==
X-CSE-MsgGUID: 9GNZmPnERZKtqEb6OMd/MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="62632299"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="62632299"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 04:25:51 -0700
X-CSE-ConnectionGUID: leqlI5cHTOKbJrcbVTb7Kg==
X-CSE-MsgGUID: 9ntFyBKTRNm87+K7p84aBA==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 04:25:51 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 04:25:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 04:25:51 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 04:25:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZ/pqcEDRAv5ay7mL4p+0N9otZNuFkW0Xim+TTHL4Lwnp8mrk0YXpZ588o0RliJRj83kAA8rxmZOLQrOFqgYNnFPVvwdxZI4rFrzohGjZpxhhcfgyg26LCkGdxlEulyYnawpuFXY41qD8wdrnbM7QaSDCP6wY28o/A4vRWouX20tFX46dk5Ne8equG1LJvVMvSTV/0cNo86b4glYMVHoFabq91GgThNRtkeEuV/wJaG4aGUIYZIQs5oz25eTVHekhGL0G7tL+RrM4yefcCZPlXkQh9NETS8ZQvWB6t+VSxyRQAZoxi0sOQIb3KG++8yb4JPgetfxDoh2pB4eK+iYhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PA/jsN37uoobCD0MMfEGKgwuKR3r31gAdnYbJJnsoPE=;
 b=XzsZ6UTaWLjn67+Of153+929sdz61gkkFm7kYKVcdp/EkuFLc/Gcb2BySRGJ3xbP/01gHpeU3GVNJanD/Bhtnt+YGpw9VgGoY8PZD/mpMJ9jwB7XPpdutM3EbXFoniRtBBTO4NyojYWyKSVmdhz7yKJPrCWThP4J7EBZDONlAp6Fmhea7p6qn9sS42GoqvECo4JgLNIQwtawaGsLAgrG2ydQKIoi5/cWOvogtGhS0qH5eu+X70GHL7iyOdqL7nFZX1mY/1+2AjUT5IiT1oXQzIfJtEgksvvPXXLIzbp7azP2V8MHWB6cR71RHk4Lr1DmcTosb1aLQKzm3xSjILtn5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 PH7PR11MB8249.namprd11.prod.outlook.com (2603:10b6:510:1a7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 11:25:47 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 11:25:47 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Manszewski, Christoph" <christoph.manszewski@intel.com>, "Patelczyk,
 Maciej" <maciej.patelczyk@intel.com>, "Maslak, Jan" <jan.maslak@intel.com>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
Subject: RE: [PATCH i-g-t 4/7] lib/xe/xe_eudebug: Mark client done after log
 is read
Thread-Topic: [PATCH i-g-t 4/7] lib/xe/xe_eudebug: Mark client done after log
 is read
Thread-Index: AQHcPO5tR0vWouslBkyCEOasOxMWBrTBfWqA
Date: Tue, 14 Oct 2025 11:25:47 +0000
Message-ID: <DS0PR11MB72644540BA0A637B804EF239D9EBA@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20251014093848.2394531-1-mika.kuoppala@linux.intel.com>
 <20251014093848.2394531-5-mika.kuoppala@linux.intel.com>
In-Reply-To: <20251014093848.2394531-5-mika.kuoppala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|PH7PR11MB8249:EE_
x-ms-office365-filtering-correlation-id: 3f309df3-f9ad-4b01-c01d-08de0b146c10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?SMu60BVcpr9SHElljR/GCYiHwCPESqVI74ZJ+eXevI/8KnmhPhLlyNEuO8?=
 =?iso-8859-2?Q?CRowi97nfoXl+mO3m4waqqc4Mp7G7KGKKAG+YpvCklm5hY7DlhLxnE2Ofp?=
 =?iso-8859-2?Q?bYkw/fzrNk81cHh9qwsOFzIRXGTi3Tr7cE/gc07OizgoPj8QaPV2gim7vj?=
 =?iso-8859-2?Q?UbesZXaSinNwoeg4FYonLzmXL5nwFub7nMBt5VKZM/VtX/0chjDWRtloyo?=
 =?iso-8859-2?Q?5/IDHdwneqHQaCeKhMWfNH82UO+Mh3gSTizlE/buxVY+n2bGtZe8zp/LxM?=
 =?iso-8859-2?Q?jcv+u92tPoiI34x45Ll+SJ0fDyjXcPCLkraPG11l3QnonsdO0FM7dYIMzT?=
 =?iso-8859-2?Q?qHS8bRrjBdqnuYNVPE8EPSNUZbletD78mFLOIfd19L27v0yLa3o3Zs+PF0?=
 =?iso-8859-2?Q?MaB6Z2lkeeNmCkmALqxUMRLyCS7z3RTLz9KrwgJW62vr+R+3Pbok3z6U7X?=
 =?iso-8859-2?Q?TKdoW0n4LTST4m3v5NRcc6Ml7fecNTtc5F3Lb2f9CUmOQoHJaaydu169Lu?=
 =?iso-8859-2?Q?FsRLa3YzqrbZCnFAb6RQA5HYzmc8xhO11Mnu/0qqz1UQrQB55HCLR//2HQ?=
 =?iso-8859-2?Q?BxE8vYWEGQsOq2Mw9p0fAzqLW3YoL/6cVlga1Gwb2U8mbxHfwPCEDcNfdr?=
 =?iso-8859-2?Q?WpfnR+ootS5KvXRw+t7CMO0FAthd1sKV3BDk9QgkmzZAD4bUMRJ43XM3rQ?=
 =?iso-8859-2?Q?9UpntavqjrlCm4PJgqiqjux7qbxdNyylR7uiX61PG1Ab9KAwt/9w+RCXc8?=
 =?iso-8859-2?Q?uyZ/HWUo8gBYF94MlQOWOElavLLokNzghZxAAPK2wubI9PiNXUO4uslR8N?=
 =?iso-8859-2?Q?z5uY7FsqCKCyoRx3sbcyZD8eAD876yDr+yOtjL4YIB8YOv4+yNH5o+XwCX?=
 =?iso-8859-2?Q?WiOGrCT1iprffx0ffxOOo4Bga83jl805UlhxtDyyNHVv+SOVi5ZHrVCJok?=
 =?iso-8859-2?Q?0SCKaJs1nH206YH+f83bCAWw5udjYKd9xVx7xRKLxo/xGYuB9/m+Dc1AKs?=
 =?iso-8859-2?Q?bgPqz4xLdtckPS7S6V9n68vW8ykvHQmiUW168gYIRnZedEocLm/4ZKHjxL?=
 =?iso-8859-2?Q?0ObzOgRjH1X0ZN6fQ5XXN5yMm6lkObRW6axxmPTlyL/xS3hBaWeRAaFcad?=
 =?iso-8859-2?Q?SxwHrfPnYNuGqIP/n/RYP0B5okTa/PSlVyQLEbW9QpY1N/8xNrlBKtEQWA?=
 =?iso-8859-2?Q?8hc3V82AVummXaJBm8vNk1jvguGNkPUhWqUHKKqBzc2wgQQfip+NzfJBre?=
 =?iso-8859-2?Q?NpQ19yVRx9dZgaUbYYf4jgOOXwHJaGwHzJV4e7+8O4R5u72kiHW1/+RrIK?=
 =?iso-8859-2?Q?JiJ3qty1Yj/HSXrAcq3GMgI78fWgXjWuVHQR2HpWMXpKwhufUyjdKqZ/02?=
 =?iso-8859-2?Q?ZtvHKaU7bv4+tMnc8+NrsTiD+VwDWdNmIbkHADUEg5fBGuYnTZwUhWNw2l?=
 =?iso-8859-2?Q?DO7yMwja8kn3AKd6ypb4r9ZGm/cRdkqGPDG0UHBUiJJWD/mawNaEoDhq32?=
 =?iso-8859-2?Q?O9coLj/DTlwbupzz2JO7/2QrMVTIv6CU78xoaQ2tQnyKvzIAGLqOHzM2fV?=
 =?iso-8859-2?Q?82f4j+xz64OEkToUUpeiilcJRBLc?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?p9hS8j52YqgcROb/tNgV/2QwHfYlmlLEKUeLoJ4ur/8HQ3d8txkQDpv9lz?=
 =?iso-8859-2?Q?0ZG/uE19rEBArTKGxXDATvwpBIBwbjmY8SfW1s+3Qgxx64S0DHuA4ghtUH?=
 =?iso-8859-2?Q?An6UzYFowm9L0Z8H4okvB/swyyiH1kDl+1z0pgFh/AvM8QzP2EemtZHafx?=
 =?iso-8859-2?Q?/laejdm2ZSFhKEJQOyrficihM3WT0tbUHzLiebCstQjgp8YIF98C6hUxqG?=
 =?iso-8859-2?Q?hxGO8Q3hVzlQqgmxTJPEcyTuIQht3RS/tzmqimqhFDeVE8FeqlpO8YGaE6?=
 =?iso-8859-2?Q?xrtQN2whugA3YWKGAzdqhNA/ewKjBViaRv55qpsvWL7uxn2II0nD01RBnU?=
 =?iso-8859-2?Q?+hCENFRN2qRNyNUef5hqprqpvYWbmRoND/1oeYnIp6z+kRJdKBmUgWBO3K?=
 =?iso-8859-2?Q?EPjJQQkwBFMAgB935TkNi47v+58TslRpU4XzofzXFzfFRE0wWSt98nhY5w?=
 =?iso-8859-2?Q?Wn/mAs4+RWMwkLIxDQipkMXwRZd3ElRxtqx4v2QYl0FVBCTOaYg0V2/j/q?=
 =?iso-8859-2?Q?bxTPezL31CfsQTXokuTQIQ3Gnfsbn5o8Lplt6Fs6zzXrpMgXBVXP3VoYft?=
 =?iso-8859-2?Q?7H70pkXg5nPeBq85CHCQLjlh1ifW82NhC2+VTw+5/uDEH2ruauEnIJQK3E?=
 =?iso-8859-2?Q?vtpsSp0gcbA4Jut8+HHIzU0pn/4q9Ckp+M3kYW7EFImZFvLoUFdTFregl+?=
 =?iso-8859-2?Q?bDDijMWVxLxPkUXEwilmXizbZMUIzpzvEqMvBGvAs361XuGxTRFlcPy+iy?=
 =?iso-8859-2?Q?cb/C+5sr/T/NECammIIsJHUEXiXIS3xUcJjHib3H414oytylBBc2fY+2DQ?=
 =?iso-8859-2?Q?T2WfLgt1h5EPZBeMlODtdMvVyW43x+gKkEYnfda3nhf8VHIQr3NhtAH/dG?=
 =?iso-8859-2?Q?m1xEVVEvhX6we/Te6tDAgvCzvFGQimfx8PN3OMHkTDsKqLz5G0MAlBzS1b?=
 =?iso-8859-2?Q?14GFMXvGbs3NyDkpbObl+XihBTNhnMTmnfcFUYTOocEgdcWZqjHY1TZ89Y?=
 =?iso-8859-2?Q?enA1CFP0mxVWr4bTRnCZ5NEcCyWro3T7wFwnUTrhlue4pFd5bGOLEPAmjI?=
 =?iso-8859-2?Q?/waC30n0ZjAYLbHINjL6jNvNRy9xulJuIOffCUgF10EPuMcdCVUv2XLRZk?=
 =?iso-8859-2?Q?gqbLx9OMttQ6LYfwcvXJFdLYPuCt1a3HrPYypBcWeT1TISuCuem/PGPXL3?=
 =?iso-8859-2?Q?zS4mUzgvx6LPoz8490JRJTsTMCbQw8EYnxtL9k3WhzDCIqBrMvcXGgtCh/?=
 =?iso-8859-2?Q?famEyTxxXrYIH6LkQIP1eM0s5RAkHR7DKB7XrUhgW1qYe5ZYSosXwEDgGd?=
 =?iso-8859-2?Q?4rt4CmXhn6ttjdl5Uz+bkx9U91XeROmEgodLRxRSPgt20Eti7voN2PbfEP?=
 =?iso-8859-2?Q?MwMQqImmxmTlFmXQVACwv05tZi65USd0Yu53I7VIJMmNenirlN9m86shLH?=
 =?iso-8859-2?Q?Yvb6p+gmXMLMd1oi9jZd6nGVJ5DLU1e5jwRxsH6UIrccvS29kQsla7sZrY?=
 =?iso-8859-2?Q?m0gGSBWnETOgEgP7k8Yi1QUmxKpnaUt0kfSzH4p3+gPSxSU7tjJuqXUG3N?=
 =?iso-8859-2?Q?MSYGN/2/N5Ue1oElm4qlCz6ZFJvqqXBwMwAjrjHLY0rpcGOi41vEhWW++8?=
 =?iso-8859-2?Q?H2s1CMsEmJLopCqUHEXl7tn7SewJ547amI2l8p4uMyVqbGqqudlQdWsg?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f309df3-f9ad-4b01-c01d-08de0b146c10
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2025 11:25:47.3060 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tU73xdl99iD64C9ugJ4UoBu+wWV8zD2gVb5Jpuo3YXhjpdvMtumTafwHX+JMKGgoinDOj+ZR2mYWkNMYaNYWl1vnjQ2LXeT074+kaRFETD0Ia6Mk7g3durO6i7fYOlFJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8249
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

Small nitpick regarding commit message, but otherwise:
Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Sent: Tuesday, October 14, 2025 11:39 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Manszewski, Christoph <christoph.manszewski@intel.com>; Piatkowski,
> Dominik Karol <dominik.karol.piatkowski@intel.com>; Patelczyk, Maciej
> <maciej.patelczyk@intel.com>; Maslak, Jan <jan.maslak@intel.com>;
> Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Mika Kuoppala
> <mika.kuoppala@linux.intel.com>
> Subject: [PATCH i-g-t 4/7] lib/xe/xe_eudebug: Mark client done after log =
is
> read
>=20
> Dont mark that we are done until the client has send it's
> log to session to avoid teardown too early.
Nitpick: typo
Don't mark that we are done until the client has sent its
log to session to avoid teardown too early.

>=20
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  lib/xe/xe_eudebug.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index 0989330b39..84309043d5 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -1614,9 +1614,9 @@ void xe_eudebug_client_start(struct
> xe_eudebug_client *c)
>  void xe_eudebug_client_wait_done(struct xe_eudebug_client *c)
>  {
>  	if (!c->done) {
> -		c->done =3D 1;
>  		c->seqno =3D wait_from_client(c, CLIENT_FINI);
>  		event_log_read_from_fd(c->log, c->p_out[0]);
> +		c->done =3D 1;
>  	}
>  }
>=20
> --
> 2.43.0

