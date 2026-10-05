Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4618ECA5FFC
	for <igt-dev@archiver.kernel.org>; Mon,  5 Oct 2026 17:26:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8F210E00D;
	Mon,  5 Oct 2026 17:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BfGHkiMn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7383F10E00D
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Oct 2026 17:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791221136; x=1822757136;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rFixgtn7J4+E8R3SqW4HR6TZ2pbIeBpOYLg/DknnRxI=;
 b=BfGHkiMne6cicwqUAbBgsZqGQfJTstwnkixbVx9NRpYG6D6Z/rolM7e4
 54wMosMrBHyoElrI5nXeH7GF6fIxGi4W+mcnxs6yenWgDOH6Uss+BLzkk
 cv1hCEfXbvQJWzrstiRxaIIKrQopJ5yBRte6BpR4Z0MFiw1tjgZKNKKFO
 2Bx+4jzeIxgV2Z7zgwzjGnwrgm7G9KwcCmAZzTrWMXcfuPTuf9mUc6AKa
 7B3fFQeqcQoU5moCuz+PeM4RQCXtccAKFvO9K2Sf/97FDGQ/LZixeCZ9P
 54xPlASd0jzasyQNvhOT+1AVfTQFu5cgccZPhBw1OTl0YKmjqzo4pZXN8 Q==;
X-CSE-ConnectionGUID: I+brmsN3So+SAWRKVFBECQ==
X-CSE-MsgGUID: 0S5yrl0EQd22IcThVQOX9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="94389011"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="94389011"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 10:25:36 -0700
X-CSE-ConnectionGUID: WuvoHQqzRa+MrYZ+RTvY0g==
X-CSE-MsgGUID: oMgsIQ+yTm2dXfZl3WlkUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="962144"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 10:25:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 10:25:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 10:25:35 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.36) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 10:25:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SgHBzoTTMDBOq39ZhB90TVBwWv4aMXDOvmA7Q/0U3QUAndqYVJ48Sc1Sp3DyVx1PTGYWJlxmTp74zA3VNkExC9Tr+K9PE95XyoCWjD5vjIvxX7+caPMzQIHYeA2qm2iZBYH00EVb4hhVho0ZXXaVZvIUY0EUiqAYhYWer0BawXmfPL9SrKjRpL0NnbcY3fxQgM26lWqv/jc1uMol4Owh3XBaBuc8rJLhBNoTWf8TVjibYVPbLmGhiBXY25hbg4cZKPXGt2S/hncGddFGtSaIxi1XvtS3HO3piqPcrDp1eSmR+sf/Z8v7+FkyIBJ6Kdy0uNLGZ1OX6EIz0hNYa1cFvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4GIDIcGws9WSFcofKWRS0iq0G/j30CIN+TN75E+nMJE=;
 b=j3zzhyUh/1jUYDcj2rVfPXXMMdqQ3NQFLpEzTYN+1FVhj5m5FIhkXjB/ZoLG3o4RTVe565fkUrjZQq95qjnG7XyXUZ4IshSh4NoDoEaQJeB0Uyvomjiuh8CYuJ5xtIit9k6UoO8fkOIot5DcAx86NO7U2LO4aOTD3X4puitiV7YkhNuk3i3HVGUlF4O07YGFW1lSC4lbCaq3KWoZT3CX/9SG03p91R3hstZW51CBeziAZafZrzLlYVsJ+kxxK4FZvYA9DhsHmK0oikOKyV2xt5UXPZvC4Q/HAS91zp6ml7MwgKxc7RfvnPxQm/rjW9MOsSX/n9nudqsAohO4z00OtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5776.namprd11.prod.outlook.com (2603:10b6:303:183::9)
 by EA8PPF8DD15FF6B.namprd11.prod.outlook.com
 (2603:10b6:30f:fff5::795) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Mon, 5 Oct
 2026 17:23:51 +0000
Received: from MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::b568:69e9:7abf:180e]) by MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::b568:69e9:7abf:180e%4]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 17:23:50 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH i-g-t v1 2/5] tests/intel/kms_alpm: add ALPM helper
 functions
Thread-Topic: [PATCH i-g-t v1 2/5] tests/intel/kms_alpm: add ALPM helper
 functions
