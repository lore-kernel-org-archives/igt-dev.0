Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CBD7CD3442
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 19:06:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F61F10E2C5;
	Thu,  7 May 2026 19:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aNhdqFWr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB32910E2C5
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 19:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778180765; x=1809716765;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=8g7cCAW62dK0XnWYHfemkaDy+plYfrhp7PVSTgHPTVU=;
 b=aNhdqFWrvOpnPCIS5TWJ2OhRZtzHmJYtyUjJGwVPVupzR0YPiMqQPM0H
 FbDk/nffIKBT0/K+yqZuORfDdRr5B9QpC2M0hvO+KJYa4M81mCbJH9asH
 AvfC/zNbEYEElgB0iqT1B9c2g+vIDnYqVzivgb96iPeifxKXYFipdXiIS
 4wM7aK3EooljgxsYLWkmaLBWFJXUZSRIy1VA9xS2gpPU/JOZhUrS7ixxD
 0qCbU0TLlVhle92QdQsWv5izkv3ltYFjufAHPq+h2tPYHhn3INODTAkh/
 G/O8rhz0lgnklyhNIMd2V/4mQ9zkX3kzL/hz/gX9klGE8WzrZS+bVCLXL w==;
X-CSE-ConnectionGUID: Lu0blibnTXuHTIWgPsSjSA==
X-CSE-MsgGUID: K+Hohqt3RPih0T8T6uGXHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79159704"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="79159704"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 12:06:05 -0700
X-CSE-ConnectionGUID: u3uNNigdRZOEFoHjBgIRoA==
X-CSE-MsgGUID: IkzuSbyzT5G2eDnk7sSPbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="266916637"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 12:06:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 12:06:04 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 12:06:04 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.19) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 12:06:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J7O6ZDWmNvQWQqNWeDry/gzrElY8z/HrWeFVv9X5S1QyD4plrOBro5MvNlKsuYR9jvjkXL84gFPvKt31tItTLEXH5TaA19+GukqIf5BSSMZQnW5p/QsQ3Z7zVYIWp+9AE06Hygt+Ef7LROhfNzxMTiCrZAE2KYzt+0B+X7/kQeXfvK8UcPwAPbdGLnlJGIVLrYwy5vLj/UU2739707zQnNXRfbG1/ZFWa+61kZEYgqvStw9UDLp8+Lb3/ts2e30eRdW9AvtJB6hyQ5eUvpEMhxc+feiSFnhI1lmlquct+9sVDmNxiky5TmDb065vifnI/cFDMjSA85Kahq6YCHpAtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8g7cCAW62dK0XnWYHfemkaDy+plYfrhp7PVSTgHPTVU=;
 b=E3HgdVlgJc9v+tLEgiHxemwXSZSvIwv3nEg6ujr9F87gPaF0IJr/BltVLS5tI2u5O3+bz4KfJmquBmaUr28jbWgf0+zFbcqa/1PAs4soxdvALhVnDgK8pLl5eOwHjPZEywI/yiTjrjwoaBNAQ10Hvpwi7b16EkRSdY4r7FCva85kqfZV5do9AV4eKimmow3AuieZT1iv2QyLBQsgdTVoDXcAHbBepvIB6XpHySLPZ1FwaT0kKhTv/nQGJbqKaeI/Y7NBWd9wiXaV3fJdafkCdNHwPhQR/uG7W/bl2dtVuzCXpUt3yrKTZYXfenUElLgWKatPAKglZtxBVsNCB6KR4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DS3PR11MB9842.namprd11.prod.outlook.com (2603:10b6:8:366::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.18; Thu, 7 May 2026 19:05:56 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%5]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 19:05:56 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Wang, X"
 <x.wang@intel.com>
Subject: Re: [PATCH] tests/xe_exec_threads: relax data check in multi-queue
 hang mode
Thread-Topic: [PATCH] tests/xe_exec_threads: relax data check in multi-queue
 hang mode
