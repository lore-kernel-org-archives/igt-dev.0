Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2E1D3B7E2
	for <igt-dev@archiver.kernel.org>; Mon,  8 Dec 2025 18:37:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B88810E4B8;
	Mon,  8 Dec 2025 18:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C0BoQ7dZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9CA10E4B8
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Dec 2025 18:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765219077; x=1796755077;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=74QOh7uD4yzAWa2UAbGg33l2xVrZzdqOeN1CBqI/vT8=;
 b=C0BoQ7dZU/uaQ/NBw2cmG04eNicfoXrifwLCRKUNxmWWw9N/K2KVjI/m
 Hwimz4rUT0f5EidGEtCL5HpiHOqoyB/FeZZCOpjf87lqsMf1RQkRPF1BK
 ZoCvlNwy+P3HiRtrkmiZ2AEmf80ZSOTYgb35yquI+owlcxs5UspYBxz5V
 dDmMWw8GFKD3+3sDF0hf0Iw9IHrMC6YFEElO8Esd8E0o5y/4HBvISNgxh
 Lry/GteN9CWDImXgMbJH3L6LVUXtxWy5vS5P7oCq1HvllRd9prvzEhMia
 UFzN7UEOVm+wwzU4kP+nXmh60xQffkj6HYU6PdVcKieIJx7+3lHpFIoao Q==;