Thread-Index: AQHdT/Gsw6vFgB6UnUiuJPggsME6UbbvNq/w
Date: Mon, 5 Oct 2026 17:23:50 +0000
Message-ID: <MW4PR11MB5776315C3EEF8330883FFA67DA962@MW4PR11MB5776.namprd11.prod.outlook.com>
References: <20260929090454.2796967-1-sowmiya.s@intel.com>
 <20260929090454.2796967-3-sowmiya.s@intel.com>
In-Reply-To: <20260929090454.2796967-3-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5776:EE_|EA8PPF8DD15FF6B:EE_
x-ms-office365-filtering-correlation-id: bb7ed9a8-205e-48a1-578d-08df23056c18
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|4143699003|6133799003|3023799007|11063799006|5023799004|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: 2V1Z0LwXBey84FugmbbIiPKAgeW/FYmgS9QU/nD7wbLvHLDXg4kuhH/kzZYdmMiJETG5+jQCF0IyWXR/tVA4NBKkIxg/t6SJGKQWGbNN4bw0MeFv9UsS69QQ/9UXDKV4nyBSuFGZ+QlweUWVXxwkS4kVXaP+i3no3h+NdOsn/2MeFgwj5V50o9Ozno+PGPXbIn83bshFMaMUR3v5sIoiZfXuoQacTjSxBTc9D75AT0uUJyFbO7+rjs4xx7nJAIpqZMpqHtarnQizfppktkI9PI6G9/OuiJYZSe58ZXcpo3NTI3qBfUyguE7EpUCYu24d2MhalFce89OAdiKJW/cqPTCw95iFD7RqrGxknClDrKgjArCZn9hnDdY1hTDyVwlatCjYBPLGlyYEt6o2ppu7dQSS6GrKNI5w//WrL0DAaND4V/Rh5PlYIzjZZDNqeIagxKBiarUpXIVt9tCztDEUFHj/aCvcFmH1jZwK8NFvUCJ8fsy6D/7rl1n9sfy/IbE+3jioEfZ6BHGsghQWRyt1hABF8EHKKJAU1SbLVSFAc0ST8eG8h3ID2wPeYsGouzPyrTPGPeX4AS8sr/0HfAyrPqV5GPmjJ1u9xARn+ywI/JG3kiAnoNzc7yT7tT076xDFzWw0wmJcghZeFMsWJmz04Gom8kLO3eXWH3BlSmuidAgK0+UPMi6f62xCr5D452ZMF4COpyRt1vYU6f67K+2po1mj1HTC6Aar1dJDQpaJues=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5776.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(4143699003)(6133799003)(3023799007)(11063799006)(5023799004)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lshbmDL7ztb6gQsKStrc/b5gkk7cgP6OqHJLFqrTvuUGe8p2UTaXdK+zfO3a?=
 =?us-ascii?Q?AKHPMI6VOU2r/1piMdRqYLisKXcRGge+06G71NxC2wKjha1S/xUCuhdzHI0l?=
 =?us-ascii?Q?1+PpoqX6kmc7dbug6N3BO7Jse1UhHcHW98T/wK8ny1L3jrEwBSW/KzYoAmew?=
 =?us-ascii?Q?d7Qr6AAOm93MiKqa6ga4zAAt9tzoXZpOdKbaS9cR3DS2xoEkLHW2BpxCdZx/?=
 =?us-ascii?Q?FUvNujFE57U/6DvhBhE5b0JwEiyHhYoHjmjCb0FJI1zJf+0z0xyQvYmEZ7jM?=
 =?us-ascii?Q?9BZ7h8tRhhYDuQZLh4qkZQQBxnBX8T/GZ8XxaVxTbWBXu9Q4avSPY9LLwd7B?=
 =?us-ascii?Q?hcjmjEh3Gplg2yAHuWdD9cLHaS4AZvRY+oMhoXrOWGHHWNQSYXRdf+bh8xfR?=
 =?us-ascii?Q?UPSZTnOKVhYuHOTuxoyqZE7hP5FFN8q6/Rf++GHeOdknrT8xRCHkdjIbhHQv?=
 =?us-ascii?Q?2+Qlm8mqavEqGGhmbyTgz58NKKTURZU8Ft4oplGzN/rWeNHrGERNSqyEkQ21?=
 =?us-ascii?Q?3s/VAWH8P1z19823Juvb0JQPX2bRA2sNmNrsNCe/8Y+TiaqFfpAQiK/80ezv?=
 =?us-ascii?Q?ZPHCRcxlXPywCWIKuMIaXtxMIomhqWmxhdICzCURhm+7hmWWMd36CgfKWoGc?=
 =?us-ascii?Q?kg7YYsLCk5CL8i7RRHOULxY3Wqf58dcOm+U8StBlgO9iYQUNMl1U1qusVdIx?=
 =?us-ascii?Q?6UV6enZGah2G2a5GuaLfF26QBGQ4F7wZzmf5y2VmqEj1eDVcRbVE69Ilpxrs?=
 =?us-ascii?Q?K7KSKHkYXcIliBLxwlm7CBHlTGZl6m39k0jSSTENya28cdlo17tTAlx/N8Id?=
 =?us-ascii?Q?csI53+JFUnKOvWZhvRlGzcE1JzyODhM24FSuiLJSy6o9xu0y0YatLUjcKJb/?=
 =?us-ascii?Q?3F7WDhtDEae2VoSQbR2Sx1Y1zMVPz8fWurioY/K1y1FiulwFeIsNOlXrMkeY?=
 =?us-ascii?Q?WMw7eEhETKCc4K7WHMcR7CqNRlofQ1vh/JIoSCGUnYa9/4JlI3nssNrBdi86?=
 =?us-ascii?Q?M1hxiR9pOBDR+zj8IkiNvT6nMYvXOHZktiOZBHVjgqVYKAhDjFvKA35XIr6L?=
 =?us-ascii?Q?tJ28UuU5iQF8qk/cbW+cEvHRjygQlsomZ65SMY6EuOpOb8yp+41000vSHA5e?=
 =?us-ascii?Q?hvtKXS0DgdWezUJF+3RA2Ndb/WDG3T5AaiIz9sAjgehQJ8YLVY0brCL9ZfbM?=
 =?us-ascii?Q?0yeUpBjZDyyjBmU+nqsPtgmL3JNIpq0l4v5si/BnUXU5jLzHw5k4vmtiabcA?=
 =?us-ascii?Q?1e3GwGH/A7x2E/ayZP4exQF5mzjB3arM41WCzaRtgwVLFSIv5CmESIOSW7OW?=
 =?us-ascii?Q?Ku6MhDjcRXFqL/x9xNmVqbUoPWrdB8rPl93NghobunBCUn9uIS5c0Vrx6/h/?=
 =?us-ascii?Q?G5taaPFDnFLH9UIHlwaTvGfLOd7tjHeSbZCyONTXqCrgVcztDRNN2VwFGnyG?=
 =?us-ascii?Q?zHciFQH3JjUZruXlDGlhFMGJxif/7unqE9qm8I74S1pJZNU1mMrSeaSNyyE9?=
 =?us-ascii?Q?OMwOFCmKeHYUX2Vq6GqEztpEX+aNqP+rLj6b88wkJ364H+N+hT5U9jAziTdq?=
 =?us-ascii?Q?+bHiOMqXTSlOqnnITqru/Hkx84RiQQcxqRJaxUF0QoFc8RDaGBMH82M5LC7B?=
 =?us-ascii?Q?f8TNrUprUVQKifS+0UkZyeCmz9WO9MAiXWaqMKMJgEFjxKlRGrZbSEQB5fbt?=
 =?us-ascii?Q?dGRW8CifquiD4eu8+TlXwhLe+7wzfuODj1WgjBUys7l2wNrb1Dv45f/0pw0O?=
 =?us-ascii?Q?HpjDW0hasg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 1taRrkvCDNw8xoesAOkFwTgBqu1sxzyHPO0FQyf5JkhB0wn/YKU6pnx9bDDXRtAFNTfJaLMW4dQGqWhpWp66QkZ+BRXElfnhII9GgMptDWXprTot+kRWmHBvHqAEvpxtR8xg+tlOJMZW56y/z4MGUjHxZ/zv0tpHrCDu7eHTHV2y8qKNqXchJGf/28SJl3RRpDGyIWM+3sC4WqF/ijn9FEt6bYytT+SRS2rFckKhwj4KK65UfloucimKfXVmaC6fWj7E4k2Q/LeEZhoG3kJd6UhUoBSuG/FMUIWZZboQCg9r6L464TqMYsZl0SguGHho9Cl5ESsgM93JvsNyGTacjA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5776.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb7ed9a8-205e-48a1-578d-08df23056c18
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 17:23:50.4884 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ovd4REl3CTF1QYXxPYsUKp6JESSkJZORAzAcYAXWlGqPb8gxC60Ao+etgkRV8PmB1KtsR9N6iB6rClNQOKi0QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA8PPF8DD15FF6B
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

