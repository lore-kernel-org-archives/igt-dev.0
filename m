Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1505F531FB
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 07:40:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650B610E2D1;
	Tue, 14 Apr 2026 07:40:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AchFPKk6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D66A410E2D1
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 07:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776152441; x=1807688441;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=StrC9yvnEdrkLuxvr4a3u0flrGHQT7762hV8oj+vQ8w=;
 b=AchFPKk6/FyNKQes+NlUmqUEb0nj6FwtUfiD2PciokqRqSx7jtk0PXqQ
 9PVMRKkD7mAHDcx+A1veBMsfHFNub8axr78g3lOqPQcVBdFe1Nk3BLn0r
 wizA8BZ1LhbpwP0IYxKhwrFHl7HX4Yk6qe2wHf8FAZ+HefVzXcr/6za4f
 uNte2Q86Tupe9H7046swCpPKeY5zjeNuFPjUglE3fYEgpWatRs4JgQaSE
 tE900eefQqMdmajI78YSZmbbHpog05e9ZZ/htnZM87R8BENhX7JlNcoHj
 jnvNP7wsmWx1DZ5yy2Iwo0hXbQ2zVKdrnuuVz5TooF/+/ZMycuLn+soKo w==;
X-CSE-ConnectionGUID: vJ6zZIC0Qf6qlqbd9YJlwA==
X-CSE-MsgGUID: UdIj0wJYQ+mB4P6aGvpmTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="87405935"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="87405935"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:40:41 -0700
X-CSE-ConnectionGUID: AVTGcs8RQh6+k98B0c7k2g==
X-CSE-MsgGUID: UH8LuCMEQiaPics0/24ETQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="227359299"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:40:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 00:40:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 14 Apr 2026 00:40:40 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.16) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 00:40:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CYmOv2dKSeAN7rg51lHGpPQhfq8/P1PvhnNlcdc5xwhUG2wX8inH0DnXTGFuPg+oCGza9pzqLFn4tqzFxUQCGARBNGkqfykFwcL0CtNSgOqz7/7utwgRlePoXlzIzpAmYE5ZpIKD9CzpFt52d78vpqBe1keUd0vr3z+iO9C0sf8Vr6ThmOl6J7TwMYADdsTnQfHGdX8vFkzNnJUXpOADzHkNPKQAtWSKdzXTOuzBpdn25oqgN71kFNIQkUYQR93CcKjQqFORMYLS5Ox+VktK1P38fZtmySt/qCUXNWfxU+xsrFAjHR1L9fZxctycEn6EZQuBlRDBN+zQNODzm4YY0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCnQCkCpU1IrNrpd3eIHMV2GvA9CQoj84hR5mJD4rwQ=;
 b=U8E40ph89md+4m3SrOKgEU5VN/Rz26iOoIzz/bavirqfp3mJ/h3F7HVghh2f7UURA1XNGxKxBK92W75j7Qp5jUlcbB4EbTY6rl/J2f+seWBbpSNuI9qtXYqVGt3Dm86faX1O0js5EvIEBE88O2GqhFPMFVvPVTmy0rtUSTi+JEVtn0ZiCmel3z2b2ayXwWR6DIKYeMdR3WtPtVKLtz5ys34/A4WfXeNUtO3f5149uaOZsIQrugviF6zyeU+BZyMBmAbWI4hPqBril+vWu+GmOQJS6SMwDmAD+ptxaUyauEYhDX306Qetlzx5m+n23ElsCPTwsVA+4aw5NF6J8oonuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by MW3PR11MB4730.namprd11.prod.outlook.com (2603:10b6:303:58::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 07:40:38 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 07:40:38 +0000
Date: Tue, 14 Apr 2026 07:40:26 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v3 1/5] runner: Rename dirfd to avoid clash with
 dirfd()
