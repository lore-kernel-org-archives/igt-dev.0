Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474D9FF885A
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 06:35:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E730210E425;
	Tue,  5 May 2026 06:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="djj9ZPej";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7038610E425
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2026 06:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777962898; x=1809498898;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=1pCtoA1fjJbv4bmbscDUp5RipFE97vY90rC3+X9i2c0=;
 b=djj9ZPejcmb+S51+ud0BiE/4QGszdAwXL14Uk/TlPQ/2UmkeEVwq3wfh
 LoQdoe20R0Em+uuOacRJJGsrAh6fQaHhvC41FniMDGswcNwLRtyS18F8I
 SQmsu189C/gKauclKTTJK/S8aSR3ZUFEXh/DlHvtJYBC4MK6rpBH40X+o
 ctHNkMos267OyOoEYFEBSDXWwVmB7R0hnKg8RsxpwLxengVPsB9gxxaRM
 WBZ/vjmHFwtYD/NrNJRxR5bjurNTkjuDKkl8NoAle4myHzyHrm3SUD9Ja
 NNPCfQ1fq0OVux1Pth2hJw+gFXBa6KIOZ2XWX5qQG9A8oTPphKv1qDPCr Q==;
X-CSE-ConnectionGUID: 6lZVRmwkQxii2rPs2eoKIQ==
X-CSE-MsgGUID: ns2qCpaBQEmxrfrmW7eFXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="77849063"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208,217";a="77849063"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 23:34:55 -0700
X-CSE-ConnectionGUID: W39ILuaATIukrDivMJJe6g==
X-CSE-MsgGUID: 6yuxyNhbS/2CfQa5A+5P3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
 d="scan'208,217";a="229248312"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 23:34:55 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 23:34:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 23:34:54 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 23:34:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P0+vynp+z7//qdJ/g6kMRjgJ6+YuvF17BQYoroL2ptFXJdDm5hCdaMDc/4DuW/s9msBEu/XBt5O+PvrJwbzCyiuzDyJ/9+83rchVLeMfd7Dylbx2eYSPKdw7gkDYQq/xfC0aAbVluwmALbZtU6HMFzlPjBBZzQoJrS6DvZIaJtsS2V1HBjQOhBXToGRVEAwNbRDk4EAz1ofhvACcOtM78rRIcbgCAcCmYa58KAk5qXwYtXFcBWe/IH3Yw2ON4Z+0REksxFTWiILjNOTEXxNCHQ7u2mP1ozttCdtHjXNRhj5vMgo0KZQVwGYkSYod6XLnb2mmCNkLopRdUDl6iAeXRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X2bqJKc3GvgLCLXkpq/FUHczowJql5rpJ5vWxY1gTfI=;
 b=f/jRDUjohrszblizI2sxY6DY9Nuf6WIxydtUCD7vFOKBity1foVQtpw9Qu3oVkYMHM6yxDqzuoj9jYjv0LwisdOhIrOtw1QWpgmdn10NJ0MiQU8VuBA7qxz8E3ahr+5wdnRSGKfTFoC8Gwd/l7KWwuVtcGA8hJ/jSZVn9YcY1sxg5Q9ryagNA1Pi/LVSVdb1sU9Y/eLfL45FSsOL6yOLS3SBIq92NAtWyin3+j/QlBBzMPlyeau2VQB2DuTpp5E1LOqW2UleTiZTUcP173UbdnO65j4BGFYrBIk8rfKwfZb2oF1lQPiFqDrUMcsZa+ndbIjXePAYx/ki7DOE7Pnjag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 by DM4PR11MB5246.namprd11.prod.outlook.com (2603:10b6:5:389::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 06:34:45 +0000
Received: from CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b]) by CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b%7]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 06:34:45 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Samala, Pranay" <pranay.samala@intel.com>, "Karas, Krzysztof"
 <krzysztof.karas@intel.com>, "Santa, Carlos" <carlos.santa@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_explicit_fence: Rescue pending IN_FENCE
 waits on test failures
Thread-Topic: [PATCH i-g-t] tests/kms_explicit_fence: Rescue pending IN_FENCE
 waits on test failures