Hello Sowmiya,

> -----Original Message-----
> From: S, Sowmiya <sowmiya.s@intel.com>
> Sent: Tuesday, September 29, 2026 2:35 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>; Joshi, Kunal1
> <kunal1.joshi@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> Subject: [PATCH i-g-t v1 2/5] tests/intel/kms_alpm: add ALPM helper
> functions
>=20
> Add the ALPM debugfs status parsing (alpm_read_status(),
> alpm_is_enabled(), alpm_mode_str()) and the audio and capability
> preconditions (require_alpm_capable(), require_no_audio(),
> sink_supports_audio()) used by the ALPM subtests added in the following
> patches.
>=20
> alpm_dump_status(), require_alpm_capable() and require_no_audio() have
> no caller yet at this point in the series. Marked __maybe_unused until th=
e
> test harness and subtests that consume them land in the following patches=
.
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> Assisted-by: Gnai_Claude:sonnet-5
> ---
>  tests/intel/kms_alpm.c | 282
> +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 282 insertions(+)
>=20
> diff --git a/tests/intel/kms_alpm.c b/tests/intel/kms_alpm.c index
> 8bd71a981..dfdccd74e 100644
> --- a/tests/intel/kms_alpm.c
> +++ b/tests/intel/kms_alpm.c
> @@ -72,6 +72,288 @@ typedef struct {
>  	struct igt_fb fb;
>  } data_t;
>=20
> +static bool output_is_dp(igt_output_t *output);

