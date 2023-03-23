Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37D110E424
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 00:06:02 +0000 (UTC)
Date: Wed, 22 Mar 2023 17:05:49 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <ZBuX3QDfYyHuZ4so@orsosgc001.jf.intel.com>
References: <20230322000523.3310187-1-umesh.nerlige.ramappa@intel.com>
 <20230322000523.3310187-31-umesh.nerlige.ramappa@intel.com>
 <87y1nou6p6.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87y1nou6p6.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v4 30/31] tools/perf: Choose the right
 card
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org,
 Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Mar 22, 2023 at 08:49:41AM -0700, Dixit, Ashutosh wrote:
>On Tue, 21 Mar 2023 17:05:22 -0700, Umesh Nerlige Ramappa wrote:
>>
>> Choose the right dri card to open for perf recorder.
>
>A comment on the "why" of the change from "renderD" to "card" here would be
>nice? We cannot open OAM streams using renderD?

renderD nodes are supposed to provide non-privileged users access to the 
drm device. I had changed this because I was seeing an "Unable to open 
device" error on running the perf recorder. I tried it again and I don't 
see that error, so dropping this patch.

Thanks,
Umesh
>
>With that:
>
>Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
