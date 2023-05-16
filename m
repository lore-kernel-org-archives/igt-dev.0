Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870A210E2F8
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 07:01:45 +0000 (UTC)
Date: Tue, 16 May 2023 09:01:40 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230516090140.382c3c9b@maurocar-mobl2>
In-Reply-To: <20230515191522.hfbqhgpd2uer6zzm@kamilkon-desk1>
References: <20230515143923.1545926-1-mauro.chehab@linux.intel.com>
 <20230515191522.hfbqhgpd2uer6zzm@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] meson.build: update minimal version to
 0.48
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, 15 May 2023 21:15:22 +0200
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Hi Mauro,
> 
> On 2023-05-15 at 16:39:23 +0200, Mauro Carvalho Chehab wrote:
> > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> > 
> > changeset 8ac9440e7bec ("meson: add an option to control Xe test builds")
> > require updating a dict with values from another dict. This seems
> > to be supported only on version 0.48 or above.  
> 
> I agree but this should wait until we update image fedora-oldest-meson
> to have new meson 0.48 binary. 

I added such change at the pipeline script. Just submitted a v2:

	https://patchwork.freedesktop.org/patch/537229/?series=117774&rev=2

> Btw as you pointed out,
> Debian buster LTS uses 0.49.2 so maybe we should use that ?

I won't artificially increase the version. IMO, the best is to keep
the minimum version that it is technically possible there.

> Btw maybe we should ask community if anyone is using this old
> meson for building igt ? +cc Petri
> 
> > 
> > So, update meson minimal version.  
> - ^^^
> Please try to avoid starting sentence with "So" word, just:
> 
> Updated meson minimal version from 0.47.2 to 0.48

Ok.

Regards,
Mauro
