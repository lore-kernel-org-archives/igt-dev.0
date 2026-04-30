Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA58CD13D3
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 07:11:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F60010E00F;
	Thu, 30 Apr 2026 07:11:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PX213jnu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB5F10E00F
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 07:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777533103; x=1809069103;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=83lhvNYutRbRbljVkfmda80JR3BviDOt/BT/H+SiHcM=;
 b=PX213jnuwQKHvyiFqO65tyWRIzzLVcAOzs/4CGDsRwheZUYiBW3XLFN0
 O1pu143ccddrYD6rTkXKhC6qoNioL2wvo2BUjaJUexQG4XzgZp/7VwNR2
 PK8VYt6/vgdvFSrsacPSAjvGlOgfdF6LAgqN1mdFp6sts6g3hIZJwZMOw
 46nHVrohAf2sufyIVVqV++Y1vai2pbmA2ViVIJMu5AvMIrITL7V8n/eR+
 4YMsDrSuLsg7S4WNutqUqQzkdogRYG44HWxs4iVL/eoD1ZMsgWhaBjyb7
 5p1Ed2KOQnjAJdeo5S61WnzTRIuYsb7KWJjBlwwKlzF6FB5Bsz13jhfaL w==;
X-CSE-ConnectionGUID: Hq9K+h9yR72FiN3EQtsvMg==
X-CSE-MsgGUID: fDOApwaeTeOp8CGV9zhmQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="77501608"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="77501608"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 00:11:43 -0700
X-CSE-ConnectionGUID: LnV+6tyzS6WOwYHM88B9kg==
X-CSE-MsgGUID: pZwvx4HrQO+oM9eziQM2qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="257834147"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 00:11:42 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 00:11:42 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 30 Apr 2026 00:11:42 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.11) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 00:11:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqomBLnrfMrFtBCjOK8IJpU3UoqNG8Xs0NwUv2KaefPUDPvFwukVrV5gF66g2QEcELep/w8lgjEltkx/TjnTNYuKyW1DNd8vt0Q/s+MUsqw1u5yuAblr8R+utoM2eE+CpIz32mbl2pZ9yOttRWM3Wm68MkaZ0lgo/0P9VtegpEKq+0LsCY5FCgugpAy1SIO/YSLg7oxp1PdMKH56OX7oQ0RQw+28ODRlnpuM8SC779+R7TJhC5dExJGN0L8KaBIgZ20DkkCJesElSZ7JMrWWt7xr1k5t0gnLiEFGAPBCMIzknf4v02kZC5iCg9OfHSFbRAsXNXJFWPbyppr4/T+qcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83lhvNYutRbRbljVkfmda80JR3BviDOt/BT/H+SiHcM=;
 b=TEWURaVkaTsony1qN+q6w1px22uDEeYY03bTsf3gbMBbLV67V63R00byIIQBkEP5THQj+vuDPlJqqC6175uoLjFYJEub65wolwdsJYuBX56q96+yduCVIPlY3LYdh0nWXd/PHk2UPoE3rkednMLiHTjR4H9Bq6fqr+tGfWDdEUNEF5tHbjkm5NhQ2/BL6v/hpl5kFG54PkAY97M0lHM9PbEOzUQxjsBnvFSNWhG3dscH8sDmOaotqEocRW9EzwMdqzVN0TD+Qu6MoYJ+y0OJTK9kB79HZLTeVgt07CeEeNhi/Z82d7z8ROf0V6w04joTTNvqExZthrGZmHe99YefNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by SN7PR11MB7568.namprd11.prod.outlook.com (2603:10b6:806:34e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Thu, 30 Apr
 2026 07:11:34 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41%4]) with mapi id 15.20.9870.016; Thu, 30 Apr 2026
 07:11:34 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Reddy
 Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t v3 07/11] tests/intel/kms_fbcon_fbt: update the
 outdated fbc skip reasons
Thread-Topic: [PATCH i-g-t v3 07/11] tests/intel/kms_fbcon_fbt: update the
 outdated fbc skip reasons
Thread-Index: AQHczYMmoKmw+Q60wk2/4cni328eI7X3D7CAgAA2bgA=
Date: Thu, 30 Apr 2026 07:11:34 +0000
Message-ID: <d5723b19ec4fb4ee825f588715b35bdd80662759.camel@intel.com>
References: <20260416092559.88735-1-vinod.govindapillai@intel.com>
 <20260416092559.88735-8-vinod.govindapillai@intel.com>
 <0c58ac7e-b6f2-482b-b96d-e197c8c92a57@intel.com>