Nit: define output_is_dp() and output_is_alpm_capable_type() before
alpm_is_enabled() and drop the forward declaration.

> +
> +/**
> + * alpm_is_enabled - is ALPM programmed, as far as debugfs can tell
> + * @output: the connector @status was read from
> + * @status: parsed ALPM status
> + *
> + * intel_alpm_configure() always sets ALPM_CTL_ALPM_ENABLE together
> +with one
> + * of the aux-less/aux-wake/LOBF bits, and writes ALPM_CTL as zero when
> + * disabling, so any of them being set is positive evidence.

This doesn't match the current kernel implementation (Specify if any new me=
rged patches modifies current logic)
=20
  - The AUX-wake branch of lnl_alpm_configure() writes only
    EXTENDED_FAST_WAKE_ENABLE | EXTENDED_FAST_WAKE_TIME(), not
    ALPM_CTL_ALPM_ENABLE or any bit tested here, so active AUX-wake
    is reported as disabled.
  - intel_alpm_disable() only clears ALPM_CTL_ALPM_ENABLE |
    ALPM_CTL_LOBF_ENABLE, so AUX_LESS_ENABLE stays set after PR
    disable. Only the LOBF disable path writes ALPM_CTL to 0.

> + *
> + * Per the HAS, DP only ever uses AUX-Less ALPM flows - AUX-Wake is not
> + * supported by this feature on DP at all (matches DPCD 00116h[2]: "0 =
=3D
> + * AUX-wake ALPM (not supported by DP). 1 =3D AUX-less ALPM (shall be se=
t
> +for
> + * DP)"), so @status->aux_wake carries no information there. eDP is
> + * different: classic PSR2 genuinely runs over AUX-Wake ALPM (the
> +kernel's
> + * intel_psr2_config_valid() calls alpm_config_valid() with
> +aux_less=3Dfalse),
> + * distinct from Panel Replay's AUX-Less, so @status->aux_wake is real
> + * evidence there and has to be counted too.
> + *
> + * On an external DP link below display ver 35 the LOBF bit is never
> +set at
> + * all (see the ALPM_DP_MIN_DISPLAY_VER check in
> +require_alpm_capable()), so
> + * there the aux-less bit is the only available evidence.
> + */
> +static bool alpm_is_enabled(igt_output_t *output, const struct
> +alpm_status *status) {
> +	if (output_is_dp(output))
> +		return status->aux_less || status->lobf;
> +
> +	return status->aux_less || status->aux_wake || status->lobf; }
> +
> +/**
> + * alpm_mode_str - which wake mechanism ALPM is using
> + * @output: the connector @status was read from
> + * @status: parsed ALPM status
> + *
> + * The two mechanisms are mutually exclusive, so the aux-less bit alone
> + * decides between them. Resolved only once ALPM is known to be up (via
> + * alpm_is_enabled()), which is what keeps a bare aux-wake line from
> +being
> + * read as a mode on DP, where it carries no information at all.
> + */
> +static const char *alpm_mode_str(igt_output_t *output, const struct
> +alpm_status *status) {
> +	if (!alpm_is_enabled(output, status))
> +		return "none";
> +
> +	return status->aux_less ? "AUX-less" : "AUX-wake"; }
> +
> +static bool output_is_dp(igt_output_t *output) {
> +	return output->config.connector->connector_type =3D=3D
> +	       DRM_MODE_CONNECTOR_DisplayPort; }
> +
> +static bool output_is_alpm_capable_type(igt_output_t *output) {
> +	int type =3D output->config.connector->connector_type;
> +
> +	return type =3D=3D DRM_MODE_CONNECTOR_DisplayPort ||
> +	       type =3D=3D DRM_MODE_CONNECTOR_eDP; }
> +
> +/*
> + * Audio is the primary limitation on ALPM: it must not be enabled on
> +an
> + * audio capable display, because with HD Audio the driver cannot tell
> + * whether audio is actually streaming and so refuses ALPM whenever an
> + * audio endpoint can be enumerated at all.
> + *
> + * Detect the sink side of that check: a CTA-861 extension either
> +declaring
> + * Basic Audio or carrying an Audio Data Block. This matters in
> +practice rather
> + * than theoretically, since the HAS lab survey found only 10 of 206 DP
> + * monitors without audio.
> + */