Message-ID: <xj4p4s7jn4ejcgqatyt5y6omb2nsc3lbl4jktba3kznq357gyv@f6fksf5wbts5>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260413201722.808673-7-zbigniew.kempczynski@intel.com>
 <20260413201722.808673-8-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260413201722.808673-8-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: TL0P290CA0014.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:5::8)
 To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|MW3PR11MB4730:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cd99df1-52cf-4752-bb69-08de99f91f04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 7fba5koHd3Lwx8MCuaIppVNoK8ABHLNtJUNYaCCzQGw5QR5/GfPm54w4H3UM2weBSCvwRJ+1RBqY0T0UDDbv/ryyyzIiVQfHuCoeC6QBD3n5cjCf2LanxkSA/25d2oaprMwXi2OgF8Y+p8cndrgZaQvLFCxygnKNk5nOLxrQCMmdsapNXm03tCXdCgCXMRX9mxD9dynNqEKrImmatG7QyAKOfn9etU/N9vua7YvplARXWMZVLWvcV87iiou6K0+8W4y4yo4kYUvlKA4YGirOodlssHWjBt+vev3c3zdO+E7aYPnwhtSds4WnxMIBDbFl9MTIYRticd0L8q3YLoxA7kqvxJAkC/9ZgV3HRuPbuVdpD9kCihJEiHq8ROMozr8TvWoR7w9FuIjSnXhOLFP4IuYomzCueT0gKtxi/G0Oo4ihx/1ZFFNcWv7mUxoHYNCpZTHaNm47RS4j9KhEl6wUY8H04Lx6ax9ph+DXW+4dG8EsJBwzzVf+LH9tF6sUg8ReG9vlgHcSiCFXCmuqHG/YBPYz8lvXAtZ8cpKqWWpA663vm5N7ynixv+9HXsLwYK4KFosZWgH9OYrTOv7FWksWmpGP1yBxMd5k5uU9ZeBHdePFG+dP7ojHopi5H2CkduQtnVXyVwqCn1V3VZBwwAIcelf8u7fS1bqWq0YzohWXcBCIjfqc0kscspZUOopigXBYK10ZO+sB37joH6oRFnE+WCRYo1N8Etp3lsocPAUP0gM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dm9WMFFvS3VGSzJiZWllWkFPWVl6RTJpdFBwakFncmpQSlRrVHBPNUFVNlZH?=
 =?utf-8?B?a1E1OUE2d2VHdUJDWVpzNC9kZTRETjQyVkx3Y081amNsSmxtMkgzUDk3UWh3?=
 =?utf-8?B?dE94Mm9ZMkVZdnZ3YnZMRUNCZ2dNeHBlM0gzMmtHU3FncHpkRmRtbGVDU1k4?=
 =?utf-8?B?bTZuTXJXLzBibmJ6SzR6d2lnNjQ3VXBhY2V2MVdmUmx4WVU5ZVBGK1BFaWs2?=
 =?utf-8?B?UzJWYTJjU0ZCd2xoZ1BteDlsVWdSbCtlVE9janV4STRseld0Y3VER0RYU2NW?=
 =?utf-8?B?S25PRit3K3BtYm1oZ29MRXdIOUpiWmpxZy9BNUZKeUp6NnFDVVFTMmJWTTN4?=
 =?utf-8?B?cGc1aGtpOFB4dVRuR2ZOS2Z6dmNQVWFZQnNJaitVMUJ6U0VaS2c0cWU1ODUr?=
 =?utf-8?B?TlJvdzVDY3B1bXh0dVNJQ1VJQ0NzTnM5ekJBeHdEdjVWZWFxYUNiU1RxQnA5?=
 =?utf-8?B?c2lZOVF3YzNuU2xzdTFIVlE0YjdJNDB4empLUkVjMzlBQzdtb0tEMnFVS01Y?=
 =?utf-8?B?UWRtRko1cDU0ckd4aFpYaUZTeEtEaHlqbTdKT3pvck5CeDJrOUVOTFlpY2l4?=
 =?utf-8?B?Y1cvT1F6cVBqVDdicE1lRDRnUllMQUllZUpKUGpPdXVPd1crUGswS2JrQXNW?=
 =?utf-8?B?V1R1U3I2N0hwbUg4T2ErRmY4VTJYdUMraEVjcHUvSXhHTVFQdEFkbkFUV0Fl?=
 =?utf-8?B?ZDkrSnFtaUxLdUd4K1FyOVlaVFVWS1pWYm5lQU52YkpSTEQ2ZnltTi9ML1k1?=
 =?utf-8?B?OVJyemtFU0RGWGZ1NlhKb2kyUWJTTE50VWlDamE3ck9QUTZwa1RaaDBIVVdW?=
 =?utf-8?B?ZVlpNmF6ZlUzMGxzYVJlaC96MlRoN0M4MnNnK3V4L3R3UjZITFBpaitjeWNQ?=
 =?utf-8?B?WjZ5L0w4K3pVYllVZWEycDNTL0YwV1NiSGxtaHlLZjE5WmJmWVErTVI5RTg0?=
 =?utf-8?B?OWY3dFFYYk1qYlZ5QlpqSGRqUnhsWmt2MEUzbzZFSDd0eDltMHdiMGtvcmRY?=
 =?utf-8?B?YzFOSU5TU3lYdVNXcTNsTXZsVHFvYXdSNWs2T2Rqc0RlSEpCU3ZNMjZ1SndK?=
 =?utf-8?B?WTBxMFFCZlVDMUxwRmRkdHNUWW5sYi9ndHg0Qy9Wc0IxK205VGVhT2NnNUov?=
 =?utf-8?B?OXpNNU1mSCtCbHg4VS9PNmwyd2s0aDdEZTQ4Y3F4SFh5b2tndXdud2ZhSkMv?=
 =?utf-8?B?QnJadzRrVi9seWR2TFk2bUpXdTRUUitrRHRPWjYvL1NnZVR0VDdCcjVNb0FE?=
 =?utf-8?B?MVYzcm80OWNjVE5FUTZGbXRIUThwc2VhZ0pCdEUrNmljZWdCMDZnbG50TW5i?=
 =?utf-8?B?ZmdmUTFLdnNnaUgzRENHVEwrOUk2eldkUFNUWVU1b2xJWmVqNFdpSlFNWmRI?=
 =?utf-8?B?cmdyNUFSMDNENWhHbmpNeGVDL3NaaEJPajJpWlpkcDZMWEx4QUxHNHJ2eUI0?=
 =?utf-8?B?UFcvbSs3RzcxQVY0VlpqM0tsbkFpZkhVbDQwTlV5MHplTldhcUoyaFA0Z2RK?=
 =?utf-8?B?eWNUaFJ1V0t4NzU1c0ZVZDdHR1pKS2dKdU1lS2E1V3hmK1lnc1pwY1pScTVV?=
 =?utf-8?B?OTE3ZHhvOGhPeFRDalhnT1BWbkZPSWlXZjdwUjRHK3lReERuRUloeklsWTVB?=
 =?utf-8?B?Njlsbk96bTcyT1Y4enRIeXRuTDBXd0pqZGRQL2ZqYUlQejU0b3ZGenp4emxk?=
 =?utf-8?B?VDRVeWpMbzVKckhGWjNZMm43QUNCQ291eUtXOERzQXozRXR2RGpCekoxUFB3?=
 =?utf-8?B?a3NHMFBwU1dFelpWNGFvVWdUM0k5MzhrbWRhQlQ3M1VScCt1MmZpam1TOVhE?=
 =?utf-8?B?MFNHdXY1VWFnR3hmd0pCRGZCVDBMZ2JNdEJkQ2lFVXBSK0d2QVE4Q3c0UnNM?=
 =?utf-8?B?RFZBTWJrZE5hWUNzaml6M0dMVTNiQnlNemFNMlhPeVl1KzhDOFFCM3Z1d0RU?=
 =?utf-8?B?RVhSRWtYa2M0Y0U0MVhaVGcxWEhnSEVZYWNPUGUyS1MzcGNkY3NtcENhQmUx?=
 =?utf-8?B?TU1VMDdacjRsU1V4NFRTYW5jV0U4eHJKWEpCbVYxL0FOdWRmMzhvUXU3MGN4?=
 =?utf-8?B?c0Vkck1uNnZTWHVwUEtVekFSMjhhTm1Fa05nTVlGVklIbldkeXJCU1FFc01n?=
 =?utf-8?B?SkZpbWFuVHJ3MW5iT3p5UGgzTWNTV3AxaTh0cktDMWhvNUhQSUY1WlF5NXRa?=
 =?utf-8?B?K0hTU0h0aW5yalYxcWNLQmdLWWtGanRsZkx0QUhDS2oxYWtGcVJyZUNHMXlX?=
 =?utf-8?B?dWpjMFk3ei84RjZhNUJMUVcwcXR3SjhYK2syMDVTTlQrNlJqaXhzWHQ4b1lv?=
 =?utf-8?B?STh3NUZLS2tNTmV3d1JnMW12U0R4TXR3SFl5NVlOdG4zRlBNRGJKYk5mOHRK?=
 =?utf-8?Q?TSqP/7Duh0RgL08w=3D?=
