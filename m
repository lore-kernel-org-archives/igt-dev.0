Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5751DCCF9E0
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 04:37:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3C810E138;
	Mon, 27 Oct 2025 04:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bWQkcVC/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E59810E138
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 04:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761539860; x=1793075860;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4tk8FYEJAwgLoaliwv7WcenoKjbUsHLkL1hoD8PSXQQ=;
 b=bWQkcVC/RMDvKAcEUeGESY0km+6CYpdv8sZLHs+dkEuau7R1tyTn/FXB
 NCL8peHsUaluyKCyFZ01aHk5SH9Yqtx5Xww/nxASMNBN+76f4/x9aFL5a
 zEccIYVYLhdmdiHIj2tG8ffeU2Do30qJuVW691gwvn7xHBXZaw9rbWF6v
 7/udl8bKFGwaNgXHNokKLnUU0DQUhoF+vZ73lIGaU1aQ1N9FodOs8Zf6I
 I5Ad2ugIvfQy/oiGZKv9SqzKxaY2YG3ZpMshhj83SCPXLvUrajyxGKO/s
 pP30DGwJ/ncBSrC/v0D9+xzmW4i0ihxN/OotsHi6sM13jvbC3Y0oYmi1v w==;
X-CSE-ConnectionGUID: HG7wpVbgTaCWjG0oZnN4jA==
X-CSE-MsgGUID: O5ucCYseSamCE8gA4j1OSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81041148"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="81041148"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 21:37:40 -0700
X-CSE-ConnectionGUID: 64xYE7lFRSqMBSQXUi/e1g==
X-CSE-MsgGUID: C0Xbj4MYSRKRfIpv2qLkxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="185698539"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 21:37:39 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 26 Oct 2025 21:37:39 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 26 Oct 2025 21:37:39 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.67) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 26 Oct 2025 21:37:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q3qArsvHfkysMqVtOURgPZvS3qocQPT+tvt+38QW3uCGmpc/sVQxu/DXq7cQNO32pKyi/wuc8bhN2bFYUm2UlbVH58/2aMXqBRo6G8GbD5P9g53eW8vuwkV1DJSyKVDyX7ngxc5xW0dqfeW2I4KUI8RLI59bq9YhM7YKHkgr5Pk8DHdau2bJDR0//PVVI1CpIl+suXxtMsLz5gLm25AwgWZhXNIyzEF/hqDjtXBOFe2XEFHXVqBkW7zXwaZhHGUbUxvfFn9hF7JZ3QNXj41B5Syvz8GGdeGUGMz5xdh2jvVyjG4yAOpYCe0hqE77nLOIgXpM/xg8/4z7YWHpNtZqfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MuDUUuF1hOIrHpZZuJLCVUyhPKxis+cKx/fszvHukWE=;
 b=ngqcDKJxGOf9kZ4Ng48qoNNMsq+gOYpusR5zzTuX6cDOcJodIAyuia5e5P1AwRgz9ROEY4siWGa1BUvmty/fDTEUjMQCSDRHVePuh9v28MXQIapbO1Tv8RGhtJOMEYLMQ71mo2iM5gtu4eM9lWmE/SEHsvh71SqahMguqDveqPX6fPFijjOKZDtlvMi7C3okq8GhLM23d1nbojzS560R248L43WZpQcIQyXPiKygVrrBFX+HFTFyInkOT7+crtOJ2vrcOylm746cT/yCneOFhzuxTe5xbSstN/hgpYxgRMFrJfAMdgwPYutK1DKWtDYJEyO7Tnz3VzGGLEuaD/ymDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by CH3PR11MB8095.namprd11.prod.outlook.com (2603:10b6:610:154::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 04:37:37 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 04:37:36 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Samala, Pranay"
 <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t v3] tests/kms_atomic_transition: Add info messages
 for skipped subtest
Thread-Topic: [PATCH i-g-t v3] tests/kms_atomic_transition: Add info messages
 for skipped subtest