Thread-Index: AQHc24m8EYtaS7CmfUCujKaAB8/VnLX+9PVh
Date: Tue, 5 May 2026 06:34:45 +0000
Message-ID: <CH0PR11MB54271973058C776F2F860BE5983E2@CH0PR11MB5427.namprd11.prod.outlook.com>
References: <20260504054512.2192437-1-karthik.b.s@intel.com>
In-Reply-To: <20260504054512.2192437-1-karthik.b.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5427:EE_|DM4PR11MB5246:EE_
x-ms-office365-filtering-correlation-id: c367bf60-d962-4670-035d-08deaa7065e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|8096899003|18002099003|22082099003|38070700021|56012099003;
x-microsoft-antispam-message-info: BJYFG+LO+3ltW2LEwbeCFojJZYh9XYbZBT3+QDOEKvP+hM4kvOxcU7azhDvgs+EAF8sERFo8V5b3OQm/xD8sHZDUOAV3d7dRHTnIqnPfew7fV1Eq9VZnCqH5DKvPMQv7skvIPgQEIp8qZQ0Gfkingi/DYpErwu07vsBAHpe1hs+sFv3l+YwKOpzw/rFR3kGkQZalyTUWYZUXFpBjsw+TXdnkuZ026+vsMZZBo/DjQhiscKzjC8fGm5uqsJtZF132BkYRDD/jW6DUiHI5zTKyuJ/NWwfLQcNTAcw4CVditqHyabe1EYN5ipHRLbLPIcj0z2aZ29VfeLa55AtT29ddt8SM2RWnSpqMtyMTlhE2iCzuPAsRBXNgjzJMnNgTMDYHszvroSKhZRtXN4DU6fR3E9Q7276NEpO1F9zhQi483NX234F3DxILjzcAaIcYWyBeST3/vOdTFKm/ld+FcFEP00MSxS4VLUcPiUTCIKBa2d6LY3+4Jy2NiJ/hPAYehfowiJkfEyrOpeDhRX5ZUMVRTYaL+YctH/HpNK3PewjW1FzS4ZjEfRk1HLPASm6U1lz2p0gvfHWl7qVSO/kSXJUoUzMpBKTYaFOIofUmRFF3LCO1arPKxXFDEZQ+T4l+JMzFKAwrrOQrheIB5mzQkP/tv8vArHt3TpXln77sU1nYnVc1fs1q9kemXOKs2di7uUQDaCq7a9RmoxHv8SFFCIe5JuKcNTzPL3jI2Jo++PTMdxMxX+FDzUOSxXse0++28nTw
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(18002099003)(22082099003)(38070700021)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?7bOaTDUjawAaszZebKTliipGofwgWoRST+WDQ1Pv0j/BRVpYyJ7ETaaFmy?=
 =?iso-8859-1?Q?M0frKprU8MnNhRALZsGKqRUJKgqvqnKKCZtVavAQotgt8CVRqVBb4BB2E2?=
 =?iso-8859-1?Q?ZK/IjfZ24qux0sBxvAqr3U0rM4M5SAPWw6zKBC7JXt9hbUWXmwXxZpxNHy?=
 =?iso-8859-1?Q?89FRnEgswHTj77ULsBSF93I3uvCtFmktzLAG4L/tO0PHb8Nvph6Y19SQDi?=
 =?iso-8859-1?Q?bwD/7MswsxHoe9ptjBXjUqpJecwtbewWl62Feh9UJeZOsrU7xTmvBjpoFw?=
 =?iso-8859-1?Q?9phwHfevnf3UDHYViHRNJHINFSxW/gT4reO5ObnhG7cs+DUI2WKvF3mCPI?=
 =?iso-8859-1?Q?8qgUT1hZVIExzj7Y7ga0rjx/XCAPYutXqfDIr2AK+BDfl/D9GN+cQ4HJ+t?=
 =?iso-8859-1?Q?HP7zK0DO7REojc7tPwBHFDdIOCvBFBfEharTh/yxgB0jt03ZHbDt6tzkwp?=
 =?iso-8859-1?Q?SD1oBhEy1DwKxCMIXjXkiwjF0N5Z2nhkdouSCMlhpwPHX8bDcyxVTJ8Xaj?=
 =?iso-8859-1?Q?aepLfkrcuOMqUKbAZQJB7exB4HWT9EgMKIzL/8zifLBCKH3pG67lNM8ufv?=
 =?iso-8859-1?Q?8gQjQN2CHsOrt+XnuH6JFbo1ZYmSOwzty8+xMuC+SEDksm93CEYgh2yAhJ?=
 =?iso-8859-1?Q?B8xhJJPSHxTybD4+lgM6LsgjYcUwKtnlzoMm/MQWI1RplWR42gSrnkSzGV?=
 =?iso-8859-1?Q?dY1c0ulPeXRAJaa2klI3KpZ51CCVT+5aFfgmcMfK8tUqPetAka7LQf2D75?=
 =?iso-8859-1?Q?jxo0KDZufAQN5jeEtJkgm2yUkb0rwEPmj9FounHoMpMPTB1dO6wU03FwZQ?=
 =?iso-8859-1?Q?1ukBBpEAK2xSg8XFiefa0XGE5dygjB/yDUYZ4xY/iVvY+oewDR5THDuNr0?=
 =?iso-8859-1?Q?ZpTdx+ylwml4b1k1h/m64Q5VKC5wd/IsBtdfhxUsFu47qBuS5LSVnY6bgj?=
 =?iso-8859-1?Q?jM7cLAVIiWAHPb2MTx1UaHvMgZ59Lr0+K+QA8MY5GZXdLSzb064evGoNVz?=
 =?iso-8859-1?Q?FAEtMdDvibu21DLBmUsctgEhhVblF1GLSzfN5y27QB5x1bToDrf+VT6V4x?=
 =?iso-8859-1?Q?t9w5hmXDOaERAgcddjDonAl/hH6E3naNe3YFLbfX4nBCIi70awrbGOVXWW?=
 =?iso-8859-1?Q?gFTdnA2YF+Gc5vxAk6WDI401pelYylmiDixBEBC/6LaxXv9V6srmlnrCuT?=
 =?iso-8859-1?Q?Ra0Nvjuq8OndlsecKgc7a3l3Uxwn3NMUpudrE/OUWvsMjhiAuJBLHE7dSm?=
 =?iso-8859-1?Q?leOq/N600PD5xGQN4dMFnrDkb711mE26GsT25oa8/Bv4F793wm5az2wOJ3?=
 =?iso-8859-1?Q?P8jB3gEozgFrqC1Fmsu4GwfzTZrQhRA83aDCYrOUi8zCLFd9UWEh5gt/C3?=
 =?iso-8859-1?Q?q5lyR4w5bj049DuD+dNue5518EoAzvrGS1UWPpIJnL2fH0GBBItkBDprxS?=
 =?iso-8859-1?Q?bAzT5+LikH0IcJ0117s+AedRFEQYvp0k007ST+GUBlH2L8wrLK3MAWq5nB?=
 =?iso-8859-1?Q?qxQ7FyX28ACisQXph5ev0mj+bAaqNQjC5U1ZQrIbNtsob/Bj1uz8zkNPNl?=
 =?iso-8859-1?Q?DHgqWY6aHjmsGyyv+L6QJFmqV+Jehb2Ma+Ut2SryuQTvY+ztE5iw4hvYEH?=
 =?iso-8859-1?Q?24v7tjVAzGquCw6iiHT1H3BSejIRqTGHeRs+o+jl57C0QteGuDLFZGSNJS?=
 =?iso-8859-1?Q?eSQxk95B8g2sih88zugQSltDd7lbcWtlkFPiRk45tI0jou5coVYBli7MoI?=
 =?iso-8859-1?Q?t/d6Al/jrF1Kb6J2ZKbEZeT9bYcaLOH2Si9TJBmyXpaM+H?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR11MB54271973058C776F2F860BE5983E2CH0PR11MB5427namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: F3ZIJ74FnxOBg8BjGQvZHWFlEQLP/XBSIPE0uzeXBHAaeoyiP+1VshsrvwbZTk/LTKw9YTiwVl2kJjnI/aN9cRYd4LdI5paNicI8S31WHHIQB4DcPCzFVgRjyymCU4xsyp4djwtQWIf5W+wFVe+kPFHsHTgnuW4L3nw096rIjkJ4ekqh/GG3/GiV4dEKTqI2LNbb8pWY2JBDCA/6nW9S8Y2Ee1MfOToE66jbtUBAuyPkdNKHwEWYUl78aM1RS4auSktDBXlCPbBKtMMtqYRTwtu61UGGyEVNiIJu8oBwh9DyvjhXpOueo3HD5ES9CMVqtVv/B5QXPxienZi1tI3BIw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c367bf60-d962-4670-035d-08deaa7065e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2026 06:34:45.5473 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PYnbbZvZksZZcZAH7ChD9P0mx3cFx2tNHznp+Wio8/R5UASKdhLJbXm0kzI+HXcUjqEHMzn9JmuObn/IlitFkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5246
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

