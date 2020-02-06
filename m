Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173C46F9FA
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Feb 2020 09:04:30 +0000 (UTC)
References: <20200204100855.27627-1-lionel.g.landwerlin@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <93e87aeb-25bf-f27a-879e-9fbba037477a@intel.com>
Date: Thu, 6 Feb 2020 11:04:27 +0200
MIME-Version: 1.0
In-Reply-To: <20200204100855.27627-1-lionel.g.landwerlin@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v5 0/1] tests: add i915-query perf tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Umesh has reviewed the previous version and this one fixes TGL.
Is it okay for me to merge?

Thanks,

-Lionel

On 04/02/2020 12:08, Lionel Landwerlin wrote:
> Hi all,
>
> The TGL runner reported failures because the register for OA triggers
> etc... changed.
>
> Cheers,
>
> Lionel Landwerlin (1):
>    tests/i915-query: add new tests for perf configurations queries
>
>   tests/i915/i915_query.c | 616 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 616 insertions(+)
>
> --
> 2.25.0


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