Thread-Index: AQHcRvp7+hmbihV/eEKLrZaNTAge0rTVZ5KA
Date: Mon, 27 Oct 2025 04:37:36 +0000
Message-ID: <PH7PR11MB67960CED25D912D7CCD92A07E5FCA@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20251027044824.2995891-1-sowmiya.s@intel.com>
In-Reply-To: <20251027044824.2995891-1-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|CH3PR11MB8095:EE_
x-ms-office365-filtering-correlation-id: 8d71f29d-a738-4880-1b5f-08de15128e06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?YBurvOR84nDlx2OwySn9elYnxpVWHBYN2Myw54svXoiyV2x1DD2a7sD3T+62?=
 =?us-ascii?Q?wbn7qPpKOn8LtjggaEfmkoPX3BLWRRytPPeWUlv28pkrk8XW67ybCWgcQzgv?=
 =?us-ascii?Q?nn3n3SMYH+OqJnycXrw5iBbqgyQlwYyn2Qr5qDft808p0Br+VAd6vuGrjQ9n?=
 =?us-ascii?Q?1LMxUYjvd45Rl+yI0RDai1D9/jHOdyIqbEo2gf/rrep0At5OWPSfinMlFQws?=
 =?us-ascii?Q?cx+0Fj+KeP89bgwsjXB3Pq8xweMw7pyRbRQS5kFYfxZJ7IYLdKyXvVmgv05j?=
 =?us-ascii?Q?lp+btvxAtfNq0XnTEwp3OdHpXQVaavFim8miJpv5xHeH7libKfnRbJyQAmVj?=
 =?us-ascii?Q?4vFATLosF1Eu4+m1QGGMkacgmpWaLt0P3nssANexUg14BnQjbFNCbwS7WDww?=
 =?us-ascii?Q?2eb1kauL+APpfF9HoMR/sKtHRC2TKGKMJDNkHCT9H8+zNbLMbPYnaLMjs3gt?=
 =?us-ascii?Q?RMzdaigGVu7lf2mkBnlXOf31oDX9p86lbn6RA5ioXoehjYiYWWx75elzcota?=
 =?us-ascii?Q?xbqkhGS+scv/MhY2f58XfAZtr0mrMc3gF4W5Xk6M6STqrWTqnIceZhMOXbcD?=
 =?us-ascii?Q?F9VWnZz0+jYyWGajMY9oN2RHu4AYGpLaenAs0JP9QySGeJvpxJ8Ci5BfA8eD?=
 =?us-ascii?Q?Q3ug4qtAf1xIoK3jMD4h8ReHj0buzg4w2l8Cq8iqMtEhxIxfOTFYf/2XMijg?=
 =?us-ascii?Q?6HPXewHxp7E8R4vaMTuFiSD5CWg8iehGRoitBETOJAfCKmqtFxiHIGKl4M2G?=
 =?us-ascii?Q?4CeqrFbavMgGRC2dV7oaDc0fI+q2TRgvHjz7fFrNVq/egcNq3UwHtfrMoExi?=
 =?us-ascii?Q?hm7NqQbjby0Py+lX20besoCkxexEpcYTBF8FFmCQ/vIixBURSPxVjEXrM89i?=
 =?us-ascii?Q?Tu+6UUO0rvulJlpJbaiWUdISffxhNM7sFbDNCBP18o4s9Awt57OsANIB/BWH?=
 =?us-ascii?Q?4zkC7ntoYF16eH9MrUPrklAeD7XK+WOcjNjcvKHxSEJfowlXE/6CIzzCTYDk?=
 =?us-ascii?Q?A5xRCGylTksIX/+7WXY1gil2ynmzBAsE3YsFNg+9sxZlrfkc3a45tEc1skVw?=
 =?us-ascii?Q?s+agFyQMEUI+rbFikEGmhqTOjaXWeIPAr4jX2wwdN8672yhvePbXd6pBmqyH?=
 =?us-ascii?Q?FaB96BVLw0/Hmq5qL/mR5gyamSsBF+QrOfZl/qGs8Bl2ENHyE+YOBytYRGSW?=
 =?us-ascii?Q?pQX7c6oBNgFsOUlteueQKeUv59fKyiPHpkURiiZLwglFF1n1F9ST4ZSg4pJ5?=
 =?us-ascii?Q?nLiVAtwn3bTaCuVMCMKP90p7n7albOaBDlxATkKI36pNexyOha2oypty+q0g?=
 =?us-ascii?Q?QlypU07tp0e7kfPhtq1fqaMrGF8YYDDcHJjuK/dc7ABzCQx7uzlUDP5rugIg?=
 =?us-ascii?Q?xN2aTw1RW0z5lMSiqAIHJX+/T1WI02VlGqjkFhtzXeTTSHSXeHCibOUz/AkL?=
 =?us-ascii?Q?9jI95Jcw99GjX/b+w0SzIOUsFg6YIL8szeO04ZGnmA/UagdzIKK3mSYj6rbb?=
 =?us-ascii?Q?WWCIBEuapBSjVrAPuYzGwUvPvWyGLA96n3n9?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pwddA7Td9/iROrywYMQ6wycXTntofymDTI/lOmJ0OWBwTiolErgKp/iU6R5f?=
 =?us-ascii?Q?hZJ/Dwy0bwvyVjZv9cf0iMJDruiHWqahGPill+20fcEJlVQXJRKS5ZJ6bkTw?=
 =?us-ascii?Q?UtFkhCAXsab9230o+tZx2lEWvSVdvWdbsjmzFbEFvsUD0HpXZTEx1bsfirW/?=
 =?us-ascii?Q?MK+FCneagvsFaoGjdl1fp27wlWSFImgpPHE4lUZ3SNZQR2giVUKN4J6BqNA7?=
 =?us-ascii?Q?Ux7r5gX8NQ7eXjzMrh9DDGZT66paEFxD+nIdEOjzt5O++9eIXbFYBTZ5ULgD?=
 =?us-ascii?Q?62YuV5Y+ydE6u4knvg10x8lrXA7Pk8orxxU0c2TDNuTHA8xgBhTjkAMqygEO?=
 =?us-ascii?Q?vt/Cy8dM4AAj4qVWJO0PPaqUxiSJuZSZba5Roup/JlqHSXMWupE7O3QGLiYz?=
 =?us-ascii?Q?y+uapV9OZn0C925N5KsLIjXqRldNsrcmw42blsesk5mfFBQ1zkZzfgtZh+PW?=
 =?us-ascii?Q?a63X18aXX9S51DZ4yba5lW8UXsj8fVJMSY1n67w5Tc24X6DaV2Mm0uLSpQ45?=
 =?us-ascii?Q?VV6ZBAvwY0u1Z7nxoD9aGCgwe7vAIcIjB5f4T9Qi97bYulSgWB+A2/I64lad?=
 =?us-ascii?Q?QZtWtBuvHkLTnYSGuYBk6oHXl2AyRHZuAd2sA1LCmbaUvqo5eREpr2p9GJc4?=
 =?us-ascii?Q?EN/6Zmi5TQ0Uw4j5IQnJnQ7jVWnDj5o28yz9UePjNKJI5bx+ibnznMpSYWTH?=
 =?us-ascii?Q?RC9VdiwbFHNRNVxfwPiBKnFzPB+sd3+KTjUM4DeDoqufVwCm6iGEvZfeEShw?=
 =?us-ascii?Q?VLjRBzQsa6kpmeBfbi20gv5y+kXEoMHoSJIxhtMdpQ3einEyKpBe0Tb8WlUB?=
 =?us-ascii?Q?MwKMieRzVYeFoqjE8pXUMYqDyIkcCfzIC/A6NysmrXnRiNPjGPSnqNX9RA3U?=
 =?us-ascii?Q?L+PV8HyZAhPCgqhIFdR/KlCUaMik+N3md9XEK0j/2ifxKJb1Pe6CygLcbBNW?=
 =?us-ascii?Q?wT47P9ZinNgwptq8EvvLWnabL9lB6IpdHG+pIJC1/9iqGD7Iae+0yheknHMb?=
 =?us-ascii?Q?6KyVqO9g8+4CvlvYcNbRnKc2og6NdvwgOGY3XJie7zfxgMhyXMQYoWGZv4KK?=
 =?us-ascii?Q?Pregsy01FVcW30uMRD+1HmsBM4kGAeSDOuPEpIBRA8YAqkEkgmJgLwvLXgm/?=
 =?us-ascii?Q?YXMc/mG07rbDXneVEit8iwaiU1bCNXbJ4V6gsJOIc3XMmCtX8kTUHNMoKXj1?=
 =?us-ascii?Q?SNS2trdc0rV4Vkh4o+C2oytMtEeTDfdJqqXNNTK2Q0hD7sF7zLRHBZ8DMOuc?=
 =?us-ascii?Q?IFZ0V0wnS2rYmtAHjtxmdWh1Q2hbw1cmUwR3YD9rmJ6r7dbdjzZIdYGg3oa7?=
 =?us-ascii?Q?XvjSW1gL8Xq1V8YyFocsWaEjpF71JdBqG5rbxHrf2YTficOvm/+4AEWh8Gsj?=
 =?us-ascii?Q?r3zK+esOrSsrwbuqQ92KAEthIIdtFs6syPZyvEJl31zLWOVcdSDCqj0xhpqz?=
 =?us-ascii?Q?lQ47YiLhEE3+rDzuRs+3O68gZaDX9GrXZ1tSpVmM+AQDydvK6C8MsL4p8NEN?=
 =?us-ascii?Q?MngkbgSenre+mkvuMbPmWaIxHz+C8MOHFw4NQOlie+tA2/P9a7vFnHJHctiy?=
 =?us-ascii?Q?wJvzNzuVH28fTYkCwfw5u3PhYV+UnjTYD+SSWc1W?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d71f29d-a738-4880-1b5f-08de15128e06
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2025 04:37:36.9366 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rLIJrs899rG8SjQ99XbbzBVhf0rpnHqZ4BbVKKyq6AlY/9Heu1DTVWOGvfTJtNiMDzPldITNBE88UzjBblj8Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8095
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