X-Exchange-RoutingPolicyChecked: udx+WPrR2t+yfqArdIQ6gIAGdw/6guSQ0rG9caaAf2cKjUJCHOA8s/ec+uWr83HqgZP+ZH6DeK7XtuaIozS1MKQTfmMpCrhcJyWkC16LpJTFGc1bDl8r9JbfnjWUuUx6d1UILp8cLbVL62wzGAFGSwW57lpaO6cZhRumH8mGBiUqdhr4ZRzUQHqjonMz0e+woPPvCVZ++ARJgBbIAult0CLsivgtnduvX+KYRAcws2cmSzWC0q8IOLm8G/IPWDzOiHwZTm3l9fOegdO5Wiq+8LBMZqnxoPnzKp04CiqtuPZvKos5hh+4iTeRIlhjNt5um3yUXKJcUmIgKTiukUy+mw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd99df1-52cf-4752-bb69-08de99f91f04
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 07:40:38.0596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mGWwx+014GvSQlVi+Ktvn6MayXvdIj8Vdd2NJaGQzrldbEnMxPkYPERF3ImWZFDjedbuJrrc0MLL0R/7DAietLWwfTkGUrfWcvmsX3Q2px8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4730
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

Hi Zbigniew,

> Upcoming change within execute_next_entry() will call dirfd() so
> rename local dirfd variable is necessary.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
>  runner/executor.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
