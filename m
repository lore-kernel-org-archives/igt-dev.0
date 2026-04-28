Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F4FFF885A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 21:13:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC40F10EDBF;
	Tue, 28 Apr 2026 21:13:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RBjOhX43";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5EA10EDBF
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 21:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777410818; x=1808946818;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=cDjgyJy8xeHrbrBzrRPmMQb4SBGt31NaX0fBcR0oaic=;
 b=RBjOhX43gO0NdLBA5IrhG20ivLFOO4+b0pL1MQhrCiL1XwRi7Bz9yLKM
 TtetDc4bydCVTFGVgYLLMAAM5PEnIq6oAW2w0h26OCqDOWe83tN/qCBgH
 zcE8hl+l4f7GaO80qrpnJRfFXVy7N7ahzST7FlSsC9QolpsYSh17cNGoC
 SEG/RVR3SUs67bC7zAUMSMAEzzCLr3W2E8WqA006svaIN3hw61Z4vKnpe
 MPmDpa5nafvlk7CSGEJlcf779mcAouOYPH5NVeDrUg246vccw7Wg0YRlA
 1ed8dWv6KgzEWSjSqnXvVKeR6TT3bElFI8Hzd0tXM533CuY8z9urJOfNk g==;
X-CSE-ConnectionGUID: FfJlG6iCR0KeMJZi7q/EpA==
X-CSE-MsgGUID: ICTYhOpDTt+Y+LAWhRKtTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78249046"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="78249046"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 14:13:38 -0700
X-CSE-ConnectionGUID: zkYZzwY1ROCNfnApj78MTg==
X-CSE-MsgGUID: y1aQ05FET6O5QZRR3lzCtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="227552980"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 14:13:37 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 14:13:36 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 28 Apr 2026 14:13:36 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.38) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 14:13:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QxlKD7tBybpAk6WtTQ87cZ5xm9Mh591wJXrtGR4G69N9WhOpl6mdWfUdGtkJyLJmdo1gMVPpVnOG+V2g7Dic+MimmnF+BdWE7b2B6vdJGPPmu6M2HVLwLdowPTf6RqMuqeCCkw766u3Hftol/QBdzTzkKYo3sZQQqJzm9kCh8ZjpLaokM7AT+xTaIQsnN69nB4p1uF6kvXKsmun9HM4nSICgOph1DdD43/vnWjJHp5iRuzhYqvi96t/YvxRU31vlNtWbTrhKzEdSXxqs/y7qyP25uP72On8PAN3yELIfV396EVar/oXjixkk55gvRoLBDgbT0XYSoQi622HKOUMx1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDjgyJy8xeHrbrBzrRPmMQb4SBGt31NaX0fBcR0oaic=;
 b=ZZ6osfnswW+H3mV4oIrrVNJHS6qJ8olgYpxFkv7qq7Aret06B59uPLT3dXxffenj5IxgBzo8cUTHzjzhRTXx73RUVAD20lV8wKE+VwhnuxN44cVBVHEJqmNpwFf2vOgkz1d8x81uqEoWvEhfSXPLI+EOsNImAbUbRFXU89qDDU3Two5FwrP4zbETbYw+tnkJRlB8Th8xGXKJdeulqrb5RCme1fB0TdJVoKGfJEnei4FJicM77c4s/WQ/r0Z08KG7AUpYfXjMU4F4l0XND6bheckcAEAgeC7JmgBWGN4vN3QPyCZkrfwFC2Z026Z83FQFME17wsbAMIgp+vZquF5lRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SJ2PR11MB7453.namprd11.prod.outlook.com (2603:10b6:a03:4cb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.17; Tue, 28 Apr
 2026 21:13:30 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%5]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 21:13:29 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re:  Xe.CI.BAT: failure for Add test coverage for multi queue reset
 (rev2)
Thread-Topic: Xe.CI.BAT: failure for Add test coverage for multi queue reset
 (rev2)