Hi,

After updating the commit message, this patch was submitted as a new entry.
It is intended as a follow-up to the previous patch [153845].

-----Original Message-----
From: S, Sowmiya <sowmiya.s@intel.com>=20
Sent: 27 October 2025 10:18
To: igt-dev@lists.freedesktop.org
Cc: B S, Karthik <karthik.b.s@intel.com>; Samala, Pranay <pranay.samala@int=
el.com>; S, Sowmiya <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v3] tests/kms_atomic_transition: Add info messages fo=
r skipped subtest

From: sowmiya <sowmiya.s@intel.com>

Add info messages for subtests that are skipped without having proper info =
messages. This provides clearer insight into the reason for skipping.

v2: Add switch case instead of if conditions
    Also changed the flag name.
v3: Reframed the info message

Signed-off-by: sowmiya <sowmiya.s@intel.com>
---
 tests/kms_atomic_transition.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c =
index a13830965..3c54604c2 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1172,6 +1172,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &=
data)
 	};
 	int i, j, count =3D 0;
 	int pipe_count =3D 0;
+	bool info_flag =3D false;
=20
 	igt_fixture {
 		unsigned int debug_mask_if_ci =3D DRM_UT_KMS; @@ -1216,6 +1217,7 @@ igt_=
main_args("", long_opts, help_str, opt_handler, &data)
 		igt_describe(transition_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", transition_tests[i].name) {
 			pipe_count =3D 0;
+			info_flag =3D false;
=20
 			for_each_pipe_with_valid_output(&data.display, pipe, output) {
 				/*
@@ -1224,12 +1226,16 @@ igt_main_args("", long_opts, help_str, opt_handler,=
 &data)
 				 * panels with long power cycle delays.
 				 */
 				if ((transition_tests[i].type =3D=3D TRANSITION_MODESET) &&
-				    output_is_internal_panel(output))
+				    output_is_internal_panel(output)) {
+					info_flag =3D true;
 					continue;
+				}
=20
 				if ((transition_tests[i].type =3D=3D TRANSITION_MODESET_FAST) &&
-				    !output_is_internal_panel(output))
+				    !output_is_internal_panel(output)) {
+					info_flag =3D true;
 					continue;
+				}
=20
 				if (pipe_count =3D=3D 2 * count && !data.extended)
 					break;
@@ -1249,6 +1255,18 @@ igt_main_args("", long_opts, help_str, opt_handler, =
&data)
 				test_cleanup(&data, pipe, output,
 					     transition_tests[i].fencing);
 			}
+			if (info_flag && !pipe_count) {
+				switch (transition_tests[i].type) {
+				case TRANSITION_MODESET:
+					igt_info("Skipping test: invalid for internal panel\n");
+					break;
+				case TRANSITION_MODESET_FAST:
+					igt_info("Skipping test: invalid for external panel\n");
+					break;
+				default:
+					break;
+				}
+			}
 		}
 	}
=20
--
2.43.0

