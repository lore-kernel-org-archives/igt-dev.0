Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F686E81A
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2020 08:20:40 +0000 (UTC)
From: Jani Nikula <jani.nikula@linux.intel.com>
In-Reply-To: <1EBC98102E7E77409022937977AC68920C3E4633@BGSMSX110.gar.corp.intel.com>
References: <20200307211751.22125-1-mohammed.khajapasha@intel.com>
 <20200307211751.22125-4-mohammed.khajapasha@intel.com>
 <87d09lnca7.fsf@intel.com>
 <1EBC98102E7E77409022937977AC68920C3E4633@BGSMSX110.gar.corp.intel.com>
Date: Tue, 10 Mar 2020 10:20:33 +0200
Message-ID: <878sk8oc32.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] kms/test: Pass correct pipe value
 to print pipe name
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
To: "Khajapasha, Mohammed" <mohammed.khajapasha@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 10 Mar 2020, "Khajapasha, Mohammed" <mohammed.khajapasha@intel.com> wrote:
> Are you saying, we should get rid of pipe enum and make it array index
> based? Is my understanding correct?  At present, every IGT subtest
> iterates over pipe list using "enum pipe" and this is getting passed
> down.

I am saying do not conflate enum pipe and crtc index.

If you call something a pipe, it should be the pipe, not crtc index. And
vice versa.

It gets really confusing really quick if you call something a pipe, and
then go on to convert it into a pipe, as if it wasn't a pipe already.

In i915 we've removed all assumptions that pipe == crtc index. So should
igt.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