I can't find this rule in the kernel. As far as I can see, nothing in
intel_alpm.c, intel_psr.c or the LOBF compute path in intel_dp.c looks
at audio (has_audio / ELD). The driver will enable ALPM, through PR or LOBF=
, on a sink
that supports audio.

Please see if this check is missing in kernel if required.

> +static bool sink_supports_audio(int drm_fd, igt_output_t *output) {
> +	uint64_t edid_blob_id;
> +	drmModePropertyBlobRes *edid_blob;
> +	const struct edid *edid;
> +	bool audio =3D false;
> +	int i, j;
> +
> +	if (!kmstest_get_property(drm_fd, output->id,
> +				  DRM_MODE_OBJECT_CONNECTOR, "EDID",
> +				  NULL, &edid_blob_id, NULL) ||
> !edid_blob_id)
> +		return false;
> +
> +	edid_blob =3D drmModeGetPropertyBlob(drm_fd, edid_blob_id);
> +	if (!edid_blob)
> +		return false;
> +
> +	edid =3D (const struct edid *)edid_blob->data;
> +
> +	for (i =3D 0; i < edid->extensions_len && !audio; i++) {
> +		const struct edid_ext *ext =3D &edid->extensions[i];
> +		const struct edid_cea *cea =3D &ext->data.cea;
> +		const uint8_t *dbc =3D (const uint8_t *)cea->data;
> +		int dbc_len;
> +
> +		if (ext->tag !=3D EDID_EXT_CEA)
> +			continue;
> +
> +		if (cea->misc & EDID_CEA_BASIC_AUDIO) {
> +			audio =3D true;
> +			break;
> +		}

If an audio check stays, please don't open-code the CTA data block
walk in the test: put it in lib/igt_edid.c, or use the kernel's own
answer ("audio support:" in i915_display_info). The loop also uses
edid->extensions_len without checking it against edid_blob->length

> +
> +		/*
> +		 * dtd_start counts from the start of the extension block, and
> +		 * cea->data begins four bytes into it, past tag, revision,
> +		 * dtd_start and misc.
> +		 */
> +		dbc_len =3D cea->dtd_start < 4 ? 0 : cea->dtd_start - 4;
> +		dbc_len =3D min_t(int, dbc_len, (int)sizeof(cea->data));
> +
> +		/* Data Block Collection: three bits of tag, five of length. */
> +		for (j =3D 0; j < dbc_len; j +=3D (dbc[j] & 0x1f) + 1) {
> +			if ((dbc[j] >> 5) =3D=3D EDID_CEA_DATA_AUDIO) {
> +				audio =3D true;
> +				break;
> +			}
> +		}
> +	}
> +
> +	drmModeFreePropertyBlob(edid_blob);
> +
> +	return audio;
> +}
> +
> +/*
> + * Presence of a given file in the connector's debugfs directory,
> + * independent of whether it is currently readable. Deliberately does
> +not
> + * assert: a connector without a debugfs directory is a legitimate "not
> + * present" answer, not a test failure.
> + */
> +static bool connector_has_debugfs_file(int drm_fd, igt_output_t *output,
> +				       const char *filename)
> +{
> +	int dir, ret;
> +
> +	dir =3D igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
> +	if (dir < 0)
> +		return false;
> +
> +	ret =3D faccessat(dir, filename, F_OK, 0);
> +	close(dir);
> +
> +	return ret =3D=3D 0;
> +}
> +
> +static bool alpm_has_debugfs(int drm_fd, igt_output_t *output) {
> +	return connector_has_debugfs_file(drm_fd, output,
> ALPM_INFO_FILE); }
> +
> +static bool parse_status_line(const char *line, const char *prefix,
> +bool *out) {
> +	size_t len =3D strlen(prefix);
> +
> +	if (strncmp(line, prefix, len))
> +		return false;
> +
> +	*out =3D !strcmp(line + len, "enabled");
> +
> +	return true;
> +}
> +
> +/*
> + * Read and parse all three status lines from a single snapshot of the f=
ile.
> + *
> + * Returns false when the file cannot be read. That is an expected
> +outcome
> + * rather than an error: the kernel's show handler returns -ENODEV
> +whenever the
> + * connector is disconnected or has no CRTC attached.
> + */
> +static bool alpm_read_status(int drm_fd, igt_output_t *output,
> +			     struct alpm_status *status)