X-CSE-ConnectionGUID: MemhjlGMTH+JdqabDzfyYA==
X-CSE-MsgGUID: lSAvL2mZRZ6kTfj0p5Y43w==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="77852403"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="77852403"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 10:37:56 -0800
X-CSE-ConnectionGUID: 8XUMQ2yEQO+/Wbm/5/Oc8w==
X-CSE-MsgGUID: sx5/86aaRrCSYdqVBff6Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="200484199"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 10:37:56 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 10:37:55 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 10:37:55 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.21) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 10:37:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vt+6Tvrtnnqo0UGu9SFS2mh9gIju3FUe13KSy57DYVPksMXw8B1KjRMqIkyGQ6OSB3WnQqno/BnOkIM8vMIO0G8abppqeZoSVs0djkr11tx0hJYBXcTwZPnsMNttaoB+nq+Q2KjNnI4sgsHp1qvTkOFnBAO1OvxDvfcKiQssAirKOj6pnaR8DDYP5BvhYt//brIG3zud3EiaToHTMiVmN1Gi8gywhZFtcERPJFo8I0Mnx+VpOFyZwlpR6XHTXYr/wJE9t0xuYdIKqkNfGjHlMrAEFMFNMLsbJfDVZzZxbWWUnsAteKzSNDDeB6vqU2iYScvtca5eoCQYthFIm0EMrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eo2JPmjvCvY2U1hcW0InFyVmn3kDPkav9e0vVQGWqug=;
 b=Fzk7Dv1CV1H5c2McxYtOy0E6vzAGG80+abxzSct8J3TtRfF7N2YQC0C0O1he1ThSUTDjnPBtPgOENCRI1mTL7D6aqtQ7nK8YeTRZGG+zyYp/S0TtwG1LPlYm1DcwTFxnxW+BFXWA3Md4N3dnczoAxFCs7ZEJUivhA7psXVcqS1eJLJUELq300343eqbbC6dk2BUPUmmAo3zjK9a1+Hgl6Szc0KzK6MuyqC2mI9XLcymD68C1oQ6nfRJfpq4U+H/kcET+IKIZkXZAd4yXVISNZ/lvKlc3MlOlqB8GElRFFyfLLm99QL6i5eIVCk7HdvRAuGsn4KzgQW68sXSJy3MESg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by MN2PR11MB4613.namprd11.prod.outlook.com (2603:10b6:208:26d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 18:37:53 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 18:37:53 +0000
From: "Wang, X" <x.wang@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Zuo, Alex" <alex.zuo@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH v2 1/2] lib/intel_pat: read Xe PAT config from debugfs
Thread-Topic: [PATCH v2 1/2] lib/intel_pat: read Xe PAT config from debugfs
Thread-Index: AQHcZk12DP1gj+Iwm0q7q7D9jj3tG7UU9UaAgAMfegA=
Date: Mon, 8 Dec 2025 18:37:52 +0000
Message-ID: <SA3PR11MB80463A3571A8C5085CBDA03686A2A@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20251113070502.2148615-1-x.wang@intel.com>
 <20251206011241.67825-1-x.wang@intel.com>
 <DM4PR11MB5456EEADACFB56E39B95FB96EAA4A@DM4PR11MB5456.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB5456EEADACFB56E39B95FB96EAA4A@DM4PR11MB5456.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|MN2PR11MB4613:EE_
x-ms-office365-filtering-correlation-id: 0a77f52f-30e4-49e5-3e94-08de3688e5ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|42112799006|366016|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?UX+e72l+/w87BQ+WsIZa/c/hAw34dpYiuVcKsafkYPatCJL/3fnoTQwPazdM?=
 =?us-ascii?Q?jErhTOKMHNUSWSkNzJgC+rWRJuTal4UOZRayjJVBNp+n+sCdmw32P0NBHXZk?=
 =?us-ascii?Q?Ei7iv/9nCTz4iVzNpRFhnu5XO53awJ1bGeDb/f4tMnscu+q2VV2UwzGWcfVb?=
 =?us-ascii?Q?4sXEQhG/+VGoGp5nq730fJ6PqyKH0MzOnqX6EsK2srhOBJ6Ckt9O5QznH6VK?=
 =?us-ascii?Q?YEP0s+wRhYPgsO6YdMVW1qKvi008Gmg7anbnquBYxMRzCZlzHRzGQbDAPmXo?=
 =?us-ascii?Q?u7rP5+1atSueaSU8GGyP6ZoNAk7Hew8Jf6yhjg5zS+QSXFkAhC8vvAG6XOhg?=
 =?us-ascii?Q?vCqqcJex71cv/3F+YVkueyGYNqBsVrRB5KwaLeBl+7/7+ZqZF03kbJUH/KRL?=
 =?us-ascii?Q?DFuK7lMHZ2bgZlIW/aE5jsOxsEIeP4S/8YvGFtSjdrqt6Y1/OiNb4m+NOMms?=
 =?us-ascii?Q?y565YVbH5tYj96/RQCVTOic3rCavzOuqFkRMQwbkEJJWz/FJr4X84L4OFQz3?=
 =?us-ascii?Q?VjIqSaOLpGsp95zCqGPAk9KZ98B9EdOakmjXI41nzxcswtwbwh/bjBRvLWv4?=
 =?us-ascii?Q?yY4SOi5340HuBXti941heiB8Kv8UGm1fGC5qeIy6NCoFmGC1n4EtrWrprmhu?=
 =?us-ascii?Q?ETAq5TUFpYEJ9pLeYHou9JjbZu6JlJ/VVnBptxqJ2ysWtfM22UR6EWmzIbbQ?=
 =?us-ascii?Q?pq+62Lhv4ePNPMRqZ3N4mULdO9qKOabyhsiZhjGJRZkgIUrRdfaOREd6Y6bt?=
 =?us-ascii?Q?kpEkW5+M0uOnIVBiQrV7N5YQNF3nmB5t5E/tm6IHsRixN0sjkoRSxxDiC6fQ?=
 =?us-ascii?Q?LKNsOB2EkB7v6sQjNL3SqocuyE9cjrqfUeiSIci4fLNn9rr4E1TVQXsiNG1f?=
 =?us-ascii?Q?X2upSi1M2SFhG3meo7GnyLWpE2ppWt2X/W2/5T3/hHujAMptmO0ibb8YRqoi?=
 =?us-ascii?Q?SjIc9cr0rz2HLOdBY5uImEi0JJxsUMXi/ODBy4WIAAy5Iuqgn1bIBHhd7kBa?=
 =?us-ascii?Q?oilsElSL9fLrA+KxqSNShn8kSuPw9TRaAIX7LLqdbjeyNq2GLckeKdaGTcAe?=
 =?us-ascii?Q?vjJJhJCXTxt+pKBNGpqCZToa/RMpf5GdZFcEiMz8vWdQ1j0TpOxiSVrpvgMc?=
 =?us-ascii?Q?ZD2rcoJjh9mckVi9lyhK7ZMT+Gy1tdd35dTGf9pjISS4JLfDMWNl5Z4azESP?=
 =?us-ascii?Q?RBzgWAiqLgzzMgK2u5askdyEzH0YTrd6pl+4s/r22C7CzHHy6lPEA00WYDuL?=
 =?us-ascii?Q?VJ0ostRNr5OuACeRu7X4qeq/XDsc+MjiOLykmiaNiacIkg4WbkWcIKfh0f9V?=
 =?us-ascii?Q?+N2YtxQBBS5sjhgz062WVT86rcnVTUtBN2WPcv0U4hYd9/DgkMl6rpInRlsH?=
 =?us-ascii?Q?v+tUP/AwrA4wOvbvuMcFMGX42Bu115dIk4YfK0rlnZR8nUpSrahRGLSWUhHk?=
 =?us-ascii?Q?cioLrwQoN41dqKnyUXS/Gg2gh+ASYnWawhyqc+RNqs5albe6I1If4H7k0o4i?=
 =?us-ascii?Q?ZFyNvVhezTI0AdbReA9qmz6NzUHetIXgh0HV?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(366016)(376014)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wdqYi795LrxHmRT1e7F0i6trLRXOTspR/Y11egmNxpFWpypzi922kO3N75du?=
 =?us-ascii?Q?vSr/9aqARlhwN3Ys327brXLvt0nr2/m2G7DFi33BfIvPo4rsmRTzcqt1301e?=
 =?us-ascii?Q?lUDvQHzH9zUnR32NXSRhjnQX8V52TrayDNmsEdgjEpxbJPXvbtkSDjKhRbEv?=
 =?us-ascii?Q?eSGClMwfZXaPsShxwFg5KOScRYQj/dfn6sBuK+IhrppnzbUiHwCBYl0S8x74?=
 =?us-ascii?Q?lPBSdBxtzUmEdc17p/GXrp1XtavX1LSJ0yo1tnI+yOpZrBSC/DqtoeXlHCmQ?=
 =?us-ascii?Q?H76qMiRm+RAzBybO+Yy4LkC+wDcM0agCu0PsmvRYXApKRoXx4woKS1CxNGpt?=
 =?us-ascii?Q?GwylmeqLmF7HPbMxQniIw19AoFgPeRkiE2z73ZsqqeRm8yI4u8eDih09jBXT?=
 =?us-ascii?Q?WE6dERcinCaLUnZpxLqrT5ilS41yT0Fz3iqJXUR5XPwvPE5cIXvytW/DNmH5?=
 =?us-ascii?Q?Po1CBbLBlGFW8waYzg9ezogUKmA2GY8Cx1WXobsOLIUqqhGfRUv1evAB3bnE?=
 =?us-ascii?Q?hEsy3fdlxgyI2uB+nL7TurbzSPHnhRrFnrQVS3AYWNFO8QuKyYS+hHr15kZY?=
 =?us-ascii?Q?uwSiBL6KHVxxMKb8LhnfmooBXio+XuUWSuU284AmM7j1UR6qtTKZXHbQ4MTL?=
 =?us-ascii?Q?US6GAw1E4UcBrYoJcHA19xQEdyD2kKZI+TjPz7YIRcf1v33B0u0FxORjtUfu?=
 =?us-ascii?Q?vR/LhHQyJ2r7ac3wcupN4846XEG+vMeKoWqd/RO70FtR2taclpcawDXLzohS?=
 =?us-ascii?Q?2vGb8fdBIwI+RkWunbzcDHORldKkro4JAvzSYFMiSJorwc1tHKc68exYJ7WK?=
 =?us-ascii?Q?2s12q4ubCQLXZ9EWLQYcsVJGrq8mvURCz5H+YEUaefk+aplz26dxW+FMCsnR?=
 =?us-ascii?Q?2BhfrR3ghXr4bqECaHKAbWWbQkGpPqDNbhqdwNTl0Z4d4dVktfa6rdPjeA8r?=
 =?us-ascii?Q?c4+r5ypWxeD8KMve/dIeIXimTsWKS7fe/gHowfHxdattQzrXJRcu3giizaCM?=
 =?us-ascii?Q?xah3TBUPnPgSwowF9QSBvLpNzbD89Xg8gQnamqXxnmwEfc07TxaKr3ReKfIy?=
 =?us-ascii?Q?PzITofebIJhMOI8ojCj4t0oDBoTYcNCFzm+5l+LCo324usXzD9tbA7ZjmZlF?=
 =?us-ascii?Q?eeGAjpS3CaJmNckkMCIpF7xQTKTPUdkp3LvxJtNSCaaAnLlGujwiPHzUpFGZ?=
 =?us-ascii?Q?rhF6GLYFvj28fTQY1VRuw+V//zQY26yQFtAErBeC9FtEJCbCH6zUDHPr+sUT?=
 =?us-ascii?Q?R6oiPH0gx30wlpbLTpdEQXJ1r7H6/NnQiQ3ET9ynpT7/buYmCDfIBFS9+gUQ?=
 =?us-ascii?Q?UK71x8IAOolwVZt1IbRzcOQYZ+Mph4AYnufFMMx9JxARIs7Np8KMthgk2S6Q?=
 =?us-ascii?Q?uyv7u6NSeYIFdfXP6Cih6e45kFu/zL2mvwnm3SlYM+Ifpd3YrnWNP7VB/T8w?=
 =?us-ascii?Q?fXECYC07fGwNBjh0rPHzN0pxFFNqpRhgOEugThrhZ2VApsFRHWXihqM8/7P0?=
 =?us-ascii?Q?H+MjF30YrWNUVmUUWgN2E2k2xenFBhFgJv7ltcNk3lJj0zlq9H+cKi4XUE1r?=
 =?us-ascii?Q?gu9Z0InLNIMe6GNxmnk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a77f52f-30e4-49e5-3e94-08de3688e5ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2025 18:37:52.9762 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mrw7nQk47dI0flAXaqxRqzPzGg7kCEHx+GNTCPws7mGGhwhoW1FA/Dm6uxalbvQUjPwk+oO5IDNNR3EeY8yIvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4613
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
> From: Lin, Shuicheng <shuicheng.lin@intel.com>
> Sent: Saturday, December 6, 2025 10:49
> To: Wang, X <x.wang@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Zuo, Alex <alex.zuo@intel.com>; Auld, Matthew
> <matthew.auld@intel.com>
> Subject: RE: [PATCH v2 1/2] lib/intel_pat: read Xe PAT config from debugf=
s
>=20
> On Fri, Dec 5, 2025 5:13 PM X Wang wrote:
> > Parse the PAT software configuration from gt0/pat_sw_config instead of
> > relying on hard-coded indices.
>=20
> So the lib is not compatible with previous kernel that doesn't have sw co=
nfig.
> Should we keep the hard-code as fall back?

The second patch also depends on gt0/pat_sw_config . If we retain the hard-=
coded
values, we would need to duplicate them in the second patch as well, which =
would
make the code quite messy. Do we really want to go down that path?

In the current implementation, I've added igt_require(ret > 0); so that if =
the kernel
does not support this debugfs, IGT will report an error message to inform t=
he user
that the kernel is not compatible.

>=20
> >
> > Expose xe_get_pat_entries() so tests can grab the PAT table.
> >
> > CC: Matthew Auld <matthew.auld@intel.com>
> > Signed-off-by: Xin Wang <x.wang@intel.com>
> > ---
> >  lib/intel_pat.c | 126
> ++++++++++++++++++++++++++++++++++++++++++-
> > -----
> >  lib/intel_pat.h |   9 ++++
> >  2 files changed, 120 insertions(+), 15 deletions(-)
> >
> > diff --git a/lib/intel_pat.c b/lib/intel_pat.c index
> > e3588110a..2d204e652
> > 100644
> > --- a/lib/intel_pat.c
> > +++ b/lib/intel_pat.c
> > @@ -6,6 +6,7 @@
> >  #include "intel_pat.h"
> >
> >  #include "igt.h"
> > +#include "igt_core.h"
> >
> >  struct intel_pat_cache {
> >  	uint8_t uc; /* UC + COH_NONE */
> > @@ -13,27 +14,112 @@ struct intel_pat_cache {
> >  	uint8_t wb; /* WB + COH_AT_LEAST_1WAY */
> >  	uint8_t uc_comp; /* UC + COH_NONE + COMPRESSION, XE2 and
> later*/
> >  	uint8_t max_index;
> > +	struct xe_pat_entry entries[XE_PAT_MAX_ENTRIES];
> > +	uint32_t pat_mode;
> > +	uint32_t pat_ats;
> >  };
> >
> > +/**
> > + * xe_get_pat_sw_config - Helper to read PAT (Page Attribute Table)
> > +software configuration
> > + * from debugfs
> > + *
> > + * @drm_fd: DRM device fd to use with igt_debugfs_open
> > + * @xe_pat_cache: Pointer to a struct that will receive the parsed
> > +PAT configuration
> > + *
> > + * Returns: The number of PAT entries successfully read on success,
> > +or a
> > negative error
> > + *          code on failure (-ENOENT if debugfs is missing, -errno oth=
erwise)
> > + */
> > +static int32_t xe_get_pat_sw_config(int drm_fd, struct
> > +intel_pat_cache
> > +*xe_pat_cache) {
> > +	char *line =3D NULL;
> > +	size_t line_len =3D 0;
> > +	ssize_t nread;
> > +	int32_t parsed =3D 0;
> > +	int dbgfs_fd;
> > +	FILE *dbgfs_file =3D NULL;
> > +
> > +	dbgfs_fd =3D igt_debugfs_open(drm_fd, "gt0/pat_sw_config",
> > O_RDONLY);
> > +	if (dbgfs_fd < 0)
> > +		return -ENOENT;
> > +	dbgfs_file =3D fdopen(dbgfs_fd, "r");
> > +	if (!dbgfs_file) {
> > +		close(dbgfs_fd);
> > +		return -errno;
> > +	}
> > +
> > +	memset(xe_pat_cache, 0, sizeof(*xe_pat_cache));
> > +	while ((nread =3D getline(&line, &line_len, dbgfs_file)) !=3D -1) {
> > +		uint32_t value =3D 0;
> > +		char *p =3D NULL;
> > +
> > +		/* Expect patterns like: PAT[ 0] =3D [ 0, 0, 0, 0, 0 ]  (     0x0) *=
/
> > +		if (strncmp(line, "PAT[", 4) =3D=3D 0) {
> > +			bool is_reserved;
> > +			p =3D strstr(line, "(");
> > +			if (p && sscanf(p, "(%x", &value) =3D=3D 1) {
> > +				if (parsed < XE_PAT_MAX_ENTRIES) {
> > +					is_reserved =3D strchr(line, '*') !=3D NULL;
> > +					xe_pat_cache->entries[parsed].pat =3D
> > value;
> > +					xe_pat_cache->entries[parsed].rsvd =3D
> > is_reserved;
> > +					xe_pat_cache->max_index =3D parsed;
> > +					parsed++;
> > +
> > +					igt_debug("Parsed PAT entry %d:
> > 0x%08x%s\n",
> > +						  parsed - 1, value,
> > +						  is_reserved ? " (reserved)" :
> > "");
> > +				} else {
> > +					igt_warn("Too many PAT entries, line
> > ignored: %s\n", line);
> > +				}
> > +			} else {
> > +				igt_warn("Failed to parse PAT entry
> > line: %s\n", line);
> > +			}
> > +		} else if (strncmp(line, "PAT_MODE", 8) =3D=3D 0) {
> > +			p =3D strstr(line, "(");
> > +			if (p && sscanf(p, "(%x", &value) =3D=3D 1)
> > +				xe_pat_cache->pat_mode =3D value;
> > +		} else if (strncmp(line, "PAT_ATS", 7) =3D=3D 0) {
> > +			p =3D strstr(line, "(");
> > +			if (p && sscanf(p, "(%x", &value) =3D=3D 1)
> > +				xe_pat_cache->pat_ats =3D value;
> > +		} else if (strncmp(line, "IDX[XE_CACHE_NONE]", 18) =3D=3D 0) {
> > +			p =3D strstr(line, "=3D");
> > +			if (p && sscanf(p, "=3D %d", &value) =3D=3D 1)
> > +				xe_pat_cache->uc =3D value;
> > +		} else if (strncmp(line, "IDX[XE_CACHE_WT]", 16) =3D=3D 0) {
> > +			p =3D strstr(line, "=3D");
> > +			if (p && sscanf(p, "=3D %d", &value) =3D=3D 1)
> > +				xe_pat_cache->wt =3D value;
> > +		} else if (strncmp(line, "IDX[XE_CACHE_WB]", 16) =3D=3D 0) {
> > +			p =3D strstr(line, "=3D");
> > +			if (p && sscanf(p, "=3D %d", &value) =3D=3D 1)
> > +				xe_pat_cache->wb =3D value;
> > +		} else if (strncmp(line,
> > "IDX[XE_CACHE_NONE_COMPRESSION]", 28) =3D=3D 0) {
> > +			p =3D strstr(line, "=3D");
> > +			if (p && sscanf(p, "=3D %d", &value) =3D=3D 1)
> > +				xe_pat_cache->uc_comp =3D value;
> > +		}
>=20
> What will fall into the else here?
>=20
> Shuicheng
>=20
> > +	}
> > +
> > +	free(line);
> > +	fclose(dbgfs_file);
> > +
> > +	return parsed;
> > +}
> > +
> >  static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)  {
> >  	uint16_t dev_id =3D intel_get_drm_devid(fd);
> >
> > -	if (intel_graphics_ver(dev_id) =3D=3D IP_VER(35, 11)) {
> > -		pat->uc =3D 3;
> > -		pat->wb =3D 2;
> > -		pat->max_index =3D 31;
> > -	} else if (intel_get_device_info(dev_id)->graphics_ver =3D=3D 30 ||
> > -		   intel_get_device_info(dev_id)->graphics_ver =3D=3D 20) {
> > -		pat->uc =3D 3;
> > -		pat->wt =3D 15; /* Compressed + WB-transient */
> > -		pat->wb =3D 2;
> > -		pat->uc_comp =3D 12; /* Compressed + UC, XE2 and later */
> > -		pat->max_index =3D 31;
> > -
> > -		/* Wa_16023588340: CLOS3 entries at end of table are
> > unusable */
> > -		if (intel_graphics_ver(dev_id) =3D=3D IP_VER(20, 1))
> > -			pat->max_index -=3D 4;
> > +	if (intel_gen(dev_id) >=3D 20) {
> > +		/* Cache parsed PAT config per device to avoid re-reading
> > debugfs on every call */
> > +		static __thread struct intel_pat_cache intel_pat_cache;
> > +		static __thread uint16_t cached_devid;
> > +		if (cached_devid !=3D dev_id) {
> > +			int ret =3D xe_get_pat_sw_config(fd, &intel_pat_cache);
> > +			igt_require(ret > 0);
> > +			cached_devid =3D dev_id;
> > +		}
> > +		*pat =3D intel_pat_cache;
> >  	} else if (IS_METEORLAKE(dev_id)) {
> >  		pat->uc =3D 2;
> >  		pat->wt =3D 1;
> > @@ -96,3 +182,13 @@ uint8_t intel_get_pat_idx_wb(int fd)
> >  	intel_get_pat_idx(fd, &pat);
> >  	return pat.wb;
> >  }
> > +
> > +uint8_t xe_get_pat_entries(int fd, struct xe_pat_entry *xe_pat_table) =
{
> > +	struct intel_pat_cache pat =3D {};
> > +	intel_get_pat_idx(fd, &pat);
> > +
> > +	memcpy(xe_pat_table, pat.entries, (pat.max_index + 1) *
> > +sizeof(struct xe_pat_entry));
> > +
> > +	return pat.max_index + 1;
> > +}
> > diff --git a/lib/intel_pat.h b/lib/intel_pat.h index
> > eb48cbc65..1d6c4f1ad
> > 100644
> > --- a/lib/intel_pat.h
> > +++ b/lib/intel_pat.h
> > @@ -6,9 +6,16 @@
> >  #ifndef INTEL_PAT_H
> >  #define INTEL_PAT_H
> >
> > +#include <stdbool.h>
> >  #include <stdint.h>
> >
> >  #define DEFAULT_PAT_INDEX ((uint8_t)-1) /* igt-core can pick 1way or
> > better */
> > +#define XE_PAT_MAX_ENTRIES 32
> > +
> > +struct xe_pat_entry {
> > +	uint32_t pat;
> > +	bool rsvd;
> > +};
> >
> >  uint8_t intel_get_max_pat_index(int fd);
> >
> > @@ -18,4 +25,6 @@ uint8_t intel_get_pat_idx_wb(int fd);
> >
> >  uint8_t intel_get_pat_idx_uc_comp(int fd);
> >
> > +uint8_t xe_get_pat_entries(int fd, struct xe_pat_entry
> > +*xe_pat_table);
> > +
> >  #endif /* INTEL_PAT_H */
> > --
> > 2.43.0

