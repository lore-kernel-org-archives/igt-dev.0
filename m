Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497E7CA0FF0
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 13:57:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC9C010EBC5;
	Fri, 29 Aug 2025 13:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rm/MdMBo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6326410EBC5
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 13:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756475826; x=1788011826;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=mmiXElbo+uWe0eRFsEhr9kgSqNfm9qBNkV7FYow+z1w=;
 b=Rm/MdMBoKWr5Qc/1iO5kJ545cG6knIYF+kptQXgg/wmK2um2gbOIN6k8
 hlb2/sJzHy0GAYYl97Wvm58Jqo0IDCVeqNg0GxtwgqWDiYYUPGNWBcjh0
 3RB8pTecO6l4TvbmU9gEhdTNyRm7GXqUK6osdyKmzLwoAayxXWfL/sg+b
 KlCfY1K8UepzedFMIpSFiuFFF4zxRxWYues5gX+QvX4xXfDUy/M4unJix
 zQU4zRmUjPWi/SZjR7EPI7nvghqG5sg4hapPH1JBYb2cEshCkppHRYDMn
 zW1pJ1a8QYRBMxliddt53uNfXP6cdOVtVbBjZ7EbAAcXIXANXrzphoyRH g==;
X-CSE-ConnectionGUID: 8c+QviMYTd6WdwlTXROTBA==
X-CSE-MsgGUID: HxWQ5nb1TACBs3XTZS/5/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58612016"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="58612016"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 06:57:05 -0700
X-CSE-ConnectionGUID: Mi7Yp5MPT8+nS051it1vtQ==
X-CSE-MsgGUID: vw/6WITbQO2wmnnNDfsLDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="201300860"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 06:57:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 06:57:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 06:57:04 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.85)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 06:57:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fmuRVJYhcj0s+0MCdN7rgz22NF0RBCJLx1y6G1RxqLleTJBRahdncopDFENO0FfAPO3iuYEOieTOLEKveCTjRW3hyXzHIIwSZQuB8VAagotFc+EEscGjffFIioZMhfUMc2989GgudKz4PAjPxd9Xkcrk9WDZc/LBYeUmfCkXZjcFu7caYIsF+yrGhJE5QXXn9aqhaOgcknayQhkakT0WYcgfFlH3vCu/Ewe2BqMsM4ISU/ObFe+68v3Sjn9Q3dQtZoalAJiLnZJwFJchlcgzMQWvyIKUWv55fc9JDTCsDQvfDDD0OU8kBPFQ6f3bz84SvkXJOdjwBlPoigUIBFTpOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ok0/I3jSLu3DrnE0YtWQJmlWlUW5ZdkZ3oUyO0WPj1s=;
 b=OiNv/+kjfOn0rkRfA8H49Q8VVm4P3xebJTmxwpzI1Lr8roBEWD7yCZctQRLbA4QiIOMPaxKYFwSSfngUeNYmuuh/8gc9bTs+mWRZvY3+/VOALRZpw8fO02ZGtI2KvyknK+txReVFwapK6KZuhCBtcqg+Qrfpx9Tpz3EtxnfiuWfqfygPOM480SbrClTGLnNc6PIXvH+/6eZ9YwEpesnOd8MOUWdlIXLorcDBHqyql0zw/NrrffYC0OE3VcP7TKbjJsBUil6qCHLXYvplYHQCJ5r8cmG8LEMz04U4+bLqxkIpEeIrJBmwZEmSqNIrP6HQeP8Xx4IOT00vjseCRkhQEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5529.namprd11.prod.outlook.com (2603:10b6:408:102::16)
 by DM3PR11MB8735.namprd11.prod.outlook.com (2603:10b6:0:4b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Fri, 29 Aug
 2025 13:56:57 +0000
Received: from BN9PR11MB5529.namprd11.prod.outlook.com
 ([fe80::477f:f3d4:aecd:5d0c]) by BN9PR11MB5529.namprd11.prod.outlook.com
 ([fe80::477f:f3d4:aecd:5d0c%6]) with mapi id 15.20.9073.010; Fri, 29 Aug 2025
 13:56:57 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: RE: [PATCH i-g-t 2/5] lib/xe: Add xe_vm_madvise ioctl support
Thread-Topic: [PATCH i-g-t 2/5] lib/xe: Add xe_vm_madvise ioctl support
Thread-Index: AQHcGDz99jupEsFZmkiPXKWZqBSko7R5ooKA
Date: Fri, 29 Aug 2025 13:56:57 +0000
Message-ID: <BN9PR11MB552976FE6F9286E1827FBDDF843AA@BN9PR11MB5529.namprd11.prod.outlook.com>
References: <20250828165817.97661-1-nishit.sharma@intel.com>
 <20250828165817.97661-3-nishit.sharma@intel.com>
In-Reply-To: <20250828165817.97661-3-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5529:EE_|DM3PR11MB8735:EE_
x-ms-office365-filtering-correlation-id: 3ff8ebae-c374-49ab-96ec-08dde703eb2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?Bk2tnrrcfKLK6zeObGFN7q3xAUzJCzpgquLZ19JM1Stdq3Ge2lf0clMp2X?=
 =?iso-8859-1?Q?SMSRJvWAXQcOWq0/8YnW5GgRuWLz6Zw/86NCVR/I1oMj/zMQeZiQdhv+FW?=
 =?iso-8859-1?Q?ZcIzu+WNQiqJ12HHHL7M2YKHttmzkQVHRrJ9Q+cba0j5dqnPYeIdYz5Qpv?=
 =?iso-8859-1?Q?qTrLk5VwK8DtS2fCR6V5fsyjVO0a+Ekhnn7kcFfrnJaFSiIhxQN6NbMLzM?=
 =?iso-8859-1?Q?yNhdGlIuaVEy4M56rokXoT5qB7M4tMro5f6jcTPg+DeE+ngZq7kurs3vob?=
 =?iso-8859-1?Q?42QeT3t9/YG9VPUD/+PHb4lp33YynwcUYTUE2eADwXFT2OyCC93l9J6+zJ?=
 =?iso-8859-1?Q?29UQ66DKgcpNNbzZh/hjmsm3+tFajfGalPfRZrX0PI0N3EOrqnduNzrhy5?=
 =?iso-8859-1?Q?4H3erhCheo3htkRTl0ShTAFrxC8jczudwPnDFZsp/yLv+PyvgVeBKhnowP?=
 =?iso-8859-1?Q?BU7u8vFENcpxk86liiWbkWzAb4oiCpj8gr3XQPdvnEH1LR/PcNTvUDEu73?=
 =?iso-8859-1?Q?UiqRHU+FoqHTkLh1WwVrMmAW9vuvL52is/qqBApMHrGlRi7UVbFzwZy0Ap?=
 =?iso-8859-1?Q?E3zK+zWjSDO07w0SsDcX8XR50mhYk30+0nl0NDs+GQNGjwE0+MStY0Gt/a?=
 =?iso-8859-1?Q?Vfy2/U4kEBPBOoBmPrSh/JjfCadGmOQ8DY5mBuuPuhXNH92Iyv+6R3y8Hj?=
 =?iso-8859-1?Q?bNnytLSWPmpJ7xzzpL4CMCkb9vB8mBKgGvBJ8CEl2eMt5lXSIFfFeMJMjS?=
 =?iso-8859-1?Q?TDKApwQOlgOmd2KL0TxZT5xJlNB2lz1vLeNw09s2XoykRgvKQTgpdZBSqW?=
 =?iso-8859-1?Q?UiYd6Gv/gz0pmsaHmxg22AkKa9gIf01BstVTPhh5ObMntH0AHSb8z63IX5?=
 =?iso-8859-1?Q?x96mdGgSQpnuohgRNQoCIsm47Ku7dltAMYqjHQEWj3g5aokwkmMEgdsg5w?=
 =?iso-8859-1?Q?sBnKOb8ECV+IaSOV8Nh52yOThqEK430uuol6RCP7JYjAmoh6pWj2AkenFG?=
 =?iso-8859-1?Q?Eo5mL8zuST7d9eio8nIpYRinTDO4qzMgzli8X/PSVeo7RsZNyoKjyeO/Wa?=
 =?iso-8859-1?Q?G5fJgHT1E7x5XY2Bv90VnPS4f+7PmfjjIpbW3oP20IekmTzr5SMblITxhO?=
 =?iso-8859-1?Q?Hvw6JWdEYdPHrIH6kAa/q71u9udHat17t5LN2US8OYsX0lRc49mAz9CmAB?=
 =?iso-8859-1?Q?xvHIkkWQNDa01rpVEf+gc6jxoM2ES3EAcrfnSvPV6BW7tCmTjCDGC7V89b?=
 =?iso-8859-1?Q?FPMt9eas7OOo3iK5PjEXXv4acLgp533a0DAiJ3DYRbAGCjDEHY12RkXq5F?=
 =?iso-8859-1?Q?iASe9bYlhcWfVEcXi45uH9rNhYufuIo6eHnnuZknWfsTocQehBkZcs8JKv?=
 =?iso-8859-1?Q?VdTktWKii9n6yvFdnHJmpkgSb7QFuxiAzDNjxvb1Mf8YxB2kn+RrxV/GBM?=
 =?iso-8859-1?Q?Zb68c6Fy8N9eBH/5XBKmOkxzfUHko0DAb2YNzn/T8BmsHzwdXKSsQsOU5J?=
 =?iso-8859-1?Q?V00ZKeM9iRuZ72uC2HlhgYLTjkFcwaTpXWnF/U/b10km9qObqM3MyNnano?=
 =?iso-8859-1?Q?75eWRKQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?AxyHgP5OjBa/xymLuTdvADXxmXF/VDz793tpHDAMu71dEqfQfHuaQPyVkl?=
 =?iso-8859-1?Q?AkN3deBgK121bQhSpDrEk396xOoosV2iPijF7sVthfc0POsurt3YuaRWyA?=
 =?iso-8859-1?Q?/9CC889w9p1a8YNV4cL4r3PSAgvTDYNK+Kwr+w9fGug1u0j8HQj+VJ72VC?=
 =?iso-8859-1?Q?Iaogn7htwPZx5x8FFahX5EYEdZKkOHibMwd8P6i5AZYvz1Sr8oRGcFUQb3?=
 =?iso-8859-1?Q?PNV91I7GTJ1RKeJDz7vWNTwMx9RmYjC9+f1YwpO4LitqRQb3/fLFwqZcRk?=
 =?iso-8859-1?Q?FNWfW6x269FyQZkTRAFWO9Ex8Ww2umcho9PH825L7zOYuT83wQxJwMK7+9?=
 =?iso-8859-1?Q?Zrus8Hjq2JEH2zCBTRXqQu64gNaOK9ZgTibTRorNmBBe62ug6473eLKNai?=
 =?iso-8859-1?Q?blcgPOpV8ELlwZriWiMLELovLZDM456FO2aL+gl/fSbBYF+tsTF8clHyx1?=
 =?iso-8859-1?Q?3gedMtoewwUYygw5DdEaimRp7LsLVX3UtGcYQM5opvvMi5mFb/m1iWs0yo?=
 =?iso-8859-1?Q?I1deGzYRujzSc5EKMYad2StKvexEbPZvWMIMaCLNaSws88VjovvPqvsvbH?=
 =?iso-8859-1?Q?aRU5LA1jIK59gi5rpE88paRh8spsvRtEyEKc+y04RBjnxEp8gFIpKMKChJ?=
 =?iso-8859-1?Q?YQzo8KRgZWHI8XZo/vwlEKYY4WvWU0/m9abVzsXz/Kb1MU24H/o+Qgcuow?=
 =?iso-8859-1?Q?2N0l08POgldXJraGd27v2PDIMU902KBY6yaXbckb+nPBMg4kWIaU72TagY?=
 =?iso-8859-1?Q?qhy/Qq7lokjlMTjbgGpUwTvWHqwgXF5ew5lq5dEmGWjnZ3KmhvO4DvU054?=
 =?iso-8859-1?Q?CitsNnz1sx/FZkJhwotVbpR/iU8nytjZiTdJTBwnsStONFGW5BVq3aiE3n?=
 =?iso-8859-1?Q?p6OyZLE27AbSkH6FxhrYk/INjPnF2uGE4g1B6xrEYylbyycAySKopePIIp?=
 =?iso-8859-1?Q?vArqVHd4XfNMgGfLmyx9kNpnQZrAQWaj6/RhutTqd2DHiYsEhdZjbkTpsa?=
 =?iso-8859-1?Q?39MaOQMkEoSpc0EUibCtZcARsOggTsQnPc+Qazz7zL1rT67OkLeSg9Sdxt?=
 =?iso-8859-1?Q?eZa08vYx7cV6yTLqE2Wa4z4UdXtcIQ4j95ChURdL+FQ03/lxVUMZ7DzZGm?=
 =?iso-8859-1?Q?wENhfq30nAvnvOZ4n4FFIx1irxzkd2pmL3oSuVXNAXXnLEMvhxhTeoAeRb?=
 =?iso-8859-1?Q?OtDqERuRtSqqW+FkQ1tDdYFnDdVLNC0wBnitSc4cXIpka+wOhFF3mKa6am?=
 =?iso-8859-1?Q?Lec+Mesi8ywDQBAwgZAEa5alMi2nMcw613/seIhKu7SWUCKj1wPLV/NqDa?=
 =?iso-8859-1?Q?1gViGB/wNbGLTTEkCCNqBevrp77bh+8lP+QRCitvCEhz6U6/vdJzrtQNFV?=
 =?iso-8859-1?Q?5QNV5AUX/otHfP0tYo65455+KGSFzF9QRUSbCJsy8XrXP3stgbLJ/EmYLI?=
 =?iso-8859-1?Q?Wb85G8Ntj0bmRqelCXeHqy+xZDjR2xmwG3jSjU10lE5+FvZep13BWBaR0v?=
 =?iso-8859-1?Q?VZd40rQai9mWx6vMnKAapWVovMsJ0MG9w0007JgCsE//tO6EubOGlQqQ6Z?=
 =?iso-8859-1?Q?8O8yPD2hztRzE9KGWZSOkcXBfXcnIYRqMfd8v/LE6G7nl0QcXfpoGY30B/?=
 =?iso-8859-1?Q?8H0xRw5bzQTcimIvFsuZgFJXR7Be6C0Cj4?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff8ebae-c374-49ab-96ec-08dde703eb2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 13:56:57.2514 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x/IJNQCFPwP8QRRace991/BlzRb73sRBv1plzcbMYQ8VMFZlm3Re7d5Lj3McHUGw0SfnYmJW1rTEGl5WBToLQeDBx7oExBfQdLxMyde+9Jg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8735
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
> From: Sharma, Nishit <nishit.sharma@intel.com>
> Sent: Thursday, August 28, 2025 10:28 PM
> To: igt-dev@lists.freedesktop.org; Gurram, Pravalika
> <pravalika.gurram@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>
> Subject: [PATCH i-g-t 2/5] lib/xe: Add xe_vm_madvise ioctl support
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> Added xe_vm_madvise() which issues madvise ioctl DRM_IOCTL_XE_MADVISE
> for VM region advising the driver about expected usage or memory policy f=
or
> specified address range. MADVISE ioctl requires pointer to drm_xe_madvise
> structure as one of the inputs. Depending upon type of madvise operation =
like
> Atomic, Preferred LOC or PAT required members of drm_xe_madvise structure
> are initialized and passed in MADVISE ioctl.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  lib/xe/xe_ioctl.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_ioctl.h |  5 ++++-
>  2 files changed, 60 insertions(+), 1 deletion(-)
>=20
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c index 1e95af409..43bad=
8452
> 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -585,3 +585,59 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr, uint6=
4_t
> value,
>  	igt_assert_eq(__xe_wait_ufence(fd, addr, value, exec_queue,
> &timeout), 0);
>  	return timeout;
>  }
> +
> +int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
> +		    uint64_t ext, uint32_t type, uint32_t op_val, uint16_t policy) {
> +	struct drm_xe_madvise madvise =3D {};
> +
> +	madvise.extensions =3D ext;
> +	madvise.vm_id =3D vm;
> +	madvise.start =3D addr;
> +	madvise.range =3D range;
> +
> +	if (type =3D=3D DRM_XE_MEM_RANGE_ATTR_ATOMIC) {
> +		madvise.type =3D DRM_XE_MEM_RANGE_ATTR_ATOMIC;
> +		madvise.atomic.val =3D op_val;
> +	} else if (type =3D=3D DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC) {
> +		madvise.type =3D
> DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC;
> +		madvise.preferred_mem_loc.devmem_fd =3D op_val;
> +		madvise.preferred_mem_loc.migration_policy =3D policy;
> +		igt_debug("madvise.preferred_mem_loc.devmem_fd =3D %d\n",
> +			  madvise.preferred_mem_loc.devmem_fd);
> +	} else if (type =3D=3D DRM_XE_MEM_RANGE_ATTR_PAT) {
> +		madvise.type =3D DRM_XE_MEM_RANGE_ATTR_PAT;
> +		madvise.pat_index.val =3D op_val;
> +	} else {
> +		igt_warn("Unknown attribute\n");
> +		return -EINVAL;
> +	}
> +
> +	if (igt_ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise))
> +		return -errno;
> +
> +	return 0;
> +}
> +
Hope you will take care of the=A0previous comments in next rev
-- Pravalika

