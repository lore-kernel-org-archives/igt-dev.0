Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC557CD3436
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 09:40:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67EB310E527;
	Wed,  6 May 2026 09:40:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A3DnbInr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D1010E527
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 09:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778060397; x=1809596397;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zV13WGwvg8SE+TJ4tYAhkRJrB6zrjo+NfpiZ39Jr1NQ=;
 b=A3DnbInrWbZL72E24OWHmkPwSsLQMKtTiY/FPtEYgiRnQx59kNtYtqwG
 8fJI5HOnxsUDJReccGayfUoQFmztjHhNk6saOSL8eiDaQMF8mnldnXuB/
 njt2E++vyMwfmWbw40C12s4i/IGOQs/2EGuq8Az4C1lP6SGKRmd4m655I
 mmj+gCU52keEySK0J2uCLE9+hQ/+Hc/QfIgUCQISTkzJnil2NAyBSHVZV
 UyxSVKmmHFcmFvCsd0DQ65ggDvfoEDzJ9ZgVZ+6rAcNOGD9Rn3Ti5MC/K
 9pjOPttb2FnCLgdYRFX6i4XgfJ8PjTGt494/CTfrXtVJoIm0jocCannz3 w==;
X-CSE-ConnectionGUID: /BljmvSDSwy/JA2WdxlWtg==
X-CSE-MsgGUID: Ez1uU0NvQN+dRjZ/Y4QxBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="90364523"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="90364523"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 02:39:52 -0700
X-CSE-ConnectionGUID: irT8hlb3Qamadlg90HTYhg==
X-CSE-MsgGUID: /h6bcgBwTbK2FeGMVHn3Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="231543369"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 02:39:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 02:39:51 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 02:39:51 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.37) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 02:39:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ye02nXosz7GRS49xbXT4iv3bC+cuWnHakV8HYu744YlTH1p/gM0lg2jgKQVNVCh30a0o/PFbOpSSY3gNeyo2QqTZPPdF5PEF3x1cDJAz1yxICSV3t1u0ml8oOqsbn4sorAc1lsD7VnQeZlXYuAeeXRLyI9sgVKdxxpD1ujg0k+Ov44Wmw//xvrAiPH+lCuei8QoVfapRFAJ9R6ZC3Pqxic6n8DL0p2PVoeM36X2svSfK/BYXokGsYAJ3DQ1lpkHIjRQmE9C1Gdg/fylWjMWbBQebFqZg3fr4gE6rjTc2KfjQUYd+s+CLSWY6rMYz/EGRZFIecUUEwEgtbrhlfZzi/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FocY3h6LxkoqsZH24qLTYd2+p7IrAzCDZbQOaf9Ugt4=;
 b=Mlt4JSiqZlBj/txW07WutRuKMkYD1VyOQnK3BlHlLda/dicGZbxRbrBHukGb0HFdQDSkmnnlz7G1WuYXdTmwgaX27vUvJi/GMGjerGqE1h2EcdiEncflJb+ktBEDAa+LMb10HwOlAcHWeYmr0wWc9gC4vbiWs5KEt2kOIuE4Dqp16eUMS/GndUT/O0epDTIheCSQtwTMN4EuKYq+cGxVf0RgWs/+0/Bnztw6KatGs2c7yL5H/tNwWYG4ZK7tNPMulABkSunmPjeQivbm9BSrCEKyEOCzj/AckPgPhwyI5u59w9ZBHlUfiXgQZ0/1ULdjRCCVotooSvfVWZEbTZ2Kng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ2PR11MB7645.namprd11.prod.outlook.com (2603:10b6:a03:4c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 09:39:46 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%7]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 09:39:46 +0000
Date: Wed, 6 May 2026 11:39:35 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/xe_exec_system_allocator: Don't use NaN in
 an input buffer
Message-ID: <afsMTGPrWpqAEqKm@fdugast-desk>
References: <20260504152820.3825451-2-zbigniew.kempczynski@intel.com>
 <afi8khq4u8hbAXrl@gsse-cloud1.jf.intel.com>
 <wst2lagw6o7nhkqbdgz736ehz5dwbfvhzld23aelxarvli6p63@lidk4ey5ocqf>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <wst2lagw6o7nhkqbdgz736ehz5dwbfvhzld23aelxarvli6p63@lidk4ey5ocqf>
