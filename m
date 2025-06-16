Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC62C71136
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 14:26:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 167FE10E3CA;
	Mon, 16 Jun 2025 14:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gYFRQFBd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAAEB10E3CA
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 14:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750084007; x=1781620007;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jNTTlrqCRiFyLQoeODGZc9JHvRKlJuE8Y04R5xZz8sc=;
 b=gYFRQFBd6rME3u9P8X84ZAdOc+SJ+6zSNhBRGRdxGDnYJWp9Dn7+iklQ
 bStz+dn19qf9tgz3PDCysvd/WdESvL/aCCUUfn9Xmymn+a/q51SosJCac
 DxN1KcJx3NuCYwU5aKXFHclXuyIAbGS7a53JBzLTnOxX/VwggY+8+YZU0
 iPrUCxHWEvxRn9RarShOL1fM/1HE8D8nbciSc9tWB1JyrhUZoZL9/PwqP
 dUnjA7Z3aJ7sjBrO16+nCieXoUGFIaDyecAqMlzOS3ezFvV7SfTb16Vth
 LHXUP1VYa1FvUoKDQfyVxcR41n1Z1AKDZQaFLy7xRM0x6Jtx6C4ovfQMk Q==;
X-CSE-ConnectionGUID: 4nZ3n2q3RXO1qyrlyItpWA==
X-CSE-MsgGUID: oOTKyMV5QKSfgQPG1xaUrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="51341546"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="51341546"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 07:26:46 -0700
X-CSE-ConnectionGUID: XhwsvUTJRcOofHDxkT+mxA==
X-CSE-MsgGUID: 1hvDjY/GQtGWvvGLkK9EsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="185747110"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 07:26:46 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 07:26:45 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 07:26:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.69) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 07:26:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJFI1rFjAuf4YqW2BKpFV6skXBiFeaJVPNYiRl/HyvP8Cu+QT+v/2blz0D0jCh/BIZNAnZS1ohof52vajDg7zi9lm1BAh4sybQ/v1/6w8l33BCFoYI58OgqepLxIOSPrgfB+yirX+p8s6ZXYwTNnT+PJyNbr+F5sV4CS8q/Kn/NJLPuuGz1fPLh73B9QG+VeR7uczknR6jeNQtyXBaZOAa7ypyxa+8PKaDd/NyGoogv2PnWhFLfYemuyYMPfjxEagtDLfHVdaWPhV+kjIV3XiQs7rCLcm1G1H4aR40AxH4n7kc1hq3ZQKgkRXuDx0FI90bfjOrefswjCEiie2VNirA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCnlT/ZTJu6J5JR2+z0nAsBDh+aIq70O5nd4YYF1wUM=;
 b=MWK8hLsxXPQSAAZrKc4E5fsULoZhMawyNxlZ1Kq6DOTa4KAkVtK9FJg/3EL44KYXmzrFW2GXWgDuv+8iptPk9fy2PdLHNCkMX5VPQqIgDSLu9yyZOEVQa9jN6lDvmK7+4OpsAfs4VF0zrV6dbDcAhiRFFAbJbgDA2JmEUb8xgi/d+p9V04eYCDrGjJBjl9HigP0uyTnj+rHKQCkXPHAkTBKMGyiCU9dzgHy5O5ov2NNmgvUYZWWt4EOjNw3BV28bUDA0BZUe6NrZLBrITuHbOzZQ2YIQFw30rwjUX94LLRG24VVd/dgmrslCFIXoR+dwKeJ++3vVHhh/3Qs93owacw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Mon, 16 Jun
 2025 14:26:27 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%7]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 14:26:27 +0000
Message-ID: <816bbe20-9cdb-434b-9fb2-1544ed6ce288@intel.com>
Date: Mon, 16 Jun 2025 16:26:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/2] tests/intel/xe_*: Use NEEDS_VISIBLE_VRAM
 flag where it's missing