--_000_CH0PR11MB54271973058C776F2F860BE5983E2CH0PR11MB5427namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Karthik,

Thanks for your patch here, it does address the test clean up hangs which c=
an happen.
I have one minor observation though,

1. IMHO the global 'struct pending_fence_state' is accessed from a signal-h=
andler context, marking it volatile avoids potential compiler register-cach=
ing issues.

Otherwise, the fix is correct and well-motivated, the active flag ordering =
around the NON_BLOCK commit is right and the exit handler cleanly
unblocks the kernel wait.

Feel free to add,
Reviewed-by: S Sebinraj <s.sebinraj@intel.com>

________________________________
From: B S, Karthik <karthik.b.s@intel.com>
Sent: Monday, May 4, 2026 11:15 AM
To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
Cc: Samala, Pranay <pranay.samala@intel.com>; B S, Karthik <karthik.b.s@int=
el.com>; Sebinraj, S <s.sebinraj@intel.com>; Karas, Krzysztof <krzysztof.ka=
ras@intel.com>
Subject: [PATCH i-g-t] tests/kms_explicit_fence: Rescue pending IN_FENCE wa=
its on test failures

Track per-plane timeline/fence state across the in-flight NONBLOCK atomic
commit and install an exit handler to signal any still-unsignaled fences.
This prevents cleanup hangs when an assertion fires after commit
submission but before the test signals the blocking fence.