Thread-Index: AQHc11PcGT4rdg/1BUCGuzcVP0hKwQ==
Date: Tue, 28 Apr 2026 21:13:29 +0000
Message-ID: <0cc019831ddbdff4d8055e0dd42095691ab7b705.camel@intel.com>
References: <20260427212034.18486-1-stuart.summers@intel.com>
 <177734317871.16746.4953414507810050609@5ab824fced77>
In-Reply-To: <177734317871.16746.4953414507810050609@5ab824fced77>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SJ2PR11MB7453:EE_
x-ms-office365-filtering-correlation-id: f9c71a13-387a-4f9b-3a9d-08dea56aff2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|13003099007|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: uY8tbeOA9a1RwTyXfs+9bjqz+CjI5SyDxeW7CaFRdhYF0ZdkadUziHMaKMoKIZdSsD1YlgCcKIlpqTxZ9SW7xhU7jK7Etw8Iz8YOIbA8PodKV/plK9ofj+gpS87cGBGTjUQsj4BrUz54+VTtnQ6eXQ+wPAvfBzSfI7j5V1iAKtmALjfLgrR1Fk3dnZJPOsN/EIuskaD1LmrqE64aIkBotOpjgbihGwS9tKB6dLZjPdqzJlUkkpAZhFRQ5gdkMtTSBgMSR9TW9MJG1zTYvkOSXTvzitU+orVNGrXfbYGr0PYB7RMfJrSgIpc+KzX84CYHS3CeLqVdMFZeCZpfBNUc1HbTYViYhvrK4U2HDFSh9sRhB/Y/GpyKjbpmJ3Wy9CuAR3rn3XR4vQPvNDxuedFMH4AwUXPg/riyt3vwNm3H0GFAutNmINb05ZmmH81nWdhIYw61u8bbTEyi/3vLVJPUeTCLLowfiJcfFmCO5AlR6SAVfSPX2ajgYPmjRFbEkIqmn5b6AngGHZMPTQvbYeNZU2GTpTbGEat/Que4NtYK4XdmaO7rHMjwpUynHXSqJctBh6yiVe6kYZiYiJhlod4zzjYdmO34s7PkM5PbSvNa/2wiCzjQx/yRMsLOqaWemr/g2tIuELozQyj8VBC8wuq/Kzs3FeKG2sjmE8scai5/giSyRVIyvbHkt8Z6U/WtdZB3w+9DepkneDPWyptPtIMnBTA4uGk7y1wnVcfT5LGXDhZ/WGraZPMV9kzoUFxWF7Ov
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(13003099007)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dXlOQWxNZ2Flc1Z5d0NlUmhzRGhEOE0yUHpOMVlXNStwck1lOG03enhpQ24z?=
 =?utf-8?B?cmUzNGVmVlRKTmdDd1JPN3NIL2FnRW94MnFiaVYyZ2szaG9UeEpvTDMrNHBO?=
 =?utf-8?B?QWNYNnJzR3JxWG5SbllkOHZrUFRyc0xWdEtGK0E4RWd1TTd1T1JmNndnZXE1?=
 =?utf-8?B?MVpNdVlKZFlpWURPdzFtZXJVNnhrVFhhMUR4aXdORUc1VUxHbituZzhEclBC?=
 =?utf-8?B?RWcybFRyd0tSWDhHeVA4ZkZ5dTdOai9HNkFjK1FSNnNVMDBxZUJJQ040Y1VM?=
 =?utf-8?B?NVpicy9qU0V0MGNaZjFlL1NFNW90R1orN1A3L0dTQ2l6STArK0ZKZU9ybzFl?=
 =?utf-8?B?bWU0MjV1SjNPRmsvdUJIWmlJWlZYQnhjZ3pHTDFGbHpTS0hUdWlxRlhNRVhC?=
 =?utf-8?B?b2YySFRCd0dBODAxTWVSdGxnU0M0L2hOaFFOWkVFZ1IzZ2h1UFU1NXRmOGJN?=
 =?utf-8?B?VndidmhacHR2dmZRQzViWW9JbUtDaWZUSlV0UnA0ZDY0SDhDVFc0ZkN6VlpG?=
 =?utf-8?B?QURMVTlsMWN4dXVsVUM5U2JqZG9kbWtJRzk2eVRGWW9YcDY5K2p4aFl0K2lo?=
 =?utf-8?B?bGZGRjlzemVtZHNwM2hFNDRTZUJmRngvRnlhamZoWGZ6L3Zldmo2U0NVaGh0?=
 =?utf-8?B?UWU5bS85WENnQ0s5cnUyclhpaVRZUlg1SzI5SkJiUURYa0JFUnZSMUZXKzI4?=
 =?utf-8?B?TWJYQU95d3FrMmRUQ2htWk9qTzg2dVlmb2NjR3UxQ2tUc3NkN1ZHeFBBdngr?=
 =?utf-8?B?Y0VjR2E2dmZ6aWVJSW5YNTlHVzdaYTVIemRTYkt4czhSZklLbUovSVJVVHg3?=
 =?utf-8?B?eXRUTy90UXh3RnZwWGtPWkpJRC9MSHhMQlBScEh6aThXQ3AvMUlFTHUvVFZE?=
 =?utf-8?B?dDNuaG9KM2w2VGx5U3lkNW9MUXd2K0toMGpVRFRTZXg0WU1pOGRrVmRLVEU3?=
 =?utf-8?B?NlB4NVNEZlB5RHVJN3plK3NtQnFyQW1PMThDdlgxZHg1Sm9wNEZ6ckZJUEdI?=
 =?utf-8?B?VXZiMG1yWWVTWGFna1ArYXpDaCtRRmRhMU95NnpSc2pXRlFVVFBaOFNKdGZP?=
 =?utf-8?B?Y2lYUHd6T2ExcWVHenNqWmVMTkNhR0J4cForemRqUWQ2dG9qeFpuZTQ0UTNa?=
 =?utf-8?B?L3ZoaGgvUlAyMzNPcFZlK0tDU0Z0NmN4SDRmMTlWc2FRVjdwMHI0KzdGRnFE?=
 =?utf-8?B?M2taUHREY2M3UXlaZ2hrcm82WWNxZGJicllUejVVelRDL3RWZW04b1Z6OUtE?=
 =?utf-8?B?aWVwV21jcWJmMnNqSUl2Z3JKMmRwNTZQM3hwYjU1OFhuRmlSTFhJUThiaVV0?=
 =?utf-8?B?cDBZM3ZGa1lmSTJYa1pNRTJteEttL2NvWmV6eHo2Q0l4djBDVld5QXdvSjJI?=
 =?utf-8?B?UTRzOUplSzVDRWdFaitSaCtUeWYrU0lpZnQyd2M0ODUwRDNRUnFxNHFEQjdm?=
 =?utf-8?B?ZzJzMFNEVnRkcndlYnFUWEU0eU81N25ScHRYQlJ4OCthcXJmczl1eTlieXk0?=
 =?utf-8?B?dnI3OGMwUXFxWTI3aVJuR016RVgzNjlQNzk2akE5RXN1OHBKc1I2d0hKNk03?=
 =?utf-8?B?VjFOcFhQQWwvd0M0VXZVQWkySk5tNCtReGFqNXdPSCsweTZIMGdTRkd5QXFv?=
 =?utf-8?B?U0swS1hwNXNDRytIeHRiNXFvZXNQV1lrS0gxTVpQZExqdE44dE5CVUZuSm9s?=
 =?utf-8?B?NXhySEwwOFpKYWh6THlKL0xOL1ZScjBvRjUwRC9UeVdHVEMvYitVb0V1T0dV?=
 =?utf-8?B?d3RpQ0kzRTZFSmdEUFE3VEJvZVJUQ254YmQ0THYxbGs3RXlIRDc2Q3VGVUp3?=
 =?utf-8?B?WU9mbVZaeXFJM2ovZ2FGanBhZGVHRU1maVpWTko2NklDU1VPRFdGQThqTzVI?=
 =?utf-8?B?ajFkS3RQOURlSGt6bkRxTlJ6dEZHaDFHMitiQUVYNnUyeTJNY0d1Z2o0MEMy?=
 =?utf-8?B?dDB0ZDBJOTVMNFljMXUyN0lVSHdhWUlnMEswWEUxL1BIZEN0ZE9tODdMclZi?=
 =?utf-8?B?aDRCbDZreWxwNUg3bk5IMkNmajBtZ0NDWlB0T1hrRTBVNDJja3ZFd0VtMEJ6?=
 =?utf-8?B?eGN1OVh2QW1jcVBHMlVjU2ZHd20yNEwrZWJrSXd2aVFTRFUwUXd6dEtMa0dZ?=
 =?utf-8?B?TzRkQkJqb3lNUkFHL1JpTE8yUUx4YS92YTVaMlV6dFAwak55K3JzcG9FUnk0?=
 =?utf-8?B?emVpYUVuaGJFRWNNaGhERy9SZ05HVDBScnI1VWdvcW9TdUNmTXJBMGpEeW1o?=
 =?utf-8?B?ZU9uQmxkV1loL1VFaXFQSm5uUi9BUm5XcXlPZXZMOTMyKzNXaHpIaHU3YjVY?=
 =?utf-8?B?MTJTSE04NGZBY3JXbkMzL2hmekpwSVNEZU1ZVlEzWlFIWitZY1dReU5GM20v?=
 =?utf-8?Q?EOyzupQuGEyubmKw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B3085B082BDCB45BFE00C11FB9CB33C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: WkjQB8NL08J6iv4ax351mTFGn7dPNVPN1edKZ5kh2nqtW2OKQ34noVlP2Re9W02r7WwtIsiKdaah7bP7vkr+oSm7aU3Ax4kMWTbGVhd/8ChU72UG5cUze5eypQphMRLc3DmeiHCGT1QtjhTbyxKonPA92qJIok8HTC9poGAWtOqe3aJbV7XENyqx5GHmP3dvYLekxVzH/l7qslp+reNbsVUOsmIzlh8eMd1hw6ZQvXEU3ttr2kJ1LXs9EDinyZh37eLh6e7V4FBL48ET71Tz7p8j2YJBYXEovBDuEOSBL1spDRrbrz+wMqZjEFfmPvBSy3TcHmHTjQxjyrvYbtNJmQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c71a13-387a-4f9b-3a9d-08dea56aff2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 21:13:29.8896 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JiJGR7AAfzpdyR+JtjoWVorX/NSgSqzECtVtvnZ3uvOLg/SxKT7UkGZ/FZ3A0wlmI7gujAD4bCNazlpWoS4M7F95iGJNIa3PVRI8tTK+pMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7453
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

