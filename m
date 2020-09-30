Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8509289781
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2020 11:39:17 +0000 (UTC)
Date: Wed, 30 Sep 2020 17:09:27 +0530
From: Kunal Joshi <kunal@intel.com>
Message-ID: <20200930113927.GA3821439@intel.com>
References: <20200907032622.6837-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907032622.6837-1-mohammed.khajapasha@intel.com>
Subject: Re: [igt-dev] [PATCH] tests/kms_chamelium: Test HPD for a connector
 with all valid pipes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mohammed Khajapasha <mohammed.khajapasha@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-09-07 at 08:56:22 +0530, Mohammed Khajapasha wrote:
> Test hpd test for a connector with all valid pipes set in
> it's valid crtc mask.
> 
> Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
> ---
>  tests/kms_chamelium.c | 50 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)

Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