Cc: S Sebinraj <s.sebinraj@intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_explicit_fence.c | 58 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/tests/kms_explicit_fence.c b/tests/kms_explicit_fence.c
index 2ec9bf39d..7ffdcb285 100644
--- a/tests/kms_explicit_fence.c
+++ b/tests/kms_explicit_fence.c
@@ -68,6 +68,42 @@ typedef struct {
         igt_pipe_crc_t *pipe_crc;
 } data_t;

+/*
+ * State tracked across the lifetime of an in-flight atomic commit that ha=
s
+ * IN_FENCEs attached. The exit handler uses this to unblock any pending
+ * commit if an assert hits between the commit and the point where
+ * the test would otherwise signal the unsignaled fence(s).
+ */
+static struct {
+       int timelines[NUM_PLANES];
+       bool needs_signal[NUM_PLANES];
+       bool active;
+} pending_fence_state =3D {
+       .timelines =3D { -1, -1, -1 },
+};
+
+static void signal_pending_fences(int sig)
+{
+       if (!pending_fence_state.active)
+               return;
+
+       for (int i =3D 0; i < NUM_PLANES; i++) {
+               if (pending_fence_state.timelines[i] < 0)
+                       continue;
+
+               if (pending_fence_state.needs_signal[i]) {
+                       /*
+                        * Best-effort: advance the timeline so the kernel
+                        * stops waiting on this IN_FENCE.
+                        */
+                       sw_sync_timeline_inc(pending_fence_state.timelines[=
i], 1);
+                       pending_fence_state.needs_signal[i] =3D false;
+               }
+       }
+
+       pending_fence_state.active =3D false;
+}
+
 static void setup_output(data_t *data)
 {
         igt_display_t *display =3D &data->display;
@@ -242,8 +278,14 @@ static void multiplane_atomic_fence_wait(data_t *data)

                 /* Attach IN_FENCE_FD to plane */
                 igt_plane_set_fence_fd(planes[i], fences[i]);
+
+               pending_fence_state.timelines[i] =3D timelines[i];
+               pending_fence_state.needs_signal[i] =3D !should_signal[i];
         }

+       /* Arm the exit handler before the NONBLOCK commit goes out. */
+       pending_fence_state.active =3D true;
+
         /* Swap overlay colors to detect scanout changes via CRC */
         igt_plane_set_fb(data->overlay1, &data->overlay2_fb);
         igt_plane_set_position(data->overlay1, OVERLAY1_POS_X, OVERLAY1_PO=
S_Y);
@@ -299,6 +341,7 @@ static void multiplane_atomic_fence_wait(data_t *data)
         igt_assert_crc_equal(&crc_before, &crc_after);

         /* Now signal the blocking fence (overlay2) */