lib/igt_kms.c already has igt_has_lobf_debugfs(),
igt_get_i915_edp_lobf_status() and igt_is_aux_less_alpm_enabled() for
this file; kms_vrr's lobf subtests use them. Please extend those, e.g.
one lib helper that parses all three lines into a struct, instead of
adding a second private parser. The cross-match worry in the comment
below doesn't apply to strstr() on the full "Aux-less alpm status:
enabled" string, which is what the lib helper does.

> +{
> +	char buf[ALPM_INFO_MAX_LEN];
> +	char *line, *saveptr =3D NULL;
> +	int dir, res;
> +
> +	memset(status, 0, sizeof(*status));
> +
> +	dir =3D igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
> +	if (dir < 0)
> +		return false;
> +
> +	res =3D igt_debugfs_simple_read(dir, ALPM_INFO_FILE, buf,
> sizeof(buf));
> +	close(dir);
> +
> +	if (res <=3D 0)
> +		return false;
> +
> +	buf[min_t(int, res, (int)sizeof(buf) - 1)] =3D '\0';
> +
> +	/*
> +	 * Match on whole lines. "Aux-less alpm status" and "Aux-wake alpm
> +	 * status" share the "alpm status: " substring, so a plain strstr()
> +	 * over the whole buffer would cross-match.
> +	 */
> +	for (line =3D strtok_r(buf, "\n", &saveptr); line;
> +	     line =3D strtok_r(NULL, "\n", &saveptr)) {
> +		if (parse_status_line(line, "LOBF status: ", &status->lobf))
> +			continue;
> +		if (parse_status_line(line, "Aux-wake alpm status: ",
> +				      &status->aux_wake))
> +			continue;
> +		parse_status_line(line, "Aux-less alpm status: ",
> +				  &status->aux_less);
> +	}
> +
> +	return true;
> +}
> +
> +__maybe_unused
> +static void alpm_dump_status(int drm_fd, igt_output_t *output) {
> +	struct alpm_status status;
> +
> +	if (!alpm_read_status(drm_fd, output, &status)) {
> +		igt_info("%s: ALPM status unavailable\n", output->name);
> +		return;
> +	}
> +
> +	igt_info("%s: ALPM %s, mode %s (aux-less %s, aux-wake %s, LOBF
> %s)\n",
> +		 output->name,
> +		 alpm_is_enabled(output, &status) ? "enabled" : "disabled",
> +		 alpm_mode_str(output, &status),
> +		 status.aux_less ? "enabled" : "disabled",
> +		 status.aux_wake ? "enabled" : "disabled",
> +		 status.lobf ? "enabled" : "disabled"); }
> +
> +/*
> + * Preconditions shared by every subtest that expects ALPM to actually
> engage.
> + *
> + * Beyond these the kernel requires that the sink supports AS SDP and
> +that
> + * (set_context_latency + guardband) exceeds the first SDP position
> +plus the
> + * link wake time. Neither is visible from userspace, so neither is
> +checked
> + * here: intel_vrr_compute_config() computes the guardband for every
> +crtc
> + * once the platform has VRR hardware at all (HAS_VRR()), regardless of
> + * whether the connector itself reports vrr_capable, so vrr_capable is
> +not a
> + * reliable proxy for AS SDP support and gating on it here would risk
> +false
> + * skips. A sink that can't actually support it is instead caught
> +indirectly,
> + * by the subtest's own post-modeset wait for ALPM/Panel Replay/LOBF
> failing.
> + */