In-Reply-To: <0c58ac7e-b6f2-482b-b96d-e197c8c92a57@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|SN7PR11MB7568:EE_
x-ms-office365-filtering-correlation-id: 2e1f9e02-4607-41c2-f700-08dea687b661
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: FRGa5qnVrQkxMkuvLj4u/OjKnaXNOTuk4M9rMA5+0t6ORpgfoYdEqOkal0KiFn5vbZhclr3M6dlT1GIwoMWUUs3hlwhH48bbwO8YbWSOns8Pfu/+oxxNONctQFTyOtLO47BrGyqej9PBOFbNw/ej4CTy2qEDAwnB32XospoPZHwgK+gBicymS9LsipVxE6U4MFdR80FHCncDBSw5lRdac/IXZ2WalxjFb7U1dw56apu6FvPOM1XYQiYbPxaUSUsEXWPoMAMo18A2PF+OQ3G4TsiiAdlQq2ymCiwvfcwG5lK9+1qdervV5fJXix1+H8EK3V9SkMViguAqOkhZ51YlLSE/5Jv3GHCd0WqzndIISd4rAhsXhW1TVU1Jz18t6VkN2kYwr1AlPHNU63rIsypFykXe+L62mpVwOWaXh3o8dLBiekAd+FURPaVVBnp2EMTuOdTRz1r6xcjWCpAziP2rsGscI0edTrCc3rCM7gf8fNjKgUDPTD1JwkuASEi2/Mk1VChOvY6X7PSJGgzJ5rU8etE5vYnodPYbGYDiS4YxwOF+LbTQZ7mDVhXeaWjw9gnjVdGogr25Z5YxVllG+3bickfluin/gdHYZsUGE9LT5gu+CCLobn52xPugv+d/WQRUJ0WB5IG8FI+Iizc4RNRJ59BYvlSRHn5vgl/ADhlol0IhuheqSFM18i60VM0NXOEPKtdwdnMPGqdxGXYiwhWKtw8zNOHMx5iQf6QxgHD8BUYjrUc8oJk/M3WfY/S+bl+p4bdg8ke3Gx2r8fzXyaw5LLcW00HBMzD9X2LOwtd64c8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(38070700021)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dk51bU5sZEFSQ3BWTWg1OGRhUndkcmE1WjJxWm5VOXJxendqYjAxNkF5V21o?=
 =?utf-8?B?NXFxMmFvSVdqczJRT3E1RHNZTkJuTEJ6U0d0ZEphTmZnTU9LMWZEOGdIQXlE?=
 =?utf-8?B?YUVuQ2pROS8xV1lsR1h2SzMxVk5ZYng3SHlTN1djcVcvUlhWRHdIQ0xzT3J4?=
 =?utf-8?B?K3NIS2l6ZXQvQmQ1d1NUa3hyclVsYUJhcVBZcVE3enFHYzVPRHAxaXVMZk81?=
 =?utf-8?B?UGdyblhwMWI2REtwd1pkMjltVXV6Z25mWkFlby9nUWNzS0RVTjZUeGE1RUdJ?=
 =?utf-8?B?OHg3Q2ZkTWQ4anU4QkUvcElUUkVEc1lZL3YrWjNnUDNBNjEwSHB0bGcycHVl?=
 =?utf-8?B?OE1XcmxUWExNNFhhTGU3ME1XUmVlMWs4a0h4Q28zVk5qUDFVK29xdWFCUnZu?=
 =?utf-8?B?bzYxZUVaTjN0b0wybGpiUkhmQUloMmxVUXlWV0IxQWtPMFl3dndJbi9lUHVm?=
 =?utf-8?B?YWpzQ2RyT28xdDg0c2crbzJWL21CNEpQMkd6VXZsSmNNYTluUVcwR3lPNjlX?=
 =?utf-8?B?SDVrdU9KMEZOZURVNnFlbWQrN0FsaFExN0lUSUhscndGMDY4c2FBY0d2NFJT?=
 =?utf-8?B?YzgwS1NiUG1OUExQQUdvVUh0aEhlcE05VEZObXdXWnBYSzJTOURCMjd6K0Uz?=
 =?utf-8?B?SHJkcXI2WHRiUThNcWV2R25WSUN3ZkRFdDBFanBobG1EQ2p6WXVzdVg3QmEy?=
 =?utf-8?B?cjI1Z01HalpTZE41NXAzYzcxM3VTa3dFNnNsZGR6UC9Fd2VZVGN1cks4bFkr?=
 =?utf-8?B?UFBPUENQbUNoVW5UUUxDSmZ2dkRkeTdiTlFWR3ZvcHF1MWFEeEtEb0V6Qkx0?=
 =?utf-8?B?Q1VSNXpkcWhzUENSZDB5ZkZWL3FUZ0tDbnJPZ0h6OEYwSzdRNkYwQ1JiYm0x?=
 =?utf-8?B?VlJ2ZVlTamdLcFF1MDdhTTBHcnN3UzRKY0svN29ETEtlUFRqZnF2UTFBSWVo?=
 =?utf-8?B?ZUtIVnhXUy8vMHRJSFA4RVVtY25xaTdlK2RaN1Y5VElENkR5a1k5RHBOVVVu?=
 =?utf-8?B?d2NxVG1XdkpTVjJwdmxSNmJ6M1Y2b1pWY0NoRmdyeUNzMzc1M05nODBPS0w3?=
 =?utf-8?B?L1ZXVHdaWlV6elB3NGpjNzBjZmVMTjVVbnlDVCtmMWNRaFlDUkRkSzAyVDlT?=
 =?utf-8?B?WlZEWnRUdkJyV1lCNGQ1Sjg3ajdRWFA5cWFzeGQyTktxblQzaTJqYW5JTGpo?=
 =?utf-8?B?TzdqMG11c0czVm9KTU5qUHFyOHlSV25zZjhudkJJbFIrSTdYRDZNeTVPNFV0?=
 =?utf-8?B?WU9zUDRYVDBzWnF4bitScUhKNllCNklqODR5V21UMDdvTldsWFZsUmoyM0Qr?=
 =?utf-8?B?WkVUYmxUb1FDd2F2a29oYXBrd0FHMlV0NFpSSGNEUzVZZElsRGRlSldwdEZz?=
 =?utf-8?B?VGhMcXpTbEZYRXZFdkJqUmYwWGU0bTZJV05ZK3FsL3NJYWRBRHQ1bVl6WG81?=
 =?utf-8?B?SnRERlRlVWRYckhEOU9la01MWndxY25IbEh6NGErK2Q1TmRWUGVnSW5JVlE1?=
 =?utf-8?B?dUpqMXFxZ1hpYURkbW90ZjhzOFZWNVZCRE16c2V3enJpaGEyditnTzJRZExJ?=
 =?utf-8?B?WjdPdXBLc2cvL0liTnJNbTczV0swK3J0QXdBczMvcVBEOXFqQVhXOW8rWGQx?=
 =?utf-8?B?K0sxNkx4NGNpd0VDektLRmt3TVRxWSt6UCtHVzBsRm40UW9jU3g0NDlHYXZN?=
 =?utf-8?B?cWdnYlV2aURrUVNuNDFMYXkrdURLY2xlaGQ0dFpINy9RRmFBRUJkZktFNUhw?=
 =?utf-8?B?SThZb2hYL0tYYUlHa2VYZlptVkVXKytBZFh0TStIZVYxN2NYM2o5cmsxRWcx?=
 =?utf-8?B?L05FSFZ1dU9QMkxjK2Ewd3hWTm1jUng1WHJHd3ZoSXd6SFdaOFpEUzVkc1ZS?=
 =?utf-8?B?L296ZjZXeXo4NmJybStJUmxueVhKTVpocWRCUTU2dnpEclM3OTZRQ3FHUHA0?=
 =?utf-8?B?UVNFenFyamF0SE44OXJKcTNtZmovS1VhOGhjZUlmaXlJKzhxa3hBdm56cjdS?=
 =?utf-8?B?eTdXQWxJQnNlcjBLaVpYL3hRRUJ0ckxrVG12dGsvL3RjL25PZlNHS2tqR05w?=
 =?utf-8?B?N240KzU5RDY0OE1WR29ib25YT0x0dUVGWERLbHR5bzhMbmh2aThUcFN1RGxT?=
 =?utf-8?B?Qm5JblJ4TldCNlMyRXFmeExtMFQybFl1R05MWGQwa3NiL1RTM0lVb09JZDhT?=
 =?utf-8?B?dklTeDRWcjFzTEM3YUd4cjNoS21UcWxnVVVPaDdETGhPS0pXYzhEZWJLclMr?=
 =?utf-8?B?N3BJMmVYMTRkTTZ0Vm45dnlsNTFFakhuMkh0OTcxUk8rVXp0Y2RidTlwNE84?=
 =?utf-8?B?OTNNcjRGY2FkVlJxY1NPOHVJekhQWElyWXJVRUdydzJ4S3ZJMkE3eDdXVUJE?=
 =?utf-8?Q?Szr1/KuLWQ5kTwLjc9ePUPkCOV0TWMPwtO9xj0MJbPOzj?=