+       pending_fence_state.needs_signal[PLANE_OVERLAY2_IDX] =3D false;
         sw_sync_timeline_inc(timelines[PLANE_OVERLAY2_IDX], 1);

         /* Wait for overlay2 fence to be signaled */
@@ -311,6 +354,12 @@ static void multiplane_atomic_fence_wait(data_t *data)
         igt_assert_eq(ret, 0);
         igt_assert_eq(sync_fence_status(out_fence), 1);

+       /*
+        * The pending atomic commit has now completed, so the exit handler
+        * no longer needs to rescue it.
+        */
+       pending_fence_state.active =3D false;
+
         /* Verify display has now updated (CRC should differ from baseline=
) */
         igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc_final)=
;

@@ -353,6 +402,13 @@ int igt_main()

                 data.pipe_crc =3D igt_pipe_crc_new(data.drm_fd, data.crtc-=
>crtc_index,
                                                  IGT_PIPE_CRC_SOURCE_AUTO)=
;
+
+               /*
+                * Make sure that on any failure mid-test, any unsignaled
+                * IN_FENCE that the kernel is still waiting on gets
+                * signaled so cleanup can complete instead of hanging.
+                */
+               igt_install_exit_handler(signal_pending_fences);
         }

         igt_describe("Test atomic commit with 3 planes (1 primary, 2 overl=
ay) "
@@ -363,6 +419,8 @@ int igt_main()
                 multiplane_atomic_fence_wait(&data);

         igt_fixture() {
+               signal_pending_fences(0);
+
                 reset_display_state(&data);
                 igt_pipe_crc_free(data.pipe_crc);
                 cleanup_crtc(&data);
--
2.43.0


--_000_CH0PR11MB54271973058C776F2F860BE5983E2CH0PR11MB5427namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Karthik,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks for your patch here, it does address the test clean up hangs which c=
an happen.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I have one minor observation though,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
1. IMHO the global 'struct pending_fence_state' is accessed from a signal-h=
andler context, marking it volatile avoids potential compiler register-cach=
ing issues.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Otherwise, the fix is correct and well-motivated, the active flag ordering =
around the NON_BLOCK commit is right and the exit handler cleanly</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
unblocks the kernel wait.</div>
<div><br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Feel free to add,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Reviewed-by: S Sebinraj &lt;s.sebinraj@intel.com&gt;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;B S, Karthik &lt;karthik.b.s@intel.com&gt;<br>
<b>Sent:</b>&nbsp;Monday, May 4, 2026 11:15 AM<br>
<b>To:</b>&nbsp;igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop=
.org&gt;<br>
<b>Cc:</b>&nbsp;Samala, Pranay &lt;pranay.samala@intel.com&gt;; B S, Karthi=
k &lt;karthik.b.s@intel.com&gt;; Sebinraj, S &lt;s.sebinraj@intel.com&gt;; =
Karas, Krzysztof &lt;krzysztof.karas@intel.com&gt;<br>
<b>Subject:</b>&nbsp;[PATCH i-g-t] tests/kms_explicit_fence: Rescue pending=
 IN_FENCE waits on test failures
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">Track per-plane timeline/fence state across=
 the in-flight NONBLOCK atomic<br>
commit and install an exit handler to signal any still-unsignaled fences.<b=
r>
This prevents cleanup hangs when an assertion fires after commit<br>
submission but before the test signals the blocking fence.<br>
<br>
Cc: S Sebinraj &lt;s.sebinraj@intel.com&gt;<br>
Cc: Krzysztof Karas &lt;krzysztof.karas@intel.com&gt;<br>
Signed-off-by: Karthik B S &lt;karthik.b.s@intel.com&gt;<br>
---<br>
&nbsp;tests/kms_explicit_fence.c | 58 +++++++++++++++++++++++++++++++++++++=
+<br>
&nbsp;1 file changed, 58 insertions(+)<br>
<br>
diff --git a/tests/kms_explicit_fence.c b/tests/kms_explicit_fence.c<br>
index 2ec9bf39d..7ffdcb285 100644<br>
--- a/tests/kms_explicit_fence.c<br>
+++ b/tests/kms_explicit_fence.c<br>
@@ -68,6 +68,42 @@ typedef struct {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_pipe_crc_t *pipe_crc;<=
br>
&nbsp;} data_t;<br>
&nbsp;<br>
+/*<br>
+ * State tracked across the lifetime of an in-flight atomic commit that ha=
s<br>
+ * IN_FENCEs attached. The exit handler uses this to unblock any pending<b=
r>
+ * commit if an assert hits between the commit and the point where<br>
+ * the test would otherwise signal the unsignaled fence(s).<br>
+ */<br>
+static struct {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int timelines[NUM_PLANES];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool needs_signal[NUM_PLANES];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool active;<br>
+} pending_fence_state =3D {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .timelines =3D { -1, -1, -1 },<br>
+};<br>
+<br>
+static void signal_pending_fences(int sig)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!pending_fence_state.active)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (int i =3D 0; i &lt; NUM_PLANES; =
i++) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (pending_fence_state.timelines[i] &lt; 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (pending_fence_state.needs_signal[i]) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Best-eff=
ort: advance the timeline so the kernel<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * stops wa=
iting on this IN_FENCE.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sw_sync_timeline=
_inc(pending_fence_state.timelines[i], 1);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pending_fence_st=
ate.needs_signal[i] =3D false;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pending_fence_state.active =3D false;=
<br>
+}<br>
+<br>
&nbsp;static void setup_output(data_t *data)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_t *display =3D=
 &amp;data-&gt;display;<br>