To: Matthew Auld <matthew.auld@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@intel.com>
References: <20250616085417.20178-1-lukasz.laguna@intel.com>
 <20250616085417.20178-2-lukasz.laguna@intel.com>
 <2bb2b078-f903-4a4d-8e29-8ff31f59c05b@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <2bb2b078-f903-4a4d-8e29-8ff31f59c05b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::26) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|IA1PR11MB6097:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a8b9566-6905-44ea-5d8d-08ddace1c7b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3IrTDFLMnRBVmVNOVgxeFMvbnpGY1JpVFRWOGs4UHd5SXVLcjlFdkJZZTFZ?=
 =?utf-8?B?Vnc5eDlRS1ZWK09NNU84NlI4N3hoQ1JjU1NuY0V1c3R1TSszYzVpMG5Ja2FV?=
 =?utf-8?B?SExjWktlME9UWVl4cDRaMkk1ajFyemw3NHoyT1pYOEF1OEJCVnd1U2RuS0Yz?=
 =?utf-8?B?YWpkNGxyMkpVOUEzRGhyMElSTFh0ZXBlQ1pqb2FzU2lBeDRocTlrci9NVTBx?=
 =?utf-8?B?bUZVKzdoOXJPbHFhTWVEZW56WVk3WEFtaWRkeFA1ZGx0dmRCcEo0NmIwZEt1?=
 =?utf-8?B?M1hrN0pXbzlQVjJnbXE3MG9MSFNZbXV0WnRrbk55NE9USi9QYkl3bDB4aHky?=
 =?utf-8?B?R2pEYW5WbmVpYkc1RzYwbWJUeGxzNkg5SFJ6RVMzZWo4OUtsRmd3cm1oZFo2?=
 =?utf-8?B?cEo1c1pGdjNaNStQMHZqSWlidHZPaHVCSGpDcC8rSEpCbUtnTm4zMDV5Z1RE?=
 =?utf-8?B?YjVZLzltNlBnbXM4Vy9tdldBZ1VmS1Zwd0pFRzhmSFlRU3pSQ3BVVjlNdldJ?=
 =?utf-8?B?bVFJUk5kbDRYZjJxSFYramtvUnBSSllmNEtmSGhJK0h3T1h5aHlkajRuZGZ2?=
 =?utf-8?B?TUViU1FCU2o1UDBEUExZZ1hrV2h3UkI3MmpGOTVleUN5clNHZXZCZ05GMmxE?=
 =?utf-8?B?VHJrVFYwSW9VbGMzcVNCVWh4aGw3a1FEa1orYlArN0tzdUt6UW1idDNLTXNS?=
 =?utf-8?B?NXBsVEVERThxTWRkazNUY1BqeWVGWW5mL3ExZjZoR0w1OU9zRmx4c1M1S1VT?=
 =?utf-8?B?dmNQWnZjY1h2bHFZVDlMcHhmckVOcFdwb1BibDJwOFQzR01CazU5L2JhN0VL?=
 =?utf-8?B?a2FnNkdYUHF0QjN1WCthYW55aHAyOUZwL2xPL1daTXpPYzk5UVZyTnlIeHJ5?=
 =?utf-8?B?eUFwVGZtb2xHVndVY1REWko0STlFdDNoaE93alNMZ0daMHZabnljZTRwWVZN?=
 =?utf-8?B?NEpEaGM4WE5LODFORE9rd0NIckxqakdmVGF4TWV1dC9pSXRLLzk0MklQbEJX?=
 =?utf-8?B?YUh2cTQ5UGV0Rk9LckRrWjloRU5mYzdaeDAvK3QwNkxDcGFyeDBKdXkyQXlo?=
 =?utf-8?B?bTBDNURJb3cxTk1QV0h2TjhQYS9UTGlSMUprOWhpTmg3L253R2t6a3VTL0hw?=
 =?utf-8?B?MXcyQjhMWFNlSVJEdE9IZUJxOHRqMHFYK0VqY0FDNGc5VENNaDRWd0graUVJ?=
 =?utf-8?B?Z3FGalphZWRHTU16WlJ4ekFjU2VUZDZIZkhRS0o0RTZLRkQxVEhETm5teko5?=
 =?utf-8?B?ajlhRWhIdlZ4ejBIYk11aW0wK2dtYlF1c2lZOHcwdWVxYnA1RHBSSWM0ZzlS?=
 =?utf-8?B?K0piYXE4SXc2dDFJSExMVWxjaXN6VWdPb0tlSTZyZ0RBbm1tRElGRHJPRUZp?=
 =?utf-8?B?TkdOalRtU2hydzRxajg3ZlFidkpzYVMvSFAxR0d3T1VWTmJ2NFltWXd3NG1j?=
 =?utf-8?B?VHNIazdyTFlwY1h3SThDYnQ3cnFROTExS3NBcW9QS0syREJ1aHFObndkWkN1?=
 =?utf-8?B?cmwzeE5zT0VMaUVBVjJSbUdCcnhlZDlSRysrYkVmUkEyanQ2clVhcFlyWHk2?=
 =?utf-8?B?dmIrdkxDbGI0cTNzZDVTWSt1NmNIVHpJZlJneG1FZDhJUHlBWlZqaURoZFMv?=
 =?utf-8?B?WTZhN2pJdVlQWDl6c2x5RXlmQjFCcmJEQXBxTGpvZVZJdDE1ajQzdDl3VFlT?=
 =?utf-8?B?aGRHS2ZSQVZzOVB6Y3ZBSWcyUnQ5aWU3RDIxVlY2dHRra3kxNmExdkI0VHJs?=
 =?utf-8?B?Tm5nQ09PcXo0RDBFUEVnR2hIYkxQYmlEcytIY3cwUmloTXJTU2c1NnVYWDNl?=
 =?utf-8?Q?W9Gc8B/HMHbW5H6/GfhkZl058oIW0zB25SMy4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDBOenRkOUY0dGZNemN4YlNucVN5eHhCeGV5ViszdHlvMXlxV3NEdEI1amZ6?=
 =?utf-8?B?UmM3ejI2MWFqeE96RG9Ld0NBZkhubzZ3VkVZNCt3T2wvRXZzRExpd0NqUitP?=
 =?utf-8?B?RDBFMzltTHpadDRRZTVXU3JSSkVwTm9uYlNvdWEzOHBOSWJIVDVBb1FWbmYw?=
 =?utf-8?B?NWRmYU5tRnJ1VE9xYWh2V3B1aHpjYnFyUkx5YW5WaUJRckFodlFIVytSTUVM?=
 =?utf-8?B?bVFwamRwb2wyYnRyZDVSVk5GQVBwaVpyUncwUzRvbG5WRkJUbUloWTUvVDZZ?=
 =?utf-8?B?dkl0d1ZWVlhUQnhqQVp0eENDbWJHaWpJR1NwYWpzaHpUU1BSUVV6emJwMlEx?=
 =?utf-8?B?dzRNWkJEdEtxUEI3NnA3V2R5WHNoTHpVYVMxRExoVmNDeFhrTm5CcVMvNXFV?=
 =?utf-8?B?RXJMSzY2Wm14L1dJZVpheWxJU1hTa0lmaThoRlZUTERid25vWG1jeUR1VHly?=
 =?utf-8?B?WTd0YmF1eGppa1lSRFIya1IxYkdmb3piNEU0UmtualQrUkE2TDJ2QWNVNzBp?=
 =?utf-8?B?ampEVEhORFRjSFF6MUZ3WUlrNnhsb0RUREV1RTlwUmhiUGYyUk9ncHcvRmpz?=
 =?utf-8?B?emw3U3hCMWtsV1BiRGxaV0VMZ0JZSTlJQUFrSVY5dE16U3RiNnN0UWxzbjBH?=
 =?utf-8?B?VEVDVEFFNituZGtkZkhmV2xsQXdIK1MrS08yWWk1eHdyNnhFYnJnSDJpK0RN?=
 =?utf-8?B?SWZIL2hVV0V1STZlU08wVWk1b3JCc0tyS2RackZNa2loNTNYd2pKdFRvS3E3?=
 =?utf-8?B?cTRqQ21ib3pjSGtaMjd2TGR1TGs3VEhLSVNOMjc3ci81QlM0Vjg3YmV6Y3gz?=
 =?utf-8?B?L2pGcmNlWTVrKy8yTER3T3NKT05lRDNKOXJKZ1R6VyttbXptWmM5K213STF5?=
 =?utf-8?B?TmorOFJoUDlJTVIvOS9hd1BOdGZjNmtCam5jVWxsQkl5QWhsaHVSZmExRmND?=
 =?utf-8?B?OS82SjJsUFhiNXRYaTlXczlndmI1ZXZYNXBUbzJCano5SFB4T0g1SUxRWGhx?=
 =?utf-8?B?cG9vRHdIZEFBelZjZnJxZHNkb3VPV1VqRHZWSGsxcVpYcThCTTk4ZjlZSGE3?=
 =?utf-8?B?MndJVjZKU0VxRDZ4UUxwTjR6ZDNaZ2hQbVBXWk5GZHM2QmdSbXVqS1RFSHpG?=
 =?utf-8?B?OUhmMEwvQjhLQUIzUEJQUDR2em5UNkc4RDRZQzhPYmtub3o0UkF1OXNsOGxG?=
 =?utf-8?B?TTFSR3dzQ0Q5MjdvdERoeEk0VlJ0Zm9IQS9mUUVONkZGR1JnYk9mRUJOVjRo?=
 =?utf-8?B?RkJncWh4SWQ1VHBhcG5mNUtYOHVUclhWVGQ4ODVTb2JTTERqZk5DTVdtZ2JK?=
 =?utf-8?B?RzBuci9NWkRDMWR3UGU3ckNEUms1bGhwQklvRHdMdDFpMityTllrUGcydDJT?=
 =?utf-8?B?bml2UW9zTVZPVnMwdjdZWm5vbXVHdU1xRHBtUlZoT3dTZTllc2RteG9UMG9Z?=
 =?utf-8?B?ckswaUZLT2h1cnVwbWxBVVFabGEzakZyZ2luTGc2Q2hJam55YlpGQW5lMVRN?=
 =?utf-8?B?Wlg4allGYjdVWVdCRXpYeHBqTS95elVvUXhVbW0zSVlZaHVaTGI0REtrak80?=
 =?utf-8?B?TW5Cdjg3U010RS94ZkxOam1mTmJ5cXFSVG14cmhqUTJnR0NLQ2E0aGN6RHZs?=
 =?utf-8?B?ditxTi95S3g4WUtXRGk1L0F5RVpoL1l0a3pVTHgzY0NyN1pKZkRmN3JRcDlM?=
 =?utf-8?B?U0RnN2VkMnhuRmJITk82NWNMYWV5c2NmR1AyN0VnMloyYU9mS2VkQllORkE2?=
 =?utf-8?B?SkpLTGNDRy9Jc08reGNxdkU5eEczcE96RTlSYnFabi9Fb09JTkVCZC9zVk1k?=
 =?utf-8?B?T3RrTUZkTjZ1UFdIU1pIbk1ncGRCczBYd0ZYS003d3JScFdPSkU1MDRXMGpO?=
 =?utf-8?B?Q0lPRkQwTElxb1ZXdXJMUDc2YitQUjBZa1hQL3B1dnY2cVdWQldKUVB2Q2Z3?=
 =?utf-8?B?blVyQ2V6MnkwbVJBVHdNNTRKekJlREJoa2ViTDhYQ1lpZmZmQzJMMXVJMWZS?=
 =?utf-8?B?UERlYllGOUs0VmZEWU9OV2pxejhlUzY5bHM2RzYxK3lNS0FXaFcwdmF3S1Fk?=
 =?utf-8?B?YWlqdi9ISHd5TER3WWVqc1ZkSEp1YjNpME9kTllJaVhucmpmajR5Y0xONFJR?=
 =?utf-8?B?RkF3TnJaQ2xaYUorR0NqV1JXemxMTW1sbUZlTGFjdytzdnJhOGUzQ0QxcnhX?=
 =?utf-8?B?ZVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a8b9566-6905-44ea-5d8d-08ddace1c7b9
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 14:26:27.8016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l95m5denZiF+r3bBcD46QnyseyuvCtdv4OsJ1dcl6U8Fj2eco4XUXaAtIf4uUWQ7z/Y/026GMrzZT8BiNToTcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6097
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

