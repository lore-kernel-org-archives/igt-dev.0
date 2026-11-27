Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703E7606A329
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 18:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lj2jq9MM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 219E410E718;
	Fri, 27 Nov 2026 18:14:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B80112CE4
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 18:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795803108; x=1827339108;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zjWzBE+cex37QYjwkABcKxjeP7IrAYxsZijLQ7cV/Gs=;
 b=Lj2jq9MMZiCknI2i184lf21GJk3MW/4hslIHCQUyjLr08veed1k3e5kr
 qDZt/dPjvNWrd8BfwTZ2ZSAR29TM3kjRp84BmsdmatTh7H70qKcHn2on6
 XM7+B5n46z9Yu8YxWh4M7p6wDWclXcnf5NvwiODD/ePzJBGnQKSastywN
 qmEjaI6rPd0FOvx30cjIXUDUlgDdv4YHxOWwYjtddpp+qr2QFAHdUblLP
 dZ9UYBWSIm0Z+2ruB+RECNU+j+2AteNUNJHz5sw0eCw2TbNhYkMJwWEp3
 C8Kd1klWa39FiGCbFpuVW23bg0XoDGI5irRMTtWcSj1iUJG4liVW9IPWW g==;
X-CSE-ConnectionGUID: AQ4FZExMTXuRaaoVWNR2kQ==
X-CSE-MsgGUID: 5x4KVVg/S42ipdxtBlHkVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4724855"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4724855"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 10:11:48 -0800
X-CSE-ConnectionGUID: KPAk6eo0QT2ld1bAjLoIOg==
X-CSE-MsgGUID: 4m7lMBjgRdWV2BoBWm4pzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; d="scan'208";a="14462288"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 10:11:47 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 10:11:47 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 10:11:46 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.10) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 10:11:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HN+tFNXCgEyjo5J9Ec75WV9Xukz/oxtoApOflSWorP9bycvhnK4ZL7QxPjpruqtGXG44sv7ohunj/chV+WExnZPDmDvkCBNDP3oh0QHLGasu6jEmqswgVxIRdlw+v2Tfhv/Vn0Vj1pXd57QfqAft50G/h0NFJd4He8R9Db/x+q6meeeSdN7dAM+m7ToLAyujGHd7X9CyBLgELBzvYVah66fMuaVG5cr5Fes6QXH3G+GVSCxXbRczsfZjvbQTFk2QLbQDArIj47UbLLJwt7MpqOcZt7ZBCfSBOuRmjgDlZXX+RbwAAPAScwZ2WY/jSFquB1t1CRPrVo/eiG9k0fepOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pO84XDgaPFKuRf66a31zij3jowzC6/i+jndOoOg6wXM=;
 b=f39u7GMz6fXVXtNQ/4+SY3MNciACb9MY9dhlBoowNQe33RIgiKsaI0ccvqk7TOHA5dMrN5ruutmDAry7HkJv4utMxIo5F/rkHUzC4pRY8DtaQG72Pywv/U/GcKCwBwOkgC54hKhzn0wjv+0tRUaNKr5hldXVcLNRiQvdjvpab3EbHbC7iM4YqVKQ+cSzE5yBHEk3Eq0/aVIVOoOvlOwgzd/bq26Vsq0apykXQ+vN70Jal5BXsbMQyufeHrxT3i1TJdFo2fIyy3ewMpId6lQ7WwfEKNyMB66YPmMScgV5YRO2rNWaPm5ztmFxAYPC7H4m/iBtP5k1m0BU0232P+wzGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 DS0PR11MB8717.namprd11.prod.outlook.com (2603:10b6:8:1ab::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.9; Fri, 27 Nov 2026 18:11:45 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Fri, 27 Nov 2026
 18:11:45 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Zack McKevitt
 <zachary.mckevitt@oss.qualcomm.com>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [PATCH i-g-t 3/9] drm-uapi/drm_ras: Sync with kernel c95c93b6e26c
Date: Fri, 27 Nov 2026 13:11:35 -0500
Message-ID: <20261127181133.801215-12-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127181133.801215-10-rodrigo.vivi@intel.com>
References: <20261127181133.801215-10-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0075.namprd05.prod.outlook.com
 (2603:10b6:a03:332::20) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|DS0PR11MB8717:EE_
X-MS-Office365-Filtering-Correlation-Id: 98914c71-9d43-487e-d5dc-08df4cb1e52d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|11063799006|6133799003|261009223027099003|18002099003|22082099003|56012099006|10067099003|261022105027099003|261028144727099003|261026140227099003|261102123227099003|261026121527099003|261021121427099003|261022113327099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: 3NJGTCgbNMrAvM4kCD08Zt+FqsWXEsx/2PyzwtVk07sUY9oQAFgaJoMTHeGPXoGpeTOyfqY+fnqQQ5WqCiwTeioHsaYcRlPr3VztYvshiXPemmi4mceHBjgnKfwYz2wE9oryckOYCo4m9KQd4x9o0oUQBOTJroy9JNGIpO7VfY1G3uYzlEmmv9OECGeUlzBO8YN6WzHEB8zT4rgAJHJvuN7NGDlQBsGPef8vnSTA/4HxXZYS+V9tB+rrJe3/uOvc08ogAhcNIB9a/qe6rdoiuojmYinXCyZRpjsDzwr9hkN+pc7JA3btJflsTX9HNoiTqKY+qRhmVT3SdMdvbbcqmTJ2vmHM16rArNy58Dvmw0Oc5xyirWy2l9+sPh02Cp5+YFcEwdnnz7SH8XxqS37+DCq0RTQOqozHJnniqKPGpFXQQTZbcTQvBv9NjLh0hdrsZWxmGRgs2YrJiANp0eXjEVA7OrRWjX9Qra41QwgNkYSrvrss6pbjeGbw67PhAqeBPKLnipoEUYaBuNilsxYMTEVuRP0BuU15ieLd9N2Tmx3XAW0MCkaBj0hZjh+S9rlBExzhUMzqzGgJWBNEI7PewBzElok+MAvg6u4bnt6ylKTyS0PFF1EanQAfgWGv0a12ia7E7G/JRnGzpcbZCZj3+KN1XQZPpC9qZkCVqzw2MBY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(6133799003)(261009223027099003)(18002099003)(22082099003)(56012099006)(10067099003)(261022105027099003)(261028144727099003)(261026140227099003)(261102123227099003)(261026121527099003)(261021121427099003)(261022113327099003)(261021123027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1RyQzVkY2xZZ2s4QzJ4T1pKbU9XU1RtMXpkVCtDWGFmVEJDWUJTZ3RPNnBM?=
 =?utf-8?B?NHdYY0ZJQVlhck8walphVnU0cTZVcFZad2NpbkdnZDc0OFJ2ajh3TVNWeDkv?=
 =?utf-8?B?MVpHRlZ4aDhBY1AyTHdqY3J2Ky9EbkNxUk5PSndqODA4RmtkWFk1blc5d0Zp?=
 =?utf-8?B?SDdOQ1B1OG9yTzkxYWxiY1pYRVZQck5UTjc5SzdtaCtTTUp1QzRCc2wzK1F4?=
 =?utf-8?B?blNReHY1d0xGYldFbzJmZ1pjckhDQXJta2h4cm5FUmdROWhTcUFSTGliU25L?=
 =?utf-8?B?NEc0UkNiczhWbDI5aEZWd1FYem9jSUZLeGFYTlh4MzRZM3AxNGVlY0VuWjlU?=
 =?utf-8?B?YXFuRVcyT2hGcE5mdlBPZHZkUFFsWmdVMVROaVZSb3NkcWpPNkhJdlpxc2VV?=
 =?utf-8?B?d2xLU1c1V1gyM1k0UTFJTmRrRjIyUVFlKzd4dC9sSWNBd1BkaGJxZEVuaDJx?=
 =?utf-8?B?Nm9pR0lwUVg1SGlkdjZRODl0bjBJNldEbTA0Y2xiYWpmM1BSZVhnSGFVK1lJ?=
 =?utf-8?B?UlQzcXV0cGhDdFhpOVhxQk54L2c0SVlPdmRKd2FOT0swNjlVTUdidTBXU1A1?=
 =?utf-8?B?bU5mUDg3bjdSTDVPakJqNXJibVZLcmNVQjdjQnd6SVFtVzUwTzFmZzIvbHNw?=
 =?utf-8?B?ZlUzazRYY0wxSlhtRlBmdjQyaXVQZktqWXVnVFM3M0NSaUZINW5yMjlySTl0?=
 =?utf-8?B?b1lOTVZQbjVXTVlKM2crU0lHQkhmVUc4TkRWNTV1bExEWGNwSTFjWk55VWVU?=
 =?utf-8?B?cThBRkNFOXlXQ0ZnM00wKzhVQmhIUm5vckdpMXV1VHljZnR0QkM3TXByVFpD?=
 =?utf-8?B?NDNPMjA4R0NML0tSajJnWm5pdzdVZDNiWnh6YmE0Y3RhSXpLZ3k4Wlkya2Jt?=
 =?utf-8?B?cEZpaHlHMHFjTlhPeE5ueTViNERaVzc4TmZ3OEt2d09kL0RKc2tpMjFVZ1Zv?=
 =?utf-8?B?bWhCMkdsV0dmU29zam9TMHNqenI0QWExNm4vUWtNaExFQmYxaUNRQzB1Y1RX?=
 =?utf-8?B?dWZuMmVZVlNvMkpycXo2WkJRMldTZk5vdkZVbWhPWDBBazFWMFE4RmQ0WHVk?=
 =?utf-8?B?NFBic1I0eDhtOGFuN1E4TXB6dTFlUEpVK3NQLzVYNjQyMjVGbDBoaG1XaU9i?=
 =?utf-8?B?UVQxZ2tMdWgweldmVlBiaFcwWHlmSE1jKysySjZvOWMyRWtmZHNGaU9saElu?=
 =?utf-8?B?LzQvZ3dyS0NpU2VrMHJLVHQrUXI0U3NqMTZGTlViUmZldlVETEZRRER0OXJF?=
 =?utf-8?B?bWd0UXJVZCtZNk5ocWcwcTRVeFhKVVM0RWw3S0V1eFdTYUdmbkVxM2tSZ2I4?=
 =?utf-8?B?NW54cFRrenpOOWdTdmluL0Q0TUtabzBidHMweFlzdVJPZTg4dmd1N01jTkdF?=
 =?utf-8?B?azN6aTdJbUlVTDB2amRpb1RFcmNtVlpuWFBlVVVscjU1em16eWh6UTJram1S?=
 =?utf-8?B?L2Q4TnZJODFkOFNVbktrQkFNVHJneFZVNjh4VnMxUDJtQTVLc0k5OWNaMGVp?=
 =?utf-8?B?aHBuZytpVFoycURFcy9mS1VOb2JJcTNucnBtdlE5VVd5KzliWStyNkJLaFBR?=
 =?utf-8?B?QkJDUEo0MU5ZNWZHSCtuT3BPQTBtQVpGS2tzQ3NGR3Jtb21SdTZYbEk3SW5M?=
 =?utf-8?B?ZkV4S1BFTHRMRitlRW8wY1cvRnYzN0VKUkhZVGpRaEhMdHpNdHBDUjIyWjVE?=
 =?utf-8?B?YUFQb1MrQUUzMldma1FiNkNZV1Y5T3VWWW1NZjNVYWRuT1pRZG5kVTVmSFFJ?=
 =?utf-8?B?Z3dFYzRIOXY3ck9FVlBESzJHOVBLcEdwdTFIVy8wVG40OFRpS2I5SzI5a1Rh?=
 =?utf-8?B?NGdYRFU4RnFUNjZ0WFBMdHZBNDNEMUtZQStBQ0pXREF6UWh5Y0kzUjJ3Q3Vt?=
 =?utf-8?B?Y0FRdjcxQzlxUnFndU5JZzdTcU03c01Ec2N4RlVsNHpmdW4yQUxRSENvQUhZ?=
 =?utf-8?B?Rks2ZlIyVmY4KzBnbW1kMURNOGVIZ3B5a0dsVmlLbjVoeEZXaG4wT0J5dnR3?=
 =?utf-8?B?VVlPUWluVjFwTDhvMzRiTnRDK3BDSGFWaU9wcmxUOWFCU0xqSXlBclloL21t?=
 =?utf-8?B?WERHMTQ0ZXdpcFAwK3kxVCtENmtJVThuNnQrL2VSak1CWEdjelo2Z2Uyc0pv?=
 =?utf-8?B?WHlGVWRmRFZKKzkxWTI3VmFBakVNZUxoT0pQQnY0K28yK3lKaVQzeEIwbkFX?=
 =?utf-8?B?UmJYSE44WmJJcUl6ZlFNSHM4RzdncFkyaHJxcXllMlRPbUNnREg1OHN0Yzk0?=
 =?utf-8?B?M0FicG8vVHFRY3NSMFJVclRhRGhPYk1kSC9yTG9KNHA5aE9kNlBBVnN1ZG96?=
 =?utf-8?B?WUxqc29yVjV6MTJhR3psQTZqTHJ0T0NkTFFvc2VVcUlYYnBlNlg0Zz09?=
X-Exchange-RoutingPolicyChecked: cK0/NeHBKIaYWEF47hQ5BvRqp7hrBOwowJdU3z/i5WfB9OvEcRCPr0YX1A6s+wvH1voJscSPThg0iEVmzfB7WRZ+R6hZ2u2SMEAeqBWAmULaz/NwRj/f+B7B5nA3PiIKQliCdTt1m4m09rpshmrtsVkfesjztAtz2V7ZcYRIeHx1z0FDwsDR1JG6RgnETEgFXGN9slH4c8L27yE5jCgnvAtC6iAaHAGLrg+3ZiwChfv+pVNKCLOKNu7nRZd8fH+qDsUoUWdxPwEg28VlrdI8fA0L2WjTa/Ya69dzuz2H9reBSJdndVO9EoKQmpmsMbcDbxfrX+NWNO/PlUV+ja3Rcg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 98914c71-9d43-487e-d5dc-08df4cb1e52d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 18:11:44.9779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U+MNinW9PS4M0NcGYAQxtgu6PTDdmIcMBPi4Lo9ZV8D0oAT1fUm3sBBP8cjWvgslY06KwWoUMGbJjZZAwOG+MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8717
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Sync drm_ras uapi up to drm-misc-next commit c95c93b6e26c, this will
bring the following change:

c95c93b6e26c ("drm/drm_ras: Extend DRM RAS interface to include
telemetry nodes")

v3:
 - Generate the header with make headers_install (Zack).

Cc: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Reviewed-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm-uapi/drm_ras.h | 38 ++++++++++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/include/drm-uapi/drm_ras.h b/include/drm-uapi/drm_ras.h
index 54a4cf2e4..71b342bc5 100644
--- a/include/drm-uapi/drm_ras.h
+++ b/include/drm-uapi/drm_ras.h
@@ -1,7 +1,8 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2026 Intel Corporation
- */
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/* Do not edit directly, auto-generated from: */
+/*	Documentation/netlink/specs/drm_ras.yaml */
+/* YNL-GEN uapi header */
+/* To regenerate run: tools/net/ynl/ynl-regen.sh */
 
 #ifndef _LINUX_DRM_RAS_H
 #define _LINUX_DRM_RAS_H
@@ -10,11 +11,21 @@
 #define DRM_RAS_FAMILY_VERSION	1
 
 /*
- * Type of the node. Currently, only error-counter nodes are supported, which
- * expose reliability counters for a hardware/software component.
+ * Type of the node. The error-counter nodes expose reliability counters for a
+ * hardware/software component, and telemetry nodes expose an interface for
+ * reading and writing telemetry values to a device.
  */
 enum drm_ras_node_type {
 	DRM_RAS_NODE_TYPE_ERROR_COUNTER = 1,
+	DRM_RAS_NODE_TYPE_TELEMETRY,
+};
+
+/*
+ * Bitmask of access modes supported by a telemetry field.
+ */
+enum drm_ras_telemetry_field_mode {
+	DRM_RAS_TELEMETRY_FIELD_MODE_READ = 1,
+	DRM_RAS_TELEMETRY_FIELD_MODE_WRITE = 2,
 };
 
 enum {
@@ -50,6 +61,18 @@ enum {
 	DRM_RAS_A_ERROR_EVENT_ATTRS_MAX = (__DRM_RAS_A_ERROR_EVENT_ATTRS_MAX - 1)
 };
 
+enum {
+	DRM_RAS_A_TELEMETRY_ATTRS_NODE_ID = 1,
+	DRM_RAS_A_TELEMETRY_ATTRS_FIELD,
+	DRM_RAS_A_TELEMETRY_ATTRS_FIELD_NAME,
+	DRM_RAS_A_TELEMETRY_ATTRS_VALUE,
+	DRM_RAS_A_TELEMETRY_ATTRS_STATUS,
+	DRM_RAS_A_TELEMETRY_ATTRS_MODE,
+
+	__DRM_RAS_A_TELEMETRY_ATTRS_MAX,
+	DRM_RAS_A_TELEMETRY_ATTRS_MAX = (__DRM_RAS_A_TELEMETRY_ATTRS_MAX - 1)
+};
+
 enum {
 	DRM_RAS_CMD_LIST_NODES = 1,
 	DRM_RAS_CMD_GET_ERROR_COUNTER,
@@ -57,6 +80,9 @@ enum {
 	DRM_RAS_CMD_ERROR_EVENT,
 	DRM_RAS_CMD_GET_ERROR_THRESHOLD,
 	DRM_RAS_CMD_SET_ERROR_THRESHOLD,
+	DRM_RAS_CMD_TELEMETRY_GET,
+	DRM_RAS_CMD_TELEMETRY_SET,
+	DRM_RAS_CMD_TELEMETRY_LIST_FIELDS,
 
 	__DRM_RAS_CMD_MAX,
 	DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)
-- 
2.56.0