T24gVHVlLCAyMDI2LTA0LTI4IGF0IDAyOjI2ICswMDAwLCBQYXRjaHdvcmsgd3JvdGU6DQo+IFBh
dGNoIERldGFpbHMNCj4gU2VyaWVzOiBBZGQgdGVzdCBjb3ZlcmFnZSBmb3IgbXVsdGkgcXVldWUg
cmVzZXQgKHJldjIpIFVSTDoNCj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nl
cmllcy8xNjQ2NTMvIFN0YXRlOiBmYWlsdXJlDQo+IERldGFpbHM6DQo+IGh0dHBzOi8vaW50ZWwt
Z2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL0lHVFBXXzE1MDY2L2luZGV4Lmh0bWwgDQo+IENJ
IEJ1ZyBMb2cgLSBjaGFuZ2VzIGZyb20gWEVJR1RfODg3NF9CQVQgLT4NCj4gWEVJR1RQV18xNTA2
Nl9CQVRTdW1tYXJ5RkFJTFVSRQ0KPiBTZXJpb3VzIHVua25vd24gY2hhbmdlcyBjb21pbmcgd2l0
aCBYRUlHVFBXXzE1MDY2X0JBVCBhYnNvbHV0ZWx5IG5lZWQNCj4gdG8gYmUNCj4gwqB2ZXJpZmll
ZCBtYW51YWxseS4NCj4gSWYgeW91IHRoaW5rIHRoZSByZXBvcnRlZCBjaGFuZ2VzIGhhdmUgbm90
aGluZyB0byBkbyB3aXRoIHRoZSBjaGFuZ2VzDQo+IMKgaW50cm9kdWNlZCBpbiBYRUlHVFBXXzE1
MDY2X0JBVCwgcGxlYXNlIG5vdGlmeSB5b3VyIGJ1ZyB0ZWFtDQo+IChJOTE1LWNpLWluZnJhQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZykgdG8gYWxsb3cgdGhlbQ0KPiDCoHRvIGRvY3VtZW50IHRoaXMg
bmV3IGZhaWx1cmUgbW9kZSwgd2hpY2ggd2lsbCByZWR1Y2UgZmFsc2UgcG9zaXRpdmVzDQo+IGlu
IENJLg0KPiBQYXJ0aWNpcGF0aW5nIGhvc3RzICgxMyAtPiAxMylObyBjaGFuZ2VzIGluIHBhcnRp
Y2lwYXRpbmcgaG9zdHMNCj4gUG9zc2libGUgbmV3IGlzc3Vlc0hlcmUgYXJlIHRoZSB1bmtub3du
IGNoYW5nZXMgdGhhdCBtYXkgaGF2ZSBiZWVuDQo+IGludHJvZHVjZWQgaW4gWEVJR1RQV18xNTA2
Nl9CQVQ6DQo+IElHVCBjaGFuZ2VzUG9zc2libGUgcmVncmVzc2lvbnMgKiBpZ3RAeGVfd2FpdGZl
bmNlQHJlbHRpbWU6YmF0LWF0c20tDQo+IDI6IFBBU1MgLT4gRkFJTA0KDQpUaGlzIGlzIGluIGFu
IHVucmVsYXRlZCB0ZXN0IGFuZCBJIGhhdmVuJ3QgbWFkZSBhbnkgY2hhbmdlcyBoZXJlIHRoYXQN
CndvdWxkIGltcGFjdCBhdHNtIG9yIHRoZSBsaWJyYXJpZXMgYXNzb2NpYXRlZCB3aXRoIHRoaXMg
dGVzdC4NCg0KVGhhbmtzLA0KU3R1YXJ0DQoNCj4gQnVpbGQgY2hhbmdlcyAqIElHVDogSUdUXzg4
NzQgLT4gSUdUUFdfMTUwNjYNCj4gwqAqIExpbnV4OiB4ZS00OTQwLWI2ZjZiNjliMmRmZmE5YWQx
YzQzYjIxNDk3ODZiNDYzMGQ0MWFjYmYgLT4geGUtDQo+IDQ5NDQtYWVhMmM0OTZhYmNmNTViNjQ3
YzE0ZmU3MjBiZmM0ZWE1NTVhYWM2YQ0KPiBJR1RQV18xNTA2NjogNjE5NGJhNjcxMWQ0ZDRmMDY2
ODVlMTFjY2Q4YTRmMjVhNzIyNGVkOSBADQo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9y
Zy9kcm0vaWd0LWdwdS10b29scy5naXQNCj4gwqBJR1RfODg3NDogNDU2OGIyYzE0MWFiNjMwYzM0
ZjhlYjJiOWFmYWI4Y2JmOGYzY2U5ZSBADQo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9y
Zy9kcm0vaWd0LWdwdS10b29scy5naXQNCj4gwqB4ZS00OTQwLWI2ZjZiNjliMmRmZmE5YWQxYzQz
YjIxNDk3ODZiNDYzMGQ0MWFjYmY6DQo+IGI2ZjZiNjliMmRmZmE5YWQxYzQzYjIxNDk3ODZiNDYz
MGQ0MWFjYmYNCj4gwqB4ZS00OTQ0LWFlYTJjNDk2YWJjZjU1YjY0N2MxNGZlNzIwYmZjNGVhNTU1
YWFjNmE6DQo+IGFlYTJjNDk2YWJjZjU1YjY0N2MxNGZlNzIwYmZjNGVhNTU1YWFjNmENCg0K
