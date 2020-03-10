Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F8A6E22B
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2020 16:32:01 +0000 (UTC)
References: <20200310162946.2335031-1-lionel.g.landwerlin@intel.com>
 <20200310162946.2335031-2-lionel.g.landwerlin@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <ccdedb7a-1a41-0358-d76c-844a6827b9f8@intel.com>
Date: Tue, 10 Mar 2020 18:31:59 +0200
MIME-Version: 1.0
In-Reply-To: <20200310162946.2335031-2-lionel.g.landwerlin@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/i915/perf: break generated code
 in separate files
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

On 10/03/2020 18:29, Lionel Landwerlin wrote:
> Initially all the generated code was per generation. Eventually we
> grouped it into a single file to reuse as much as possible equation
> code (this reduce binary size by a factor). So many equations are just
> the same from generation to generation.
>
> But this generated file is 200k lines long...
>
> This change puts all the metrics into a single file and then breaks
> down the metric sets per generation.


I meant equations into a single file and then ....


-Lionel


>
> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
