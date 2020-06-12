Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A3396E83E
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jun 2020 07:49:35 +0000 (UTC)
Date: Fri, 12 Jun 2020 10:49:32 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200612074932.GR9497@platvala-desk.ger.corp.intel.com>
References: <20200611135238.176102-1-gwan-gyeong.mun@intel.com>
 <3c8428cf42753f6b15ed8f0d6de3632c71b5956c.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3c8428cf42753f6b15ed8f0d6de3632c71b5956c.camel@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_psr2_su: Print errno while it
 fails to read debugfs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Souza, Jose" <jose.souza@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jun 11, 2020 at 03:31:18PM +0000, Souza, Jose wrote:
> On Thu, 2020-06-11 at 16:52 +0300, Gwan-gyeong Mun wrote:
> > This tests is being sporadically skipped in CI as it is not due
> > "PSR sink not reliable: yes". This commit adds printing of debugfs
> > ("tests/kms_psr2_su: Print debugfs when skipping test"), but it is not
> > enough to track error cases.
> > It adds printing of errorno while it fails to read debugfs.
> > =

> =

> Reviewed-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>

Merged, thanks for the patch and review!


-- =

Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