x-ms-exchange-antispam-messagedata-1: 0bKWKnoQLbHC4C22E8OTVBzJTlKiOPqBQ4Alecy73l8vj1rbswyAa0xZ
Content-Type: text/plain; charset="utf-8"
Content-ID: <A14DA8B8FD5B204E8013E32B4FA19E4C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: eXKvz82bLNjrfNeAMpw/aYsv0abRaUAS6kmWGY3I6FG3lui/t/FnFdiOpBVnfUTX5Tj8BVYrxtG7hPAvU5MOZSKKW5fUZNRRDK+qZP5ByIFLe06ovJm9WxIcbHk3KgBEIcgDW1gdNpSHiUud6SemWrLKjgBKWfswSM31/iMUg7XihPTMhemKhJrIm4s5meoCTdSTvFNAXp/zqRyXVKzUG/LvlhFBc0IAcctcyjBrIBLJERfLiyMSyffWEuRRPHNpVL/B01R/Dw5lxnHKWaNO8qCGsCkPfIYcmdlcpKSK0t4hEYJJ94Y49lGoNb1MI2nimdDV9qubRvHy+DQBRUIqmQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e1f9e02-4607-41c2-f700-08dea687b661
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2026 07:11:34.3751 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6UJdenjNIV8gPeTzdbs43U3FkSJv73IBgD4BKJNVuWait0qW4pSGjdWmsUBCnTFgat9lGj7LThjQaOZBH2eW7Ke9C4DjzyUEde9EAuKCd/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7568
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

