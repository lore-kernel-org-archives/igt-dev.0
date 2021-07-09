Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB8B6EA2F
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jul 2021 13:12:37 +0000 (UTC)
Date: Fri, 9 Jul 2021 16:12:08 +0300
From: Arkadiusz Hiler <arek@hiler.eu>
Message-ID: <20210709131208.6rff6pte27c5g7bn@hatecraft.localdomain>
References: <20210707191428.lbgog43ts6xzh5ie@outlook.office365.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210707191428.lbgog43ts6xzh5ie@outlook.office365.com>
Subject: Re: [igt-dev] How to integrate new hardware to IGT CI?
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
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: jason.zhang13@amd.com, Petri Latvala <petri.latvala@intel.com>, "Vudum,
 Lakshminarayana" <lakshminarayana.vudum@intel.com>, igt-dev@lists.freedesktop.org, Anson Jacob <Anson.Jacob@amd.com>, martin.peres@free.fr, nicholas.choi@amd.com, antonio.terceiro@linaro.org, "Wang, Yu (Charlie)" <Yu.Wang4@amd.com>, charles.oliveira@linaro.org, markyacoub@google.com
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jul 07, 2021 at 03:14:28PM -0400, Rodrigo Siqueira wrote:
> Hi,
> 
> IGT project has a super neat integration with patchwork [1] and Gitlab
> that helps the entire community to validate the IGT patches. I'm really
> curious to understand how to integrate a set of machines (lab) to this
> CI; more precisely, I'm curious about:
> 
> 1. How the CI capture the emails from the public mailing list?

Hey Rodrigo, long time no see :-)

CI is doing that using patchwork-fdo[0]. Patchwork organizes patches
into series and revisions and exposes API endpoint that allows you to
query if there's anything new since the last time you have checked[1].

Basically you query patchwork for new series/revisions for IGT every
time you are free to execute something using the timestamp of the last
series you have processed, e.g.:

https://patchwork.freedesktop.org/api/1.0/projects/igt/events/?name=series-new-revision&since=2021-07-09T07:05:29.286971

You can then download an mbox with those patches, apply it on a tree,
build it and test it.

You can then post the test results to patchwork using another
endpoint[2]. This requires authorization - you would need a patchwork
account for your CI that is granted necessary permission.

The test results are scoped under a name (e.g. Fi.CI.BAT), and we can
configure if and how patchwork sends out emails with the results.

There's quite a few people on #freedesktop (including me) who have admin
rights for patchwork and could help you with that part.

[0]: https://gitlab.freedesktop.org/patchwork-fdo/patchwork-fdo
[1]: https://gitlab.freedesktop.org/patchwork-fdo/patchwork-fdo/-/blob/master/docs/rest.rst#L187
[2]: https://gitlab.freedesktop.org/patchwork-fdo/patchwork-fdo/-/blob/master/docs/rest.rst#L591

> 2. How the CI distributes the workload for the machines under the CI?

This explain all the different kinds of runs that Intel is doing:
https://intel-gfx-ci.01.org/

> 3. How to add a new machine to this CI?

To the current CI? It's run by Intel, so you would need to ask them to
add anything to it.

You can create your own farm/CI that would do the steps explained in #1
to collect the patches, build the artifacts, execute tests and post your
own results.

> 4. Is it possible to connect external labs spread around the world?

Yes, each one of them would need to post their own results. AFAIR back
in the days there were results posted from Romania and UK.

> 5. Can you summarize the basic steps you see to enable a new set of
>    machines to become part of this CI?

I don't think Intel's backend responsible for execution is open so you
would need to roll your own.

The code behind visualisation and bug filtering is open though:
https://gitlab.freedesktop.org/gfx-ci/i915-infra/
https://gitlab.freedesktop.org/gfx-ci/cibuglog/

There's also something that Martin is working on that could help you:
http://mupuf.org/blog/2021/02/08/setting-up-a-ci-system-preparing-your-test-machine/
http://mupuf.org/blog/2021/02/10/setting-up-a-ci-system-part-2-generating-and-deploying-your-test-environment/

-- 
Cheers,
Arek

> I think this sort of information can be helpful for anyone in the
> community that uses IGT.
> 
> Btw, thanks a lot for implementing and maintain all of this integration
> available for the entire community.
> 
> Thanks
> 
> 1. An example:
> https://patchwork.freedesktop.org/project/igt/series/?ordering=-last_updated
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/pipelines
> 
> -- 
> Rodrigo Siqueira
> https://siqueira.tech
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