The sink caps are visible from userspace via plain DPCD reads
through /dev/drm_dp_auxN=20

  - ALPM:   DP_RECEIVER_ALPM_CAP (0x02e): bit0 AUX-wake, bit2 AUX-less
  - AS SDP: DPCD rev >=3D 0x13 and DPRX_FEATURE_ENUMERATION_LIST_CONT_1
            (0x2214) bit0, as in drm_dp_as_sdp_supported()
  - PR:     DP_PANEL_REPLAY_CAP_SUPPORT (0x0b0), or "Sink support:"
            in <conn>/i915_psr_status

Right now both subtests igt_require() the feature they test, so skip and fa=
il looks the same.
Please require the sink caps up front and make a feature that doesn't
come up an igt_assert. Only the timing conditions (window1, guardband
vs. wake lines) are really invisible from userspace.

Thanks and Regards
Kunal Joshi

> +__maybe_unused
> +static void require_alpm_capable(data_t *data, igt_output_t *output) {
> +	unsigned int ver =3D intel_display_ver(data->devid);
> +
> +	igt_require_f(output_is_alpm_capable_type(output),
> +		      "%s: not an eDP or DisplayPort output\n", output-
> >name);
> +
> +	if (output_is_dp(output))
> +		igt_require_f(ver >=3D ALPM_DP_MIN_DISPLAY_VER,
> +			      "DP2.1 ALPM needs display ver %d, have %u\n",
> +			      ALPM_DP_MIN_DISPLAY_VER, ver);
> +	else
> +		igt_require_f(ver >=3D ALPM_EDP_MIN_DISPLAY_VER,
> +			      "eDP ALPM needs display ver %d, have %u\n",
> +			      ALPM_EDP_MIN_DISPLAY_VER, ver);
> +
> +	igt_require_f(alpm_has_debugfs(data->drm_fd, output),
> +		      "%s: %s not present\n", output->name,
> ALPM_INFO_FILE); }
> +
> +/*
> + * An audio capable sink is expected to keep ALPM off, so this is a
> +skip rather
> + * than a failure for every subtest that wants ALPM to engage. Without
> +it those
> + * subtests would report a failure on the large majority of real
> +DisplayPort
> + * monitors.
> + */
> +__maybe_unused
> +static void require_no_audio(data_t *data, igt_output_t *output) {
> +	igt_require_f(!sink_supports_audio(data->drm_fd, output),
> +		      "%s: sink declares audio support, ALPM is not enabled on
> audio capable displays\n",
> +		      output->name);
> +}
> +
>  int igt_main()
>  {
>  	data_t data =3D {};
> --
> 2.43.0

