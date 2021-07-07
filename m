Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F7F6E1CE
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jul 2021 19:14:32 +0000 (UTC)
Date: Wed, 7 Jul 2021 15:14:28 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20210707191428.lbgog43ts6xzh5ie@outlook.office365.com>
Content-Disposition: inline
MIME-Version: 1.0
Subject: [igt-dev] How to integrate new hardware to IGT CI?
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
To: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arek@hiler.eu>, "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>, martin.peres@free.fr
Cc: jason.zhang13@amd.com, Anson Jacob <Anson.Jacob@amd.com>, nicholas.choi@amd.com, antonio.terceiro@linaro.org, "Wang,
 Yu (Charlie)" <Yu.Wang4@amd.com>, charles.oliveira@linaro.org, markyacoub@google.com
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

IGT project has a super neat integration with patchwork [1] and Gitlab
that helps the entire community to validate the IGT patches. I'm really
curious to understand how to integrate a set of machines (lab) to this
CI; more precisely, I'm curious about:

1. How the CI capture the emails from the public mailing list?
2. How the CI distributes the workload for the machines under the CI?
3. How to add a new machine to this CI?
4. Is it possible to connect external labs spread around the world?
5. Can you summarize the basic steps you see to enable a new set of
   machines to become part of this CI?

I think this sort of information can be helpful for anyone in the
community that uses IGT.

Btw, thanks a lot for implementing and maintain all of this integration
available for the entire community.

Thanks

1. An example:
https://patchwork.freedesktop.org/project/igt/series/?ordering=-last_updated
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/pipelines

-- 
Rodrigo Siqueira
https://siqueira.tech
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