Organization: Intel Corporation
X-ClientProxiedBy: DB8PR04CA0001.eurprd04.prod.outlook.com
 (2603:10a6:10:110::11) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ2PR11MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d64f464-261e-42b6-edaa-08deab5368b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: WBuZFfo/nlK1hg6TFavdZgrmbwpvm/BGtVqcNOtdrYH7QwuJ3dw+t4szo1R53JUM0prz+taoptsVewDXJCiwYLfkCMIrVzfKnMJQAerGjsC/YGB/CH+VT3x0/94OF5nEvNcADPG2MRT49qVbv/EUOeexdoBKD6iHz7vYgsqSRPCP2oXstkD7DhXtMqP0d/TLBU6a9QfGI1Do2Ubl8POy+U+J9Kg30m4QnIv/HUXXECYQmEmD82onogEMn5dz3Z/CxjzHOfAdL5nr9oi4YB/FAIuAYjJRkfijv+eTSiUznfridtAzgYcPKJdwqcTsA37HisCVQT6YqhabCV1+0+Ryb1yVewKfSMBV9LwZzcujLMj9khyeHstLlu2e48f3IU7YeJSSHwDBUfg1rZCHktryfyygXwDtX5OC1ZEKTQ3omjt6oaXGBMl+FBKQYuRB8EJVVrL7SkUeAo1h2i24cAVPDzc5ToIX1FpYGHUM1iSWjKuwslf0MEzyp0IcizoBwUw06oMKtns7ryia67meq4T0vnkfuqaPS3jjAAYOGVacW9UiD3IPhCh6qZn4ANYijrgg8hPJRSHqHnYN2AIlEw0bNT97vwtaxuR1VfcKw31vMfmP9NHoGo6s8fEnsoQUOwIzPx+xHXida8MOZE8Tn4wAXO6eVq2QUPC/DAXgWGDrSlbk2mPOZNpXYC4rgcDGc1v0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUIzdW4vcjd2UW1BdkxIZTB5ZEdYMFBhOHFmUk5VRFAvMi95ZW1pbWcvSXdl?=
 =?utf-8?B?ZTFrTlo1VXk2a05IbHJRVWhwM3UvYkxmMU1tVmlWdE1QUUIzcHJVQjhGSDgr?=
 =?utf-8?B?cjRCTm1Pa1FMdDhwY2l5NytBMVZEd0FqS2dQYTZTVkRlcHZjWDc4cjhveGk5?=
 =?utf-8?B?RDN6a29HbTAxYjZUNVdjMktSWTdZNmNjTXQrR1A0bW1NRzhFMGJvVVhVbVlw?=
 =?utf-8?B?TzhkNVpVMG04eG5kZm9GNzBleGY0Rzg3OEp4U2c1U01haFYycklzQUZBMXlU?=
 =?utf-8?B?NnVvRlNtSkRIQTZiQWZienJwYTFTK1JFT20xbmx4bm5uZ0Q3M2hYaDVUSVZj?=
 =?utf-8?B?MDd2YnpvTHFxNXkzdGVsNVp4amZKK05mMnlMRm5iWUJEMGF4UlVKS0NyODQx?=
 =?utf-8?B?Vmx0MEkzQmpLOVBsZkVGVGxid3JNMy9RTjlhcVBLRjZONERYOEZrRElvV0ly?=
 =?utf-8?B?em1PMllKcjRiQVNNNnR6elFyeXhaMkUvWTNSczVWODlQOUNQa3ExZTBZa1RQ?=
 =?utf-8?B?WFE1OGRuZ0RHWE44TWkrNllLdyt5Z29wZnQ5aXBzTm5WK2R5eDVXUmhiM3NU?=
 =?utf-8?B?SVQ0aHpUTmhyOFhveXZnbWE1ajJWbk0zS3dXUnRPUHVHb1k5OFg4Z1Rmcm1R?=
 =?utf-8?B?SEN4THk2djFmcld3aHpkWFpMblVsa0V2dGJZRS9BV1praXNhWlZSQjVZYWhC?=
 =?utf-8?B?RngrVHV6dnJlcytUajRiOEx4SzNXcTVCaUg0QVlXbG1kLzZ1c1FBV1JTaFkx?=
 =?utf-8?B?NW16OGpnWXVsbFBpTDhKYVRKdEZaeU9BVS8vUVloT01RTkxCcFlYNkw2a2la?=
 =?utf-8?B?MHJuSzd6UXVoWXVyVXNjRVZUc3BhamRxYTFuczIzcDZJeFoyb2ZLOUlyT05p?=
 =?utf-8?B?em5MejJDK2RYMFV6Tmhqb20zT1BlT0xSVFNaWmdMSkVmS2Fnd1FIMnA1NThS?=
 =?utf-8?B?VHdWQjRicXUzeXRoZTFWVks2VlRqcnpSWmtWb1QrZllFWHhieGpZYmJCQlRa?=
 =?utf-8?B?azdMalYxa20wUEMxS3pWdGxrZGpwMDBwQ1dNQW9jaUpzUEdYQXJMRFJ0c0tB?=
 =?utf-8?B?T2c0T2R1Tmp0dmpYYVB2dGQ4NWpaR3pDL1NmMEZhMmVOTXlLM01pMVJjL0Nr?=
 =?utf-8?B?TTN4Q0NEU1l5cklqZUlCenZOOFNwRldYUEUvWVgxRjJYVmZYWUFma2RtcEgv?=
 =?utf-8?B?Y1hZZGROekNwZnRMK1ZWVm90US9jTWxnMWxhV2ZPemVMK3dyaUZGVi92Y3pw?=
 =?utf-8?B?Q0Zod1ByQjNVNkVWbzI4SDJvZ0g4UERBZXFlNFZ2cjFOeEh6V0tZZzNjU2dj?=
 =?utf-8?B?QWRyR3BiR01rUHZuRmdzYlNqM0k4L0UrQkdQM1IyRTJGcnNsYnhQNitlVTZS?=
 =?utf-8?B?ajFKYTNyZ0hnNjJ3ZnpHbUYrS1BIVDBKU2I0bUxvdkU2Y3drNmY5YkFUa28x?=
 =?utf-8?B?RlRQeGw4b1pXK0VQR3hMR1FZQ2c1NlRYNTBSVGpHY2xPL1JodG5hRXFoVG1u?=
 =?utf-8?B?bnpGbGZQK1QwVjNJNHd3OUMwWmJvaG9IQzFyMi9Kdkt4NlJVVmhYOHlSb29n?=
 =?utf-8?B?ZGxCMWl0c2I1Qlo3dUhCeXZWMUh1cW9UdSsyVmZzVXRBTWZxYnJYSlprQlJn?=
 =?utf-8?B?a0ZlYnREeUt1OHdLT0FwRjNZMHdRaG5udHJmbjVaWXkvVkZ6QUx2YWlEdFNv?=
 =?utf-8?B?Slp2UU56dXFYWGpGTkFGN2htMitFVExKU2p2bHc3WXY2eVdMSXRrVHhFSkhL?=
 =?utf-8?B?OEdzcXRkTHd6UlhubW9GSUhtSWg4RGVSbFdNaUx1Y05wN2UzNmVJWUwrOXVa?=
 =?utf-8?B?R0MrUEIrOW1VQjkxTjN0NXB1Um1BWTBENU5JTHkwSjBZdW5HM25SdUpmTmtD?=
 =?utf-8?B?SEFOMmt4aGQwc3k3Vlc1WCtDMzdxYjVsckRDRDluY1lHTHJDSGJjMWppVDJ6?=
 =?utf-8?B?WmRvVXVXVjJrOEI4YVB1N09BU1lJTFI1VkliS3c3TjNUeUJrNkVqNGpsUFNT?=
 =?utf-8?B?Q2tTWDVFNkU5QjlNd25MOGszRTRKMjZnMllJOVQ4NitZVTArRHo4dXd2bEZD?=
 =?utf-8?B?Z2VpOUhaU1V4ZlBTUGsxK0RpcjlnOVlxKzY1aFhUUnpqVkVsUnVRQ29HSjlN?=
 =?utf-8?B?VHdnczQ2ZWJZbFVRRnh1c1BmZ3o2RXQvTjBsQlQzS2pKNGxPd3RIdGpGaC9W?=
 =?utf-8?B?RnVJaE1heWtqRStXUHd6SGt6WGYxUEF2VzVkbVVSenhwWlZqVGdYM2tkVXFO?=
 =?utf-8?B?TDUwZ1V0OHNEZDRIR3dYVER5YlBhNkZFbmQ2REtlT21hVjE2cFRsbisxU3Jj?=
 =?utf-8?B?akVvTnFQaEgyQWs1K2JXY05TWHNHdS9jN1djZ2s1WmpPV3dHWUh2QjdqTU5M?=
 =?utf-8?Q?btqhTGOoBk2CMBF4=3D?=