> +/**
> + * xe_vm_madvise:
> + * @fd: xe device fd
> + * @vm: vm_id of the virtual range
> + * @addr: start of the virtual address range
> + * @range: size of the virtual address range
> + * @ext: Pointer to the first extension struct, if any
> + * @type: type of attribute
> + * @op_val: fd/atomic value/pat index, depending upon type of operation
> + * @policy: Page migration policy
> + *
> + * Function initializes different members of struct drm_xe_madvise and
> +calls
> + * MADVISE IOCTL .
> + *
> + * Returns 0 if success and asserts otherwise.
> + */
> +int xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
> +		  uint64_t ext, uint32_t type, uint32_t op_val, uint16_t policy) {
> +	igt_assert_eq(__xe_vm_madvise(fd, vm, addr, range, ext, type, op_val,
> policy), 0);
> +	return 0;
> +}
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h index 6302d1a7d..a5996=
cf65
> 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -99,5 +99,8 @@ int __xe_wait_ufence(int fd, uint64_t *addr, uint64_t
> value,
>  		     uint32_t exec_queue, int64_t *timeout);  int64_t
> xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  		       uint32_t exec_queue, int64_t timeout);
> -
> +int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
> uint64_t ext,
> +		    uint32_t type, uint32_t op_val, uint16_t policy); int
> +xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range, uint64=
_t
> ext,
> +		  uint32_t type, uint32_t op_val, uint16_t policy);
>  #endif /* XE_IOCTL_H */
> --
> 2.43.0