T24gVGh1LCAyMDI2LTA0LTMwIGF0IDA5OjI2ICswNTMwLCBSZWRkeSBHdWRkYXRpLCBTYW50aG9z
aCB3cm90ZToNCj4gSGkgVmlub2QsDQo+IA0KPiBPbiAxNi0wNC0yMDI2IDE0OjU1LCBWaW5vZCBH
b3ZpbmRhcGlsbGFpIHdyb3RlOg0KPiA+IE5vIGZiYyByZWFzb25zIGhhdmUgYmVlbiB1cGRhdGVk
IGluIHRoZSBkcml2ZXIuIFVzZSB0aGUgc2FtZQ0KPiA+ICJubyBmYmMgcmVhc29uIiBiZWluZyBz
ZXQgaW4gdGhlIGRlYnVnZnMgYnkgdGhlIGRyaXZlci4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5
OiBWaW5vZCBHb3ZpbmRhcGlsbGFpIDx2aW5vZC5nb3ZpbmRhcGlsbGFpQGludGVsLmNvbT4NCj4g
PiAtLS0NCj4gPiDCoCB0ZXN0cy9pbnRlbC9rbXNfZmJjb25fZmJ0LmMgfCAyMiArKysrKysrKysr
LS0tLS0tLS0tLS0tDQo+ID4gwqAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEy
IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC9rbXNfZmJj
b25fZmJ0LmMNCj4gPiBiL3Rlc3RzL2ludGVsL2ttc19mYmNvbl9mYnQuYw0KPiA+IGluZGV4IGIz
NjU4MjAxMS4uNzhjNmNjNGIyIDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ludGVsL2ttc19mYmNv
bl9mYnQuYw0KPiA+ICsrKyBiL3Rlc3RzL2ludGVsL2ttc19mYmNvbl9mYnQuYw0KPiA+IEBAIC0y
OTcsMTggKzI5NywxNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgcHNyX2RlYnVnZnNfZW5hYmxlKGlu
dA0KPiA+IGRldmljZSwgaW50IGRlYnVnZnNfZmQpDQo+ID4gwqAgc3RhdGljIHZvaWQgZmJjX3Nr
aXBzX29uX2ZiY29uKGludCBkZWJ1Z2ZzX2ZkKQ0KPiA+IMKgIHsNCj4gPiDCoMKgCWNvbnN0IGNo
YXIgKnJlYXNvbnNbXSA9IHsNCj4gPiAtCQkiaW5jb21wYXRpYmxlIG1vZGUiLA0KPiA+IC0JCSJt
b2RlIHRvbyBsYXJnZSBmb3IgY29tcHJlc3Npb24iLA0KPiA+IC0JCSJmcmFtZWJ1ZmZlciBub3Qg
dGlsZWQgb3IgZmVuY2VkIiwNCj4gPiAtCQkicGl4ZWwgZm9ybWF0IGlzIGludmFsaWQiLA0KPiA+
IC0JCSJyb3RhdGlvbiB1bnN1cHBvcnRlZCIsDQo+ID4gLQkJInRpbGluZyB1bnN1cHBvcnRlZCIs
DQo+ID4gLQkJImZyYW1lYnVmZmVyIHN0cmlkZSBub3Qgc3VwcG9ydGVkIiwNCj4gPiAtCQkicGVy
LXBpeGVsIGFscGhhIGJsZW5kaW5nIGlzIGluY29tcGF0aWJsZSB3aXRoDQo+ID4gRkJDIiwNCj4g
PiAtCQkicGl4ZWwgcmF0ZSBpcyB0b28gYmlnIiwNCj4gPiAtCQkiQ0ZCIHJlcXVpcmVtZW50cyBj
aGFuZ2VkIiwNCj4gPiAtCQkicGxhbmUgWSBvZmZzZXQgaXMgbWlzYWxpZ25lZCIsDQo+ID4gLQkJ
InBsYW5lIGhlaWdodCArIG9mZnNldCBpcyBub24tbW9kdWxvIG9mIDQiDQo+ID4gKwkJInBpeGVs
IGZvcm1hdCBub3Qgc3VwcG9ydGVkIiwNCj4gPiArCQkidGlsaW5nIG5vdCBzdXBwb3J0ZWQiLA0K
PiA+ICsJCSJyb3RhdGlvbiBub3Qgc3VwcG9ydGVkIiwNCj4gPiArCQkic3RyaWRlIG5vdCBzdXBw
b3J0ZWQiLA0KPiA+ICsJCSJwZXItcGl4ZWwgYWxwaGEgbm90IHN1cHBvcnRlZCIsDQo+ID4gKwkJ
InBsYW5lIHNpemUgdG9vIGJpZyIsDQo+ID4gKwkJInN1cmZhY2Ugc2l6ZSB0b28gYmlnIiwNCj4g
PiArCQkicGxhbmUgc3RhcnQgWSBvZmZzZXQgbWlzYWxpZ25lZCIsDQo+ID4gKwkJInBsYW5lIGVu
ZCBZIG9mZnNldCBtaXNhbGlnbmVkIiwNCj4gPiArCQkicGl4ZWwgcmF0ZSB0b28gaGlnaCINCj4g
DQo+IFRoZXJlIGFyZSBvdGhlciBubyBmYmMgcmVhc29ucyBiZWluZyBzZXQgYnkgdGhlIGRyaXZl
ciBmb3IgZXg6DQo+IFZHUFUgYWN0aXZlLCBwbGFuZSBub3QgdmlzaWJsZSBldGMuIFNob3VsZG4n
dCB3ZSBjb25zaWRlciB0aGVtIGFzDQo+IHdlbGwgDQo+IGhlcmUgYWxvbmcgd2l0aCB0aGlzPw0K
PiANCj4gVGhhbmtzLA0KPiBTYW50aG9zaA0KDQpCYXNpY2FsbHkgbXkgdGhpbmtpbmcgd2FzIHRo
YXQgdGhlc2UgcmVhc29ucyBkZWZpbmVkIGluIHRoZSBjdXJyZW50IElHVA0KaGF2ZSBiZWVuIHVz
ZXMgYXMgc2tpcCByZWFzb25zLiBDdXJyZW50IHRlc3RzIHNraXBzIGJhc2VkIG9uIHRoZXNlIGFu
ZA0Kb3RoZXJ3aXNlIHRyZWF0IGl0IGFzIGEgZmFpbHVyZS4gU28gaW4gbXkgb3BpbmlvbiBpbiBj
YXNlIGlmIHdlIGhhdmUgdG8NCnRyZWF0IGFueSBvdGhlciBza2lwIHJlYXNvbiBhcyBhIGZhaWx1
cmUsIGl0IGlzIGJldHRlciB0byBhbmFseXplIGZpcnN0DQppZiB0aGUgcmVhc29uIGZvciB0aGUg
ZmFpbHVyZSBpcyBnZW51aW5lIGFuZCBhZGQgaXQgdG8gdGhlIGxpc3QuIEZvcg0KZXhhbXBsZSBm
YmMgbm90IGVuYWJsZWQgYmVjYXVzZSBwbGFuZSBub3QgdmlzaWJsZSBpcyBtaWdodCBiZSBhbiBp
c3N1ZQ0Kd2l0aCBkcml2ZXIgb3IgYSBzcGVjaWZpYyB0ZXN0IHNlcXVlbmNlIGV0YyB3aGljaCB3
ZSBzaG91bGQgY2F0Y2ggYXMgYQ0KZmFpbHVyZSBhbmQgZml4Lg0KDQpCUg0KVmlub2QgDQo=