Thread-Index: AQHc3ZruhooyCBjzXUiP7MXClFj9arYC7dmA
Date: Thu, 7 May 2026 19:05:56 +0000
Message-ID: <704dd473ea9651a2911b59e3abd12e5051e673a9.camel@intel.com>
References: <20260506205650.20503-1-x.wang@intel.com>
In-Reply-To: <20260506205650.20503-1-x.wang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DS3PR11MB9842:EE_
x-ms-office365-filtering-correlation-id: c193409d-4b68-43d2-021d-08deac6bab24
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: AxDMvCNqP7xzeruo5kHR8/xyl3pOrFoCekcr8FSnutH/IZyUlCLYl3z/y7OOYKZxxzSFAUgEg0wSOBZHRusDJ3ftNEw10uPx8tVODGt1whmHicbsjeakprG0q77SRJx+cWgIusAxLEWSfVQxRZe10ObRtTFMpxbAZHL9UKLTF/hLH1+gEzL611JAyk9uA8l/bf78GfwU3BTBEhLMC35dinOFwsVOrWFF0Kb9ZUtPoMcE5sHZeWIlcb2jmBy36eUEhKu6bu8dsC95iC8lGwJ9pDQ7Ho/D9nYaj42AcaeMi/6Yfzr92iH7RrQqInZpRDAslw2RTrREKOSWvLIHiH741EpXqGyExoi7D+fhDGP97Kmg1eiNgoAQD2YaGhQeTorOVHhbvQmY8BMv3VxDAXxQlDQx9ZQomQVCkzS5wfe2BgLe1IeXyIOA4tkO1KfppcB0i4jy03CTd6sDEnrEjRyIJDYMpP3o2rMwyPmqERYQbJ6XzNwep2exTd0EoIkgec6dgnnJeeBIsgLtR4gSyMSiqc8769AHJyeOnQvSMbTKf38kBMBR0sj7hS7Qw5YZH5dxdzyFihOxjmwOR5vy2OSo1ic4WaP4zJ0SIhpeaB17VfodZnkSbFsibFT0gl0A3THAS5cZsI6h0a4onhGJ5iA6j1BFPzoWjHeIBCQicCPQzl3Dx4W3epYSNewd3KID1zMMPhVI9E9d1rtaL/HSGeBGrXej63i/LW1tgXfzyKWI0gM1oLVFfGFhIkjELwND/sBt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bUNjU1dKWjV3NnBVRzdtaUluU04vejZWL0RBSjg3UTNqZ21mTkxzUDVJc1Bi?=
 =?utf-8?B?VENlR3NwcGZFZ2RmTXFiN1cyVVVPZnlZMzZMZ0lKd3JHdUZla3RIUk10SkRH?=
 =?utf-8?B?bGxpNGREV0VtdGxaK3JMeDMvcUJIZE9EZEdvR3IvN0hvanJxNm9ZWG5BRC9r?=
 =?utf-8?B?YzR1aFg1UTBodmhFWnFVdkNaRktEQmprMDBObEs1M0lSYkVYRmprNGRpS2ZP?=
 =?utf-8?B?dW1OaHBiaHA4dkNXTUxUZE45ZE1VdVRDN0U1RyttRURoZmFCbmFWRDJFUmRJ?=
 =?utf-8?B?ek9xekpySW1pSFFmNXVnQmFzVlBBREhGdTNvbnlUQUJBd2ZyTmgvUmN2QnZP?=
 =?utf-8?B?MDJaMnV3bExKUlFTMDNsNmJ5UmN0bmJJTDJnNmp6SHJpY2dLVVVGK2g3U1dm?=
 =?utf-8?B?N2Q3MmhsSW1MaDR5OE45aVVPbEhjMnVsaWphQkd4Uk5aeDlUVytJRVpOK2My?=
 =?utf-8?B?ZWxwMndpb3FwY3l0bUw2Wk1SQ09JdGF0a29SaG1vNGZjeVEyY1VTOGJtNjRt?=
 =?utf-8?B?TE40WHpDb0hyb3JBSkp2ek41UW1NZWRnM0tIUllCMW5LZ1FnVUl4ZTNPb0ZI?=
 =?utf-8?B?cUYxZmJaWDVMcWlncjVyZysyR3ZSdG54K0tST3dJbE1EOHJKWE9tcUVSZXE1?=
 =?utf-8?B?cW1RZFRLZU1HaTU5SVZiVTdMUSt1MlYzNGl1eEllclY4ZG1BRHEzdGtCNXY2?=
 =?utf-8?B?M09rN0RYOGRkRDB6U2w1VnlPZ095OTlURnUxQkNLdGJkK0pRZWplaWNHemlT?=
 =?utf-8?B?SDVkZlpjWUM0WFBvU2VJQ1c0YnZoYkliaW1OZFhvMURpdXZnWTRSaHVpUlFM?=
 =?utf-8?B?a2xHei8xSnBpZytrWWx2NnR0TWpwU1k2cHhsSWpVYkdQaDUwaUFTNEtaY2lt?=
 =?utf-8?B?VmcyODNZaDM0d3B4RVRLNlVMMnAzWWw5eDI3Uk81SS9PcitrY2N3aVVoMVZz?=
 =?utf-8?B?UXVzQ3I5MW5ZYTFqUmtPMG9IdUZTM0dTUllpblEzZzl0OEp0NnppTTN1Z3dM?=
 =?utf-8?B?WFF1YStIa3BtMjF4ZE1aWEx6eGZWQ0Fldi9lRk1BY1U5RlBZUWlzRWMySTFR?=
 =?utf-8?B?S3JBTzJ4NFAzUXkveUtzZXVzNm5TUksxQVkreXZFZ0I5ZkFUVXp0ZVlYcFlo?=
 =?utf-8?B?cFZmM2dzeG9pT3FsZDYvWkVLUzllSjJmejZDcEtoK1JOY2hmVVhWWGxLVFAv?=
 =?utf-8?B?MVVtemt4U1dwKzdOdkxtTUwzTDJDc1c5YVM5TEZaVndQUmNmSzdaaWFndTJW?=
 =?utf-8?B?cnFvSVpyK05sVjd4WDZwaEdqNUFkZXJJQk9tajRSdEtSV0JzUmtQRWxrd3Zs?=
 =?utf-8?B?UjBNOC8vSEU5bjNoODR0M3lkQTJ2ejFlRnArVmxIRExVbXIwY0U5blIyMVVP?=
 =?utf-8?B?YWpIVUdJdEhtaDgzUmpxOEdhR0ZRTUVScEpRR2MxYnk5NG50Qnd3K1RsSlFP?=
 =?utf-8?B?WlpOcVV2NGczWnpRWktyUXg1Z2YxVW9hNlRMK3djNXRxaUVxb0d6TFBlOHRO?=
 =?utf-8?B?NjJkanNOdkhTK05ld0Q1Zm0vYWlwM29ORnRmMzZqdTdCNjNDb1dTcGxYOFd0?=
 =?utf-8?B?aWF3bDhOUFFodmRoYlhOQmROdGhaR1VpR3hQcUpWVnhTU2s1OEdlc1kzNm1x?=
 =?utf-8?B?UWJkZlBBY2JSTk12bVZYZzRhZ2tiY2JlTFFtVzMxMENhdjRvTC8wVjAxaCt0?=
 =?utf-8?B?NTgxZXpwdEsyRWIva2pnYnlCVG9YUTNaTmlzRVJGSWt4UWNTWXFpZkg2K0o1?=
 =?utf-8?B?Z0ZtNHJPaWZiZC9HNTNZQWVMdVZOelZLaThLa1pSemNwc2VkY0hDMmZBenRE?=
 =?utf-8?B?YXI2RFlieHhiQjh6ZFRWYmNBM1pPbjZJT1FzRmxsS1BVbnNqbHZ0VVJnNUIr?=
 =?utf-8?B?MHBTQlBMczluRFNtUGRxUEpFSzU2UStPeHV1T3dwaVB1dzdtRmdKQVMxVW1Y?=
 =?utf-8?B?YUFNUHRiUi84U3hqVmZQUTZJV1ZHOTd0L3hiUURMV09saXA2SndLR2RkUjJn?=
 =?utf-8?B?Sm85K0x5dGc3S0RHdEYySUI5TVRkT0tSTXVHK0ZCYkNhL0IrNnJrVDBoUWJz?=
 =?utf-8?B?Y003UXNmYWZWaVFJTUdWb2VndzZ2YVpZaFJzSVRzT3JkUEROQy9VT0dQaDRw?=
 =?utf-8?B?QzNSR3picE9DUFY2NmZ1SlRaNkM4cDRmQWVkT0ZQUXJ0ZkVPQTZqNlJONnJW?=
 =?utf-8?B?bXZ3QXdrTS9sT2NKd2FNc3NvUDZQMHQwM3I2anRuQzZBZUliT011OGZGcTNv?=
 =?utf-8?B?U2xyZVZnSGl4eTFNc0tVL2RKb0tiblZpeUtKdENRMUx1T2VSQm9wN2RLeURh?=
 =?utf-8?B?UjMwcUZ4QzBHenFoR1g1dVVoZmkwQmcxK2RtSzlZLzFsYmpqVk16bUdqc21o?=
 =?utf-8?Q?kOfT/GUk2lWYJmBQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D850351534EED44AB49066FB180C930F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ZYmLm6jSO1dwB27q4vBQnNi8ttbrW1fwMcy+N4z6E54ANFBkfg8YefC5ci4QWvmKlC7sq8heP0Zj2nC1z0WCiaFjPLTMwyr2ffEFrL31b54ypgLpcv1mFXy6xSmnD72uSBn2V4WiSVmk5W8tGD1a69bnjTG4KyNOc39Ma+kngCTv5ghjsctuiQpx2BmrGeVNC1AGuGZRhOL/NfvGdClzBJbegmWwhIhfx0zWWLokE91E74g+CSDVi+0ABjqu8UQHW1bgBlIyskSRSoGfjd5IWTU7Fj73y/pWwtci8gW4Av2BLjURINd9PLXCKABGNjZ1nZW4cI8b2Vgvfdu021OQIA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c193409d-4b68-43d2-021d-08deac6bab24
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 19:05:56.5514 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IBK0WFeiIp4s0xw07S106Z3SCrZbAeOGNj/TiYyjksNF9VpAlEEV0H05VSJmkJQWO5lPTsTjP1A/WsrgqzAudVYXzmjYwoMtay87a0/GpD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9842
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