@@ -242,8 +278,14 @@ static void multiplane_atomic_fence_wait(data_t *data)=
<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /* Attach IN_FENCE_FD to plane */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_plane_set_fence_fd(planes[i], fences[i]);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pending_fence_state.timelines[i] =3D timelines[i];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pending_fence_state.needs_signal[i] =3D !should_signal[i];<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Arm the exit handler before the NO=
NBLOCK commit goes out. */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pending_fence_state.active =3D true;<=
br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Swap overlay colors to =
detect scanout changes via CRC */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;=
overlay1, &amp;data-&gt;overlay2_fb);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_position(dat=
a-&gt;overlay1, OVERLAY1_POS_X, OVERLAY1_POS_Y);<br>
@@ -299,6 +341,7 @@ static void multiplane_atomic_fence_wait(data_t *data)<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_crc_equal(&amp;=
crc_before, &amp;crc_after);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Now signal the blocking=
 fence (overlay2) */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pending_fence_state.needs_signal[PLAN=
E_OVERLAY2_IDX] =3D false;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sw_sync_timeline_inc(timel=
ines[PLANE_OVERLAY2_IDX], 1);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Wait for overlay2 fence=
 to be signaled */<br>
@@ -311,6 +354,12 @@ static void multiplane_atomic_fence_wait(data_t *data)=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(ret, 0);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(sync_fence_s=
tatus(out_fence), 1);<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * The pending atomic commit has=
 now completed, so the exit handler<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * no longer needs to rescue it.=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pending_fence_state.active =3D false;=
<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Verify display has now =
updated (CRC should differ from baseline) */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_pipe_crc_get_current(d=
ata-&gt;drm_fd, data-&gt;pipe_crc, &amp;crc_final);<br>
&nbsp;<br>
@@ -353,6 +402,13 @@ int igt_main()<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; data.pipe_crc =3D igt_pipe_crc_new(data.drm_fd, data.=
crtc-&gt;crtc_index,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IGT_P=
IPE_CRC_SOURCE_AUTO);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /*<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; * Make sure that on any failure mid-test, any unsignaled<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; * IN_FENCE that the kernel is still waiting on gets<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; * signaled so cleanup can complete instead of hanging.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_install_exit_handler(signal_pending_fences);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Test at=
omic commit with 3 planes (1 primary, 2 overlay) &quot;<br>
@@ -363,6 +419,8 @@ int igt_main()<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; multiplane_atomic_fence_wait(&amp;data);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture() {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; signal_pending_fences(0);<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; reset_display_state(&amp;data);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_pipe_crc_free(data.pipe_crc);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; cleanup_crtc(&amp;data);<br>
--<br>
2.43.0<br>
<br>
</div>
</body>
</html>

--_000_CH0PR11MB54271973058C776F2F860BE5983E2CH0PR11MB5427namp_--