X-Exchange-RoutingPolicyChecked: bQCmtbHgvLTpMvSICaru8nIFU4vkZXyuDjh1iVNqpiSXd21NlTkmOh3wP9uxJc1+PfkGZ/Yt05Uqs6MTgscghevdmgF4MDtCvrvDtrxC1rY/AcY571V4VeuKj7SgOvakjGuKCgUfY4QXHc2G4WJJ/96vlNnZBNJoUS8bVTlJtGCP8ZZvzG+OnU83vxKPcJVQ1bgDggAmGmNeuSvcNt3GiLvAqKFiHZebzw7Pd86o105/uNQ0PqTlGUXkfMtxr7iR8t9AgIj0txG1OozXC1kwozG6NjQmm5lrfxPZ5X4/BiIWXIhpL+7Huf1dunDHMtBXPtF2b+6R+PI6R/z7gRQKzQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d64f464-261e-42b6-edaa-08deab5368b1
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 09:39:46.4733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3wP9j6KzCOR7gKdFWgMNecHECzbeUcPML9JPva5dUvRZ4QjPgj4ruOqkz/eDJfDMKu+WYM/m60MXVQ5NpHVpPPinIZZJb7dWg1FTrPZOkgs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7645
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

On Mon, May 04, 2026 at 07:03:27PM +0200, Zbigniew Kempczyński wrote:
> On Mon, May 04, 2026 at 08:34:42AM -0700, Matthew Brost wrote:
> > On Mon, May 04, 2026 at 05:28:21PM +0200, Zbigniew Kempczyński wrote:
> > > Setting input buffer memory to random byte (in this particular case
> > > 0xff) and then use it as a float causes doing compute square on NaN
> > > numbers. It's nothing wrong about this but comparing NaN in between
> > > returns false according to IEEE-754 rules. Buffer compare function
> > > does assertion if output is not equal to expected output so we hit
> > > this randomly in 'eu-fault*' tests.
> > > 
> > > Replace memset to loop which sets all input floats to real numbers
> > > thus avoiding NaN arithmetic and comparison.
> > > 
> > > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > ---
> > >  tests/intel/xe_exec_system_allocator.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> > > index 5580099f78..0f1d6ee9c7 100644
> > > --- a/tests/intel/xe_exec_system_allocator.c
> > > +++ b/tests/intel/xe_exec_system_allocator.c
> > > @@ -2339,7 +2339,8 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
> > >  		igt_assert(compute_input);
> > >  		env.input_addr = to_user_pointer(compute_input);
> > >  
> > > -		memset(compute_input, rand() % 255 + 1, size);
> > > +		for (int j = 0; j < env.array_size; j++)
> > > +			compute_input[j] = rand() / (float)RAND_MAX;
> > 
> > This logic can still get 0xff or 0x0...
> 
> And this logic is fine as 0xff and 0x0 are valid floats, but were
> thinking in 32-bit granularity, not 8-bit.

For consistency we could do the same in test_compute_square_userenv().

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> 
> --
> Zbigniew
> 
> > 
> > If you want to avoid 0xff or 0x0 I think this logic would work:
> > 
> > memset(compute_input, rand() % 254 + 1, size);
> 
> > 
> > >  
> > >  		xe_run_intel_compute_kernel_on_engine(fd, eci, &env, EXECENV_PREF_SYSTEM);
> > >  
> > > -- 
> > > 2.43.0
> > > 