T24gV2VkLCAyMDI2LTA1LTA2IGF0IDEzOjU2IC0wNzAwLCBYaW4gV2FuZyB3cm90ZToKPiBJbiBt
dWx0aS1xdWV1ZSBoYW5nIG1vZGUsIGEgcmVzZXQgb2YgYW55IHF1ZXVlIGluIGEgcXVldWUgZ3Jv
dXAgd2lsbAo+IGNhdXNlIHRoZSBlbnRpcmUgZ3JvdXAgdG8gcmVzZXQuIEFuZCBzaW5jZSBHdUMg
b25seSBzdWJtaXRzIG9uIHRoZQo+IHByaW1hcnkgcXVldWUsIHdpdGhvdXQgZXhwbGljaXQgYmFy
cmllcnMgb3IgcHJpb3JpdHkgZGlmZmVyZW5jZXMKPiBiZXR3ZWVuIHF1ZXVlcywgd2UgY2FuJ3Qg
Z3VhcmFudGVlIHdoaWNoIHF1ZXVlIGhhcmR3YXJlIHdpbGwgcGljayB1cAo+IG9uIHN1Ym1pc3Np
b24uIEFzIHN1Y2gsIHdlIGRvbid0IGtub3cgd2hpY2ggcXVldWVzIHdpbGwgY29tcGxldGUKPiBw
cmlvciB0byB0aGUgZ3JvdXAgcmVzZXQgYW5kIG5lZWQgdG8gY2hlY2sgZm9yIGFsbCBwb3NzaWJs
ZSB2YWx1ZXMuCj4gCj4gU3VnZ2VzdGVkLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1l
cnNAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFhpbiBXYW5nIDx4LndhbmdAaW50ZWwuY29t
PgoKUmV2aWV3ZWQtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+
Cgo+IC0tLQo+IMKgdGVzdHMvaW50ZWwveGVfZXhlY190aHJlYWRzLmMgfCAxMSArKysrKysrKy0t
LQo+IMKgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZXhlY190aHJlYWRzLmMKPiBiL3Rlc3RzL2lu
dGVsL3hlX2V4ZWNfdGhyZWFkcy5jCj4gaW5kZXggNDBhNmMwYzZkLi45MzMxYTNiODggMTAwNjQ0
Cj4gLS0tIGEvdGVzdHMvaW50ZWwveGVfZXhlY190aHJlYWRzLmMKPiArKysgYi90ZXN0cy9pbnRl
bC94ZV9leGVjX3RocmVhZHMuYwo+IEBAIC03MDcsMTAgKzcwNywxNSBAQCB0ZXN0X2xlZ2FjeV9t
b2RlKGludCBmZCwgdWludDMyX3Qgdm0sIHVpbnQ2NF90Cj4gYWRkciwgdWludDY0X3QgdXNlcnB0
ciwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaSA8IG5fZXhlY3M7IGkrKykgewo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50IGUgPSBpICUgbl9leGVjX3F1ZXVlczsKPiDC
oAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoZmxhZ3MgJiBIQU5HICYmIGUg
PT0gaGFuZ19leGVjX3F1ZXVlKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAo
ZmxhZ3MgJiBIQU5HICYmIGUgPT0gaGFuZ19leGVjX3F1ZXVlKSB7Cj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X2Fzc2VydF9lcShkYXRhW2ldLmRh
dGEsIDB4MCk7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVsc2UKPiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlndF9hc3NlcnRfZXEoZGF0
YVtpXS5kYXRhLCAweGMwZmZlZSk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0g
ZWxzZSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAv
KiBNdWx0aS1xdWV1ZSByZXNldCBhZmZlY3RzIGFsbCBxdWV1ZXM7IGRhdGEKPiBvdXRjb21lIGlz
IG5vbi1kZXRlcm1pbmlzdGljICovCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBpZiAoZmxhZ3MgJiBIQU5HICYmIGZsYWdzICYgTVVMVElfUVVFVUUpCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgaWd0X2Fzc2VydChkYXRhW2ldLmRhdGEgPT0gMHgwIHx8Cj4gZGF0YVtpXS5kYXRhID09
IDB4YzBmZmVlKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGVsc2UKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBpZ3RfYXNzZXJ0X2VxKGRhdGFbaV0uZGF0YSwKPiAweGMwZmZlZSk7
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiDCoMKgwqDCoMKgwqDCoMKgfQo+
IMKgCj4gwqDCoMKgwqDCoMKgwqDCoHN5bmNvYmpfZGVzdHJveShmZCwgc3luY1swXS5oYW5kbGUp
OwoK