On 6/16/2025 11:31, Matthew Auld wrote:
> On 16/06/2025 09:54, Lukasz Laguna wrote:
>> Set DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM flag when creating BOs
>> that will be CPU-mapped, to ensure that the corresponding VRAM
>> allocation will use the CPU accessible part of VRAM.
>>
>> This is essential for small-bar systems, where omitting the flag may
>> cause failures or SIGBUS crashes due to the CPU accessing non-visible
>> VRAM.
>>
>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>

Thanks for review. It turned out that few other tests need the same fix, 
so I've sent another version. If you have a minute, please take a look:
https://patchwork.freedesktop.org/series/150313/#rev2

>> ---
>>   tests/intel/xe_pat.c        | 3 ++-
>>   tests/intel/xe_spin_batch.c | 3 ++-
>>   2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
>> index 88d8de9dd..8bb0ac167 100644
>> --- a/tests/intel/xe_pat.c
>> +++ b/tests/intel/xe_pat.c
>> @@ -582,7 +582,8 @@ static void prime_self_import_coh(void)
>>       fd1 = drm_open_driver(DRIVER_XE);
>>       fd2 = drm_open_driver(DRIVER_XE);
>>   -    dst_handle = xe_bo_create_caching(fd1, 0, size, 
>> all_memory_regions(fd1), 0,
>> +    dst_handle = xe_bo_create_caching(fd1, 0, size, 
>> all_memory_regions(fd1),
>> + DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
>>                         DRM_XE_GEM_CPU_CACHING_WC);
>>         dma_buf_fd = prime_handle_to_fd(fd1, dst_handle);
>> diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
>> index 21b08ba06..48a888e35 100644
>> --- a/tests/intel/xe_spin_batch.c
>> +++ b/tests/intel/xe_spin_batch.c
>> @@ -442,7 +442,8 @@ static void exec_store(int fd, struct 
>> drm_xe_engine_class_instance *eci,
>>       vm = xe_vm_create(fd, 0, 0);
>>       exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
>>       bb_size = xe_bb_size(fd, sizeof(*data));
>> -    bb = xe_bo_create(fd, vm, bb_size, vram_if_possible(fd, 
>> eci->gt_id), 0);
>> +    bb = xe_bo_create(fd, vm, bb_size, vram_if_possible(fd, 
>> eci->gt_id),
>> +              DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>       bb_addr = intel_allocator_alloc_with_strategy(ahnd, bb, 
>> bb_size, 0,
>>                                 ALLOC_STRATEGY_LOW_TO_HIGH);
>>       data = xe_bo_map(fd, bb, bb_size);
>
